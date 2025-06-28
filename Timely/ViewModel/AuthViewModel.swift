//
//  AuthModel.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//
import Foundation

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var token: String?

    init() {
        loadToken()
    }
    
    func login(userName: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "https://node-api-for-candidates.onrender.com/signin") else {
            completion(false)
            return
        }

        let body: [String: String] = [
            "username": userName,
            "password": password
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Login error: \(error)")
                completion(false)
                return
            }

            guard let data = data else {
                completion(false)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: String],
                   let token = json["token"] {
                    DispatchQueue.main.async {
                        self.token = token
                        self.isAuthenticated = true
                        APIService.shared.jwtToken = token
                        self.saveToken()
                        completion(true)
                    }
                } else {
                    completion(false)
                }
            } catch {
                print("JSON decode error: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    
    
    
    private func saveToken() {
        UserDefaults.standard.set(token, forKey: "auth_token")
    }

    private func loadToken() {
        if let data = UserDefaults.standard.data(forKey: "auth_token"),
           let saved = try? JSONDecoder().decode(String.self, from: data) {
            token = saved
            isAuthenticated = true
        }
    }
    
    private func deleteToken(){
        UserDefaults.standard.set(nil, forKey: "auth_token")
    }
}
