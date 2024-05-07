//
//  DataConstants.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation

/**
    Константы приложения
 
    A very long one.
 # Параметры
  1. universityes - университеты
 2. emptyUserData - пустой пользователь
 3. emptyCvData - пустое резюме
*/
struct DataConstants {
    
    static let universityes: [ChoseName] = [
        .init(title: "Казанский(Приволжский) Федеральный Университет"),
        .init(title: "КАЗАНСКИЙ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ"),
        .init(title: "Санкт-Питербургский Государственный Университет"),
        .init(title: "Московский Государственный Университет"),
        .init(title: "Казанский Национальный Иследовательский Технический Университет"),
        .init(title: "Казанский государственный медицинский университет"),
        .init(title: "Российский исламский институтка")]
    static let emptyUserData  = UserData(userAuthData: UserAuthData(id: "", email: ""), firstName: "", secondName: "", patronymicName: "", birthDate: "", university: "", institute: "", phoneNumber: "", aboutMe: "", gender: .male, city: "", direction: "")
    static let customCvData = CvData(id: "soneId",
                                     parentID: "parentId",
                                     age: 20,
                                     position: "IOS - developer",
                                     firstName: "Руслан",
                                     secondName: "Хамдамов",
                                     patronymicName: "Арсланович",
                                     birthDate: "25.12.2000",
                                     birthCountry: "Чехия",
                                     phoneNumber: "+998(97)231-43-21",
                                     university: "Казанский (Приволжский) Федеральный университет",
                                     institute: "Институт вычислительной математики и информационных технологий",
                                     direction: "Фундаментальная математика и информационные технологии",
                                     anotherEducation: "-",
                                     certificates: "IELTS 10",
                                     skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
                                     money: "от 100 000 до 300 000 руб",
                                     workExperience: "Лаборатория КФУ",
                                     employmentType: "Полная занятость",
                                     aboutMe: "Очень хороший человекОчень хороший человекОчень хороший человекОчень хороший человекОчень хороший человекОчень хороший человекОчень хороший человекОчень хороший человек")
    static let emptyCvData  = CvData(id: "",
                                     parentID: "",
                                     age: 0,
                                     position: "",
                                     firstName: "",
                                     secondName: "",
                                     patronymicName: "",
                                     birthDate: "",
                                     birthCountry: "",
                                     phoneNumber: "",
                                     university: "",
                                     institute: "",
                                     direction: "",
                                     anotherEducation: "",
                                     certificates: "",
                                     skills: "",
                                     money: "",
                                     workExperience: "",
                                     employmentType: "",
                                     aboutMe: "")
    
        
}
