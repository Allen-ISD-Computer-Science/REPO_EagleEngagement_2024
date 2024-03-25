import Foundation

struct LocationHelper {

    static func haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        let radius = 6371000.0 // Radius of the Earth in meters
        let lat1Rad = lat1 * Double.pi / 180.0
        let lon1Rad = lon1 * Double.pi / 180.0
        let lat2Rad = lat2 * Double.pi / 180.0
        let lon2Rad = lon2 * Double.pi / 180.0

        // The distance in radians for latitude and longitude
        let dlat = lat2Rad - lat1Rad
        let dlon = lon2Rad - lon1Rad

        // haversine formula, allowing to calculate the distance between two coordinate points.
        let a = sin(dlat/2) * sin(dlat/2) + cos(lat1Rad) * cos(lat2Rad) * sin(dlon/2) * sin(dlon/2)
        let c = 2 * atan2(sqrt(a), sqrt(1-a))
        let distance = radius * c
        
        return distance
    }

    // uses the haversine formula to determine if two circles intersect
    static func circlesIntersect(lat1: Double, lon1: Double, radius1: Double, lat2: Double, lon2: Double, radius2: Double) -> Bool {
        let distance = haversine(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2)
        let totalRadius = radius1 + radius2
        return distance <= totalRadius
    }
}
