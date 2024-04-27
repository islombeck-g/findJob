//
//  SignInViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import Foundation
import Combine

final class SignInViewModel: SignInViewModelProtocol {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    @Published var isLoading: Bool = false
    var passwordPrompt: String? {
        if isValidPassword || self.password.isEmpty { return nil }
        return "Пароль должен быть не меньше 8 символов"
    }
    var emailPrompn: String? {
        if isValidEmail || email.isEmpty { return nil }
        return "Почта введена не корректно. Введите по шаблону: test@test.com"
    }
    func trySignIn() {
        
    }
    func cleanData() {
        email = ""
        password = ""
        isValidEmail = false
        isValidPassword = false
        isLoading = false
    }
}

protocol SignInViewModelProtocol: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var isValidEmail: Bool { get set }
    var isValidPassword: Bool { get set }
    var passwordPrompt: String? { get }
    var emailPrompn: String? { get }
    func trySignIn()
    var isLoading: Bool { get }
    func cleanData()
}
