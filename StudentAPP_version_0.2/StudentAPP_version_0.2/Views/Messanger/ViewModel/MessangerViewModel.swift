//
//  MessangerViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import Foundation
import Combine

final class MessangerViewModel: MessangerViewModelProtocol {
    @Published var chats: [JobApplication] = []
    @Published var messages: [Message] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let messangerService = MessangerServiceFromFirebase.shared
    
    func loadChats() {
        isLoading = true
        messangerService.getAllChats { [weak self] chats in
            self?.isLoading = false
            self?.chats = chats
        }
    }
    
    func loadMessages(forJobApplicationId jobApplicationId: String) {
        isLoading = true
        messangerService.getMessages(forJobApplicationId: jobApplicationId) { [weak self] messages in
            self?.isLoading = false
            self?.messages = messages
        }
    }
    
    func startChat(userId: String, companyId: String, vacancyId: String, vacancyName: String, cvId: String, firstMessageText: String?) {
        isLoading = true
        messangerService.startChat(userId: userId, companyId: companyId, vacancyId: vacancyId, vacancyName: vacancyName, cvId: cvId, firstMessageText: firstMessageText) { [weak self] success, error in
            self?.isLoading = false
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else if success {
                // chat started successfully
            }
        }
    }
    
}
protocol MessangerViewModelProtocol: ObservableObject {
    var isLoading: Bool { get set }
    var chats: [JobApplication] { get set }
    func loadChats()
}
