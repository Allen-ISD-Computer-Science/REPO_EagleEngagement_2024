import Vapor
import Fluent
import Foundation

struct AdminController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let adminRoutes = routes.grouped("admin");
        let sessionRoutes = adminRoutes.grouped([User.sessionAuthenticator(), UserAuthenticator()])
        let adminProtectedRoutes = sessionRoutes.grouped(AdminMiddleware());

        adminProtectedRoutes.get("events", use: serveIndex);
        adminProtectedRoutes.get("events", "new", use: serveIndex);
        adminProtectedRoutes.get("events", "edit", ":id", use:serveIndex);
        
        adminProtectedRoutes.get("locations", use: serveIndex);
        adminProtectedRoutes.get("locations", "new", use: serveIndex);
        adminProtectedRoutes.get("locations", "edit", ":id", use:serveIndex);
        
        adminProtectedRoutes.get("event-requests", use: serveIndex);
        adminProtectedRoutes.get("review-checkins", use: serveIndex);
        adminProtectedRoutes.get("review-missing-points", use: serveIndex);

        let apiRoutes = adminProtectedRoutes.grouped("api");
        apiRoutes.post("events", use: fetchEvents);
        apiRoutes.post("event", ":id", use: fetchEvent);
        apiRoutes.post("events", "new", use: newEvent);
        apiRoutes.post("events", "edit", ":id", use: editEvent);

        apiRoutes.post("locations", use: fetchLocations);
        apiRoutes.post("location", ":id", use: fetchLocation);
        apiRoutes.post("locations", "new", use: newLocation);
        apiRoutes.post("locations", "edit", ":id", use: editLocation);
    }

    func serveIndex(_ req: Request) async throws -> View {
        return try await req.view.render("index.html")
    }

    struct EventsQuery : Content {
        var includePast: Bool;
        var filterByName: String;
    }

    struct EventInfo : Content {
        var id: Int;
        var name: String;
        var eventType: String;
        var locationID: Int;
        var locationName: String;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
    }

    func fetchEvents(_ req: Request) async throws -> [EventInfo] {
        let eventsQuery = try req.content.decode(EventsQuery.self);
        let includePast = eventsQuery.includePast;
               
        if (includePast) {
            let events = try await Events.query(on: req.db)
              .join(Location.self, on: \Events.$location.$id == \Location.$id)
              .sort(Events.self, \.$startDate)
              .all()
              .map { ev in
                  return EventInfo.init(id: ev.id!, name: ev.name, eventType: ev.eventType, locationID: ev.location.id!, locationName: ev.location.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate)
              };

            if (eventsQuery.filterByName.isEmpty) {
                return events;
            }

            return events.filter({
                                     $0.name.lowercased().contains(eventsQuery.filterByName.lowercased());
                                 });
        } else {
            let currentDate = Date()

            let events = try await Events.query(on: req.db)
              .join(Location.self, on: \Events.$location.$id == \Location.$id)
              .filter(Events.self, \.$endDate >= currentDate)
              .sort(Events.self, \.$startDate)
              .all()
              .map { ev in
                  return EventInfo.init(id: ev.id!, name: ev.name, eventType: ev.eventType, locationID: ev.location.id!, locationName: ev.location.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate)
              };

            if (eventsQuery.filterByName.isEmpty) {
                return events;
            }

            return events.filter({
                                     $0.name.lowercased().contains(eventsQuery.filterByName.lowercased());
                                 });
        }
    }

    struct FullEventInfo : Content {
        var id: Int;
        var name: String;
        var description: String;
        var eventType: String;
        var locationID: Int;
        var locationName: String;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
        var customImagePath: String;
    }

    func fetchEvent(_ req: Request) async throws -> FullEventInfo {
        guard let eventID = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
 
        let event = try await Events.query(on: req.db)
          .join(Location.self, on: \Events.$location.$id == \Location.$id)
          .filter(\Events.$id == eventID)
          .first()
          .map { ev in
              return FullEventInfo.init(id: ev.id!, name: ev.name, description: ev.description, eventType: ev.eventType, locationID: ev.location.id!, locationName: ev.location.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate, customImagePath: ev.customImagePath)
          };

        if (event == nil) {
            throw Abort(.badRequest, reason: "Event could not be found");
        }

        return event!;

    }

    struct ManageEventInfo : Content {
        var name: String;
        var description: String;
        var eventType: String;
        var locationID: Int;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
        var customImagePath: String;
    }

    func newEvent(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(ManageEventInfo.self);

        let event = Events(name: args.name, description: args.description, eventType: args.eventType, locationID: args.locationID, pointsWorth: args.pointsWorth, startDate: args.startDate, endDate: args.endDate, customImagePath: args.customImagePath);

        try await event.save(on: req.db);

        return Msg(success: true, msg: "Created Event!");
    }

    func editEvent(_ req: Request) async throws -> Msg {
        guard let eventID = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
 
        guard let event = try await Events.query(on: req.db)
          .filter(\.$id == eventID)
          .first() else {
            throw Abort(.badRequest, reason: "Could not find event.")
        }

        let args = try req.content.decode(ManageEventInfo.self);

        event.name = args.name;
        event.description = args.description;
        event.eventType = args.eventType;
        event.location.id = args.locationID;
        event.pointsWorth = args.pointsWorth;
        event.startDate = args.startDate;
        event.endDate = args.endDate;
        event.customImagePath = args.customImagePath;
        
        try await event.save(on: req.db);

        return Msg(success: true, msg: "Updated Event!");
    }

    struct LocationQuery : Content {
        var filterByName: String;
    }

    struct LocationInfo : Content {
        var id: Int;
        var name: String;
        var description: String;
        var address: String;
    }

    func fetchLocations(_ req: Request) async throws -> [LocationInfo] {
        let locationQuery = try req.content.decode(LocationQuery.self);
        
        let locations = try await Location.query(on: req.db)
          .all()
          .map { loc in
              LocationInfo.init(id: loc.id!, name: loc.locationName, description: loc.description, address: loc.address);
          };
        
        if (locationQuery.filterByName.isEmpty) {
            return locations;
        }
        
        return locations.filter({
                                    $0.name.lowercased().contains(locationQuery.filterByName.lowercased());
                             });
    }

    func fetchLocation(_ req: Request) async throws -> Location {
        guard let locationID = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
 
        guard let location = try await Location.query(on: req.db)
          .filter(\.$id == locationID)
          .first() else {
            throw Abort(.badRequest, reason: "Could not find location.")
        }

        return location;
    }

    struct ManageLocationInfo : Content {
        var name: String;
        var description: String;
        var address: String;
        var latitude: Float;
        var longitude: Float;
        var radius: Float;
    }
    
    func newLocation(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(ManageLocationInfo.self);

        let location = Location(name: args.name, description: args.description, address: args.address, latitude: args.latitude, longitude: args.longitude, radius: args.radius);
        
        try await location.save(on: req.db);

        return Msg(success: true, msg: "Created Location!");
    }

    func editLocation(_ req: Request) async throws -> Msg {
        guard let locationID = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }

        let args = try req.content.decode(ManageLocationInfo.self);
 
        guard let location = try await Location.query(on: req.db)
          .filter(\.$id == locationID)
          .first() else {
            throw Abort(.badRequest, reason: "Could not find location.")
        }

        location.locationName = args.name;
        location.description = args.description;
        location.address = args.address;
        location.latitude = args.latitude;
        location.longitude = args.longitude;
        location.radius = args.radius;
        
        try await location.save(on: req.db);

        return Msg(success: true, msg: "Updated Locations!");
    }
    
}
