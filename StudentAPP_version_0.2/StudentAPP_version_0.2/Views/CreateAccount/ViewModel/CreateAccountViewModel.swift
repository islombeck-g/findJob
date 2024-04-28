//
//  CreateAccountViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import Foundation

final class CreateAccountViewModel: CreateAccountViewModelProtocol {
    @Published var nextView: Int = 0
    @Published var password: String = ""
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    @Published var isLoading = false
    @Published var user = UserData(userAuthData: UserAuthData(id: "", email: ""),
                                   firstName: "",
                                   secondName: "",
                                   patronymicName: "",
                                   birthDate: "",
                                   university: "Выберите университет*",
                                   institute: "",
                                   phoneNumber: "",
                                   aboutMe: "",
                                   gender: .male,
                                   city: "",
                                   direction: "")
    
    private let profileService = ProfileServiceFromFirebase.shared
    
    
    func nextEnterDataView() {
        switch nextView {
        case 0:
            createUser()
        case 1:
            nextView = 2
        default:
            createUserFullData()
        }
    }
    func cleanData() {
        nextView = 0
        isValidEmail = false
        isValidPassword = false
        isLoading = false
        user = UserData(userAuthData: UserAuthData(id: "", email: ""),
                        firstName: "",
                        secondName: "",
                        patronymicName: "",
                        birthDate: "",
                        university: "Выберите университет*",
                        institute: "",
                        phoneNumber: "",
                        aboutMe: "",
                        gender: .male,
                        city: "",
                        direction: "")
    }
    private func createUser() {
        Task {
            do {
                try await UserStateManager.shared.createUser(user.userAuthData.email, password)
                            nextView = 1
            } catch {
                print("Error in createUser: \(error.localizedDescription)")
            }
        }
    }
    private func createUserFullData() {
        user.userAuthData.id = UserStateManager.shared.currentUser!.id
        let userDataForNetwork = user.userDataForNetwork
        profileService.createUserData(userDataForNetwork) { response in
            switch response {
            case .success(let success):
                UserStateManager.shared.userState = .authorized
                print("----success data \(success)")
            case .failure(let failure):
                self.nextView = 1
                print("!!!!!!error in createUserFullData: \(failure.localizedDescription)")
            }
        }
    }
}

protocol CreateAccountViewModelProtocol: ObservableObject {
    var nextView: Int { get set }
    var password: String { get set}
    var isValidEmail: Bool { get set }
    var isValidPassword: Bool { get set }
    var user: UserData { get set }
    func nextEnterDataView()
    func cleanData()
    var isLoading: Bool { get }
}
