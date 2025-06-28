//
//  APIService.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import Foundation
class APIService {
    static let shared = APIService()
    var jwtToken: String?

    private let baseURL = "https://node-api-for-candidates.onrender.com/"

    func fetchAppointments(completion: @escaping (Result<[Appointment], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)appointments") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        if let token = jwtToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(AppointmentResponse.self, from: data)
                completion(.success(decoded.appointments))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
