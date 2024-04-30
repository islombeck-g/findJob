//
//  ChatDetailView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct ChatDetailView: View {
    
    @ObservedObject var chat: JobApplication
    @State private var newMessageText: String = ""

    var body: some View {
        VStack {
            List(chat.messages) { message in
                HStack {
                    if message.senderId == MessangerServiceFromFirebase.shared.db.url {
                        Spacer()
                        Text(message.text)
                            .padding()
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                    } else {
                        Text(message.text)
                            .padding()
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            HStack {
                TextField("New message", text: $newMessageText)
                    .textFieldStyle(.roundedBorder)
                Button("Send") {
                    sendMessage()
                }
            }
            .padding()
        }
        .navigationTitle(chat.vacancyName)
        .onAppear {
            MessangerServiceFromFirebase.shared.getMessages(forJobApplicationId: chat.id.uuidString) { messages in
                chat.messages = messages
            }
        }
    }

    private func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        MessangerServiceFromFirebase.shared.sendMessage(toJobApplicationId: chat.id.uuidString, text: newMessageText) { success, error in
            if success {
                self.newMessageText = ""
            } else {
                print("Error sending message: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
