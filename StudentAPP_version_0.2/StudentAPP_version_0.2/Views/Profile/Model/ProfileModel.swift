//
//  ProfileModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation

struct UserData: Codable {
    var userAuthData: UserAuthData
    var firstName: String
    var secondName: String
    var patronymicName: String
    var birthDate: String
    var university: String
    var institute: String
    var phoneNumber: String
    var aboutMe: String
    var gender: Gender
    var city: String
    var direction: String
    
    var userDataForNetwork: UserDataForNetwork {
        return UserDataForNetwork(userAuthData: userAuthData,
                                  firstName: firstName,
                                  secondName: secondName,
                                  patronymicName: patronymicName,
                                  birthDate: birthDate,
                                  university: university,
                                  institute: institute,
                                  phoneNumber: phoneNumber,
                                  aboutMe: aboutMe,
                                  gender: gender.rawValue,
                                  city: city,
                                  direction: direction)
    }
}

struct UserDataForNetwork: Codable {
    var userAuthData: UserAuthData
    var firstName: String
    var secondName: String
    var patronymicName: String
    var birthDate: String
    var university: String
    var institute: String
    var phoneNumber: String
    var aboutMe: String
    var gender: String
    var city: String
    var direction: String
}
