import Foundation

class loginViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    var authenticationMessage: String = ""

    func login(email: String, password: String, completion: @escaping () -> Void) {
        let encodedPassword = password.toBase64()
        let parameters = ["email": email.lowercased(), "password": encodedPassword]
        
        guard let url = URL(string: Environment.PUBLIC_URL + "/api/login") else { return }
        
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
                if let response = try? JSONDecoder().decode(loginAuthResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.isAuthenticated = response.success
                        self.authenticationMessage = response.msg
                        completion()
                        // Store the JWT token if needed
                    }
                }
            }
        }.resume()
    }
}

struct loginAuthResponse: Codable {
    let success: Bool
    let msg: String
}
