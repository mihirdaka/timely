//
//  AppointmentsView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

struct AppointmentsView: View {
    @StateObject var viewModel = AppointmentsViewModel()
  
    @State private var selectedTab: Tab = .upcoming

       enum Tab: String, CaseIterable {
           case upcoming = "Upcoming"
           case past = "Past"
       }
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
                HStack {
                         Text("Appointments")
                             .font(.system(size: 28, weight: .bold))
                         
                         Spacer()
                         Button(action: {
                             // New appointment action
                         }) {
                             HStack(spacing: 8) {
                                 
                                 Image("Add")
                                     .renderingMode(.template)
                                     .foregroundColor(.black)
                                 Text("New")
                                     .foregroundColor(.black)
                                    
                             }
                             .font(.system(size: 20, weight: .medium))
                             .padding(.vertical, 12)
                             .padding(.horizontal, 20)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 0.75)
                             )
                         }
                     }
                     .padding()
                     .padding(.horizontal,10)
                
                        
                           HStack {
                               ForEach(Tab.allCases, id: \.self) { tab in
                                   Button(action: {
                                       selectedTab = tab
                                   }) {
                                       VStack(spacing: 12) {
                                                            Text(tab.rawValue)
                                                                           .font(.system(size: 16, weight: .semibold))
                                                                           .foregroundColor(selectedTab == tab ? AppTheme.primaryColor : .gray)
                                                                       Rectangle()
                                                                           .fill(selectedTab == tab ? AppTheme.primaryColor : .clear)
                                                                           .frame(height: 2)
                                                                   }
                                                                   .frame(maxWidth: .infinity)
                                   }
                               }
                           }
                           .padding(.top, 12)
                          
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredAppointments(tab: selectedTab.rawValue)) { appointment in
                            AppointmentCard(appointment: appointment, isExpanded: appointment.id == viewModel.filteredAppointments(tab: "Upcoming").first?.id)
                        }
                    }
                    .padding()
                }
                       }
            
        }
        .onAppear {
            viewModel.fetchAppointments()
        }
           
    }
}

struct AppointmentCard: View {
    let appointment: Appointment
    let isExpanded: Bool

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 14) {
                
                VStack (alignment: .center,spacing: 0){
                    HStack{
                        Text(appointment.startMonth)
                            .font(.system(size:12))
                            .foregroundColor(appointment.isPastAppointment ? Color.black : AppTheme.primaryColor)
                            .padding(.top,6)

                    } .frame(minWidth:48,minHeight:24)
                    
                        .background(
                            appointment.isPastAppointment
                            ? Color.gray.opacity(0.08)
                            : AppTheme.primaryColor.opacity(0.10)
                        )
                    Text(appointment.startDay)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,6)
                }
                .frame(width: 48,height: 48)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(isExpanded ? appointment.timeRange : appointment.startTime)
                        .fontWeight(.semibold)
                    Text("\(appointment.appointment_type) \(isExpanded ? "with Jane Williams, RD" : "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    
                }
                
                Spacer()
            }
            if  isExpanded {
                Button(action: {
                }) {
                    HStack {
                        Image("Videocamera")
                        Text("Join appointment")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(AppTheme.primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.vertical, 8)
            }
        }
        .padding(.horizontal,16)
        .padding(.vertical)
        .background(isExpanded ? Color.white : Color.clear)
        .cornerRadius(16)
        .shadow(
            color: isExpanded ? Color.black.opacity(0.05) : Color.clear,
            radius: isExpanded ? 8 : 0,
            x: 2, y: 3
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.3), lineWidth: isExpanded ? 0 : 1)
        )
        
        
    }
}
