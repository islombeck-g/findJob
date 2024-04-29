//
//  CvData.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import Foundation

struct CvData: Codable, Hashable, Identifiable {
    var id: String
    var parentID: String
    var age:Int
    var position:String
    var firstName:String
    var secondName:String
    var patronymicName:String
    var birthDate:String 
    var birthCountry:String
    var phoneNumber:String
    var university:String
    var institute:String
    var direction:String
    var anotherEducation:String
    var certificates:String
    var skills:String
    var money:String
    var workExperience:String
    var employmentType:String
    var aboutMe:String
}
