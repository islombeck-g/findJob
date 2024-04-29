//
//  ProfileViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation

final class ProfileViewModel: ProfileViewModelProtol {
    
    @Published var userData: UserData?
    let userAuthData: UserAuthData
    let profileService = ProfileServiceFromFirebase.shared
    
    init() {
        userAuthData = UserStateManager.shared.getUserAuthData()
    }
    func getUserData() async {
        profileService.readUserData(userId: userAuthData.id) { response in
            switch response {
            case .success(let success):
                if let success = success {
                    self.userData = UserData(userAuthData: UserAuthData(id: success.userAuthData.id, email: success.userAuthData.email),
                                             firstName: success.firstName,
                                             secondName: success.secondName,
                                             patronymicName: success.patronymicName,
                                             birthDate: success.birthDate,
                                             university: success.university,
                                             institute: success.institute,
                                             phoneNumber: success.phoneNumber,
                                             aboutMe: success.aboutMe, 
                                             gender: success.gender == "MALE" ? .male : .female,
                                             city: success.city,
                                             direction: success.direction)}
            case .failure(let failure):
                print("!!!!!!!!!readUserData Error!!!!!!!!! \(failure.localizedDescription)")
            }
        }
    }
    func saveProfileEditChanges(_ userData: UserData) {
        profileService.updateUserData(userId: userAuthData.id, updatedUserData: userData.userDataForNetwork) { response in
            switch response {
            case .success(_):
                Task {
                    await self.getUserData()
                }
            case .failure(let failure):
                print("?????? error in save changes: \(failure.localizedDescription)")
            }
        }
    }
}

protocol ProfileViewModelProtol: ObservableObject {
    var userData: UserData? { get set }
    func getUserData() async
    func saveProfileEditChanges(_ userData: UserData)
}

