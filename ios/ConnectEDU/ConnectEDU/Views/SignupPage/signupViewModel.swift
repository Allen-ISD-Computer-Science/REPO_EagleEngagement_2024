//
//  signupViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import Foundation

class signupViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    var authenticationMessage: String = ""
    var didError: Bool = false
    var errorReason: String = ""

    func signup(firstName: String, lastName: String, email: String, studentID: Int, completion: @escaping () -> Void) {
        let parameters = ["firstName": firstName.lowercased(), "lastName": lastName.lowercased, "email": email.lowercased(), "studentID": studentID] as [String : Any]
        
        guard let url = URL(string: Environment.PUBLIC_URL + "/api/signup") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let response = try? JSONDecoder().decode(signupAuthResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.isAuthenticated = response.success
                        self.authenticationMessage = response.msg
                        self.didError = response.error
                        self.errorReason = response.reason
                        completion()
                        // Store the JWT token if needed
                    }
                }
            }
        }.resume()
    }
}

struct signupAuthResponse: Codable {
    let success: Bool
    let msg: String
    let error: Bool
    let reason: String
}
