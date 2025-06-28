//
//  ChatView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var newMessage = ""

    var body: some View {
        NavigationView{
            VStack {
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 12) {
                            ForEach(viewModel.messages) { message in
                                HStack {
                                    if message.isUser {
                                        Spacer()
                                        Text(message.content)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(AppTheme.primaryColor)
                                            .cornerRadius(12)
                                    } else {
                                        Text(message.content)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Color(.systemGray5))
                                            .cornerRadius(12)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .onChange(of: viewModel.messages.count) { _ in
                        withAnimation {
                            scrollProxy.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                
                // Input field
                HStack {
                    TextField("Type a message", text: $newMessage)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Button(action: {
                        guard !newMessage.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                        viewModel.sendMessage(newMessage)
                        newMessage = ""
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(AppTheme.primaryColor)
                    }
                }
                .padding()
            }
        }.navigationTitle("Chat")
        .preferredColorScheme(.light)
    }
}
