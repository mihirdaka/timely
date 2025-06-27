//
//  TimelyApp.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//

import SwiftUI

@main
struct TimelyApp: App {
    @StateObject var authViewModel = AuthViewModel()

        var body: some Scene {
            WindowGroup {
                if authViewModel.isAuthenticated {
                    ContentView()
                } else {
                    LoginView(viewModel: authViewModel)
                }
            }
        }
}
