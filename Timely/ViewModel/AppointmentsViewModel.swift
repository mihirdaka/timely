//
//  AppointmentsViewModel.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import Foundation

class AppointmentsViewModel: ObservableObject {
    @Published var appointments: [Appointment] = []
    @Published var isLoading = false
    @Published var error: String?

    func fetchAppointments() {
        isLoading = true
        error = nil

        APIService.shared.fetchAppointments { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    self.appointments = data
                case .failure(let err):
                    self.error = err.localizedDescription
                }
            }
        }
    }
    func filteredAppointments(tab: String) -> [Appointment] {
           let now = Date()
           if tab == "Past" {
               return appointments.filter { $0.startDate < now }
           } else {
               return appointments.filter { $0.startDate >= now }
           }
       }
}
