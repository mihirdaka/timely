//
//  LoginView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

struct LoginView: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Timely")
                .font(.largeTitle)
                .bold()
            
            TextField("Username", text: $userName)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            Button(action: {
                viewModel.login(userName: userName, password: password) { success in
                                   if !success {
                                       self.errorMessage = "Invalid credentials"
                                   }
                               }
            }) {
                HStack {
                    
                    Text("Login")
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(AppTheme.primaryColor)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.vertical, 8)
           
            
        }
        .padding()
    }
}


