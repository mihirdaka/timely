//
//  ChatViewModel.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//


import Foundation
import Combine

struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}
class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []

    func sendMessage(_ text: String) {
        let userMessage = ChatMessage(content: text, isUser: true)
        messages.append(userMessage)

        // bot reply echo
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let botMessage = ChatMessage(content: "Echo: \(text)", isUser: false)
            self.messages.append(botMessage)
        }
    }
}
