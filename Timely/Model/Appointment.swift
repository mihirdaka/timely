//
//  AppointmentResponse.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import Foundation

struct AppointmentResponse: Codable {
    let appointments: [Appointment]
}

struct Appointment: Identifiable, Codable {
    var id: String { appointment_id }

    let appointment_id: String
    let patient_id: String
    let provider_id: String
    let status: String
    let appointment_type: String
    let start: String
    let end: String
    let duration_in_minutes: Int
    let recurrence_type: String

    var formattedStart: String {
        formatISODate(start)
    }

    var formattedEnd: String {
        formatISODate(end)
    }

    private func formatISODate(_ iso: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: iso) {
            let output = DateFormatter()
            output.dateStyle = .medium
            output.timeStyle = .short
            return output.string(from: date)
        }
        return iso
    }
}

extension Appointment {
    var startDate: Date {
        ISO8601DateFormatter().date(from: start) ?? Date()
    }

    var startMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: startDate).uppercased()
    }

    var startDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: startDate)
    }

    var timeRange: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let startTime = formatter.string(from: startDate)

        let endTime = ISO8601DateFormatter().date(from: end).map { formatter.string(from: $0) } ?? ""
        return "\(startTime) - \(endTime) (PT)"
    }
    var startTime: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: startDate)
    }

    var isPastAppointment: Bool {
        let now = Date()
        return startDate < now;
    }

    
}
