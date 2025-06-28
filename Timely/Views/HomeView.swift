//
//  Tab.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI



struct HomeView: View {
    enum Tab: String {
        case appointments, chat, journal, profile
    }
    @EnvironmentObject var authViewModel : AuthViewModel
    @State private var selectedTab: Tab = .appointments

    var body: some View {
        TabView (selection: $selectedTab){
            AppointmentsView()
                    .tabItem {
                        VStack {
                            Image(selectedTab == .appointments ? "CalendarFilled":"Calendar")
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == .appointments ? AppTheme.primaryColor : .black)
                                
                            Text("Appointments")
                                .foregroundColor(selectedTab == .appointments ? AppTheme.primaryColor : .black)
                        }
                    }
                    .tag(Tab.appointments)

                ChatView()
                    .tabItem {
                        VStack {
                            Image("Chats")
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == .chat ? AppTheme.primaryColor : .black)
                            Text("Chat")
                                .foregroundColor(selectedTab == .chat ? AppTheme.primaryColor : .black)
                        }
                    }
                    .tag(Tab.chat)

                JournalView()
                    .tabItem {
                        VStack {
                            Image("Notebook")
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == .journal ? AppTheme.primaryColor : .black)
                            Text("Journal")
                                .foregroundColor(selectedTab == .journal ? AppTheme.primaryColor : .black)
                        }
                    }
                    .tag(Tab.journal)

                ProfileView()
                    .environmentObject(authViewModel)
                    .tabItem {
                        VStack {
                            Image("User")
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == .profile ? AppTheme.primaryColor : .black)
                            Text("Profile")
                                .foregroundColor(selectedTab == .profile ? AppTheme.primaryColor : .black)
                        }
                    }
                    .tag(Tab.profile)
        }
        .accentColor(AppTheme.primaryColor)
    }
}
