//
//  ProfileView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel 

    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(AppTheme.primaryColor)

            Text("john@timely.com")
                .font(.title3)
                .fontWeight(.semibold)

            Divider().padding(.horizontal)

            VStack(spacing: 16) {
                profileOption(icon: "pencil", label: "Edit Profile")
                profileOption(icon: "gearshape", label: "Settings")
                profileOption(icon: "bell", label: "Notifications")
            }
            .padding(.horizontal)

            Spacer()

            
            Button(action: {
                authViewModel.isAuthenticated = false
                authViewModel.token = nil
                APIService.shared.jwtToken = nil
                
            }) {
                Text("Log Out")
                    .font(.body)
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding()
            Spacer()
        }
        .navigationTitle("Profile")
        .preferredColorScheme(.light)
    }

    func profileOption(icon: String, label: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(AppTheme.primaryColor)
                .frame(width: 24)
            Text(label)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
