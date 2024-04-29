//
//  EditProfileViewItems.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct EditProfileItemsView: View {
    
    @Binding var firstName: String
    @Binding var secondName: String
    @Binding var patronymicName: String
    @Binding var birthDate: String
    @Binding var university: String
    @Binding var institute: String
    @Binding var phoneNumber: String
    @Binding var aboutMe: String
    @Binding var city: String
    @Binding var direction: String
    private let formatter = PhoneFormatter()
    
    init(firstName: Binding<String>,
         secondName: Binding<String>,
         patronymicName: Binding<String>,
         birthDate: Binding<String>,
         university: Binding<String>,
         institute: Binding<String>,
         phoneNumber: Binding<String>,
         aboutMe: Binding<String>,
         city: Binding<String>,
         direction: Binding<String>) {
        self._firstName = firstName
        self._secondName = secondName
        self._patronymicName = patronymicName
        self._birthDate = birthDate
        self._university = university
        self._institute = institute
        self._phoneNumber = phoneNumber
        self._aboutMe = aboutMe
        self._city = city
        self._direction = direction
    }
    
    var body: some View {
        VStack {
            Group {
                Title3Text(text: Localizable.firstName.localized)
                MainTextField(result: $firstName)
                
                Title3Text(text: Localizable.lastName.localized)
                MainTextField(result: $secondName)
                
                Title3Text(text: Localizable.middleName.localized)
                MainTextField(result: $patronymicName)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Title3Text(text: Localizable.university.localized)
                MainTextField(result: $university)
                
                Title3Text(text: Localizable.institute.localized)
                MainTextField(result: $institute)
                
                Title3Text(text: Localizable.fieldOfStudy.localized)
                MainTextField(result: $direction)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Title3Text(text: Localizable.dateOfBirth.localized)
                MainTextField(result: $birthDate)
                
                Title3Text(text: Localizable.placeOfStudy.localized)
                MainTextField(result: $city)
                
                Title3Text(text: Localizable.phone.localized)
                MainTextField(result: $phoneNumber,
                              isSecureField: false,
                              text: Localizable.phone.localized + "*")
                .onChange(of: phoneNumber) { oldValue, newValue in
                    phoneNumber = formatter.format(number: newValue)
                }
                
                Title3Text(text: Localizable.aboutMe.localized)
                MainTextField(result: $aboutMe)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
    }
}

//init(firstName: <String>,
//     secondName: String,
//     patronymicName: String,
//     birthDate: String,
//     university: String,
//     institute: String,
//     phoneNumber: String,
//     aboutMe: String,
//     city: String,
//     direction: String) {
//    self._firstName = State(initialValue: firstName)
//    self._secondName = State(initialValue: secondName)
//    self._patronymicName = State(initialValue: patronymicName)
//    self._birthDate = State(initialValue: birthDate)
//    self._university = State(initialValue: university)
//    self._institute = State(initialValue: institute)
//    self._phoneNumber = State(initialValue: phoneNumber)
//    self._aboutMe = State(initialValue: aboutMe)
//    self._city = State(initialValue: city)
//    self._direction = State(initialValue: direction)
//}
