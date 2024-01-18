/*
VaporShell provides a minimal framework for starting Igis projects.
Copyright (C) 2021, 2022 CoderMerlin.com
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor

import Fluent
import FluentMySQLDriver

func routes(_ app: Application) throws {
    
    func serveIndex(_ req: Request) async throws -> View {
        return try await req.view.render("index.html")
    }
    
    app.get { req in
        return try await serveIndex(req)
    }

    app.get("login") { req in
        return try await serveIndex(req)
    }

    app.get("signup") { req in
        return try await serveIndex(req)
    }

    let sessionRoutes = app.grouped(User.sessionAuthenticator())
    let protectedRoutes = sessionRoutes.grouped(UserAuthenticator())

    protectedRoutes.post("login") { req in
        guard let user = req.auth.get(User.self) else {
            throw Abort(.unauthorized)
        }
        req.session.authenticate(user)
        return req.redirect(to: "/dashboard")

    }
    
    protectedRoutes.get("dashboard") { req in
        return try await serveIndex(req)        
    }
}
