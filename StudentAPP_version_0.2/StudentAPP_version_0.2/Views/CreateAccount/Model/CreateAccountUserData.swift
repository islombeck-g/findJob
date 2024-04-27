//
//  CreateAccountUserData.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation

struct CreateAccountUserData: Codable {
    var firstName: String
    var secondName: String
    var patronymicName: String
//    var birthDate: String
    var university: String
    var phoneNumber: String
    var institute:String
    var gender: Gender
    var city:String
}
