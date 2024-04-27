//
//  CreateAccountViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import Foundation

final class CreateAccountViewModel: CreateAccountViewModelProtocol {
    @Published var nextView: Int = 0
    @Published var email = ""
    @Published var password: String = ""
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    @Published var isLoading = false
    @Published var user = CreateAccountUserData(firstName: "",
                                                secondName: "",
                                                patronymicName: "",
                                                university: "Выберите университет*",
                                                phoneNumber: "",
                                                institute: "",
                                                gender: .male,
                                                city: "")
    func nextEnterDataView() {
        nextView == 0 ? (nextView = 1) : (nextView = 0)
    }
    func cleanData() {
        nextView = 0
        email = ""
        password = ""
        isValidEmail = false
        isValidPassword = false
        isLoading = false
        user = CreateAccountUserData(firstName: "",
                                     secondName: "",
                                     patronymicName: "",
                                     university: "Выберите университет*",
                                     phoneNumber: "",
                                     institute: "",
                                     gender: .male,
                                     city: "")
    }
}

protocol CreateAccountViewModelProtocol: ObservableObject {
    var nextView: Int { get set }
    var email: String { get set }
    var password: String { get set }
    var isValidEmail: Bool { get set }
    var isValidPassword: Bool { get set }
    var user: CreateAccountUserData { get set }
    func nextEnterDataView()
    func cleanData()
    var isLoading: Bool { get }
}
