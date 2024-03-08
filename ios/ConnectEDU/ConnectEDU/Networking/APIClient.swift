//
//  APIClient.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct APIService {
    // LOGIN
    
    static func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let body: [String: Any] = [
            "email": email,
            "password": password.base64Encode()
        ]
        
        guard let request = createRequest(urlString: Endpoints.login, httpMethod: "POST", body: body) else {
            completion(false, "Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    //    static let loginURLString = Endpoints.login
    //
    //    static func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
    //        let url = URL(string: loginURLString)!
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        let body: [String: Any] = [
    //            "email": email,
    //            "password": password.base64Encode(),
    //        ]
    //
    //        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, _, error in
    //            guard let data = data, error == nil else {
    //                completion(false, nil)
    //                return
    //            }
    //
    //            do {
    //                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = json["success"] as? Bool, let msg = json["msg"] as? String {
    //                    completion(success, msg)
    //                } else {
    //                    completion(false, nil)
    //                }
    //            } catch {
    //                completion(false, nil)
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    // FORGOT PASSWORD
    static let forgotPasswordURLString = Endpoints.forgotPassword
    
    static func forgotPassword(email: String, studentID: String, completion: @escaping (Bool, String?) -> Void) {
        let body: [String: Any] = [
            "email": email,
            "studentID": Int(studentID)! // TODO: Fix this
        ]
        
        guard let request = createRequest(urlString: Endpoints.forgotPassword, httpMethod: "POST", body: body) else {
            completion(false, "Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    
    // SIGN UP
    
    static let signupURLString = Endpoints.signup
    
    static func signup(firstName: String, lastName: String, email: String, studentID: String, completion: @escaping (Bool, String?) -> Void) {
        let url = URL(string: signupURLString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("appalication/json", forHTTPHeaderField: "Content-Type")
        
        
        let body: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            // TODO: THIS IS A VERY WRONG WAY TO DO IT AND NEEDS FIX
            "studentID": Int(studentID)!,
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false, nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = json["success"] as? Bool, let msg = json["msg"] as? String {
                    completion(success, msg)
                } else {
                    completion(false, nil)
                }
            } catch {
                completion(false, nil)
            }
        }
        
        task.resume()
    }
    
    // VERIFY
    static let verifyURLString = Endpoints.verify
    
    static func verify(email: String, token: String, password: String, passwordConfirm: String, completion: @escaping (Bool, String?) -> Void) {
        guard let url = URL(string: verifyURLString) else {
            completion(false, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "email": email,
            "token": token,
            "password": password,
            "passwordConfirm": passwordConfirm
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false, "Network error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = json["success"] as? Bool {
                    let msg = json["msg"] as? String
                    completion(success, msg)
                } else {
                    completion(false, "Failed to parse JSON")
                }
            } catch {
                completion(false, "JSON parsing error")
            }
        }
        
        task.resume()
    }
    
    
    // PROFILE
    
    static let profileURLString = Endpoints.events
    
    static func getProfile(completion: @escaping (Profile?, String?) -> Void) {
        guard let url = URL(string: Endpoints.profile) else {
            completion(nil, "Invalid URL")
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Retrieve the token from Keychain
        if let token = KeychainService.shared.retrieveToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            completion(nil, "Authorization token not found")
            return
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, "Network error")
                return
            }
            
            do {
                let profile = try JSONDecoder().decode(Profile.self, from: data)
                DispatchQueue.main.async {
                    completion(profile, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, "Failed to parse JSON")
                }
            }
        }
        
        task.resume()
    }
    
    
    // EVENTS
    
    static let eventsURLString = Endpoints.events
    
    static func getEvents(completion: @escaping ([Event]?, String?) -> Void) {
        let url = URL(string: eventsURLString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Retrieve the token from Keychain
        if let token = KeychainService.shared.retrieveToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            completion(nil, "Authorization token not found")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil, "Network error or no data")
                return
            }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    var events = [Event]()
                    
                    for json in jsonArray {
                        if let id = json["id"] as? Int,
                           let name = json["name"] as? String,
                           //                           let description = json["description"] as? String,
                           let eventType = json["eventType"] as? String,
                           let locationName = json["locationName"] as? String,
                           let pointsWorth = json["pointsWorth"] as? Int,
                           let startDateStr = json["startDate"] as? String,
                           let endDateStr = json["endDate"] as? String
                        {
                            let formatter = DateFormatter()
                            formatter.locale = Locale(identifier: "en_US_POSIX")
                            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            let startDate = formatter.date(from: startDateStr)
                            let endDate = formatter.date(from: endDateStr)
                            
                            let event = Event(id: id, name: name /* , description: description */, eventType: eventType, locationName: locationName, pointsWorth: pointsWorth, startDate: startDate!, endDate: endDate!)
                            events.append(event)
                        }
                    }
                    DispatchQueue.main.async {
                        completion(events, nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil, "Failed to parse JSON")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, "JSON parsing error")
                }
            }
        }
        
        task.resume()
    }
    
    // API Methods
    
    // Creates a URLRequest
    private static func createRequest(urlString: String, httpMethod: String, body: [String: Any]? = nil, token: String? = nil) -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        if let token = token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    // Handles the response
    private static func handleResponse(data: Data?, error: Error?, completion: @escaping (Bool, String?) -> Void) {
        guard let data = data, error == nil else {
            completion(false, "Network error")
            return
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let success = json["success"] as? Bool {
                let msg = json["msg"] as? String
                completion(success, msg)
            } else {
                completion(false, "Failed to parse JSON")
            }
        } catch {
            completion(false, "JSON parsing error")
        }
    }
    
    private func base64Encode(_ input: String) -> String {
        let inputData = input.data(using: .utf8)
        let encodedData = inputData?.base64EncodedString()
        return encodedData ?? ""
    }
}


