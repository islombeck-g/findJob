//
//  EditProfileViewItems.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct EditProfileItemsView: View {
    
    @State var firstName: String
    @State var secondName: String
    @State var patronymicName: String
    @State var birthDate: String
    @State var university: String
    @State var institute: String
    @State var phoneNumber: String
    @State var aboutMe: String
    @State var city: String
    @State var direction: String
    
    init(firstName: String,
         secondName: String,
         patronymicName: String,
         birthDate: String,
         university: String,
         institute: String,
         phoneNumber: String,
         aboutMe: String,
         city: String,
         direction: String) {
        self._firstName = State(initialValue: firstName)
        self._secondName = State(initialValue: secondName)
        self._patronymicName = State(initialValue: patronymicName)
        self._birthDate = State(initialValue: birthDate)
        self._university = State(initialValue: university)
        self._institute = State(initialValue: institute)
        self._phoneNumber = State(initialValue: phoneNumber)
        self._aboutMe = State(initialValue: aboutMe)
        self._city = State(initialValue: city)
        self._direction = State(initialValue: direction)
    }
    
    var body: some View {
        VStack {
            Group {
                Title3Text(text: Localizable.firstName.localized)
                    .frame(maxWidth: .infinity, alignment: .leading)
                MainTextField(result: $firstName)
                
                
                Title3Text(text: Localizable.lastName.localized)
                    .frame(maxWidth: .infinity, alignment: .leading)
                MainTextField(result: $secondName)
                Title3Text(text: Localizable.middleName.localized)
                Text("35")
                    .fontWeight(.bold)
                MainTextField(result: $patronymicName)
            }
            
            
            Group {
                Text("23")
                MainTextField(result: $firstName, isSecureField: false)
            }
            
            
            
            //            Group {
            //                Text("27")
            //                    .fontWeight(.bold)
            //                MainTextField(isSecureField: false, text: "", result: $birthDate)
            //
            //                Text("Город")
            //                    .fontWeight(.bold)
            //                MainTextField(isSecureField: false, text: "", result: $city)
            //
            //                Text("32")
            //                    .fontWeight(.bold)
            //                MainTextField(isSecureField: false, text: "", result: $aboutMe)
            //            }
        }
        //        .frame(maxWidth: .infinity, alignment: .leading)
        //        .foregroundStyle(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}


////
////  EditProfileViewItems.swift
////  StudentAPP_version_0.2
////
////  Created by Islombek Gofurov on 28/04/24.
////
//
//import SwiftUI
//
//struct EditProfileItemsView: View {
//
//    @State var firstName: String
//    @State var secondName: String
//    @State var patronymicName: String
//    @State var birthDate: String
//    @State var university: String
//    @State var institute: String
//    @State var phoneNumber: String
//    @State var aboutMe: String
//    @State var city: String
//    @State var direction: String
//
//    init(firstName: String,
//          secondName: String,
//          patronymicName: String,
//          birthDate: String,
//          university: String,
//          institute: String,
//          phoneNumber: String,
//          aboutMe: String,
//          city: String,
//          direction: String) {
//        self._firstName = State(initialValue: firstName)
//        self._secondName = State(initialValue: secondName)
//        self._patronymicName = State(initialValue: patronymicName)
//        self._birthDate = State(initialValue: birthDate)
//        self._university = State(initialValue: university)
//        self._institute = State(initialValue: institute)
//        self._phoneNumber = State(initialValue: phoneNumber)
//        self._aboutMe = State(initialValue: aboutMe)
//        self._city = State(initialValue: city)
//        self._direction = State(initialValue: direction)
//    }
//
//    var body: some View {
//        VStack {
//            Group {
//                Text("34")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $firstName)
//
//                Text("33")
//                    .font(.system(size:15))
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $secondName)
//
//                Text("35")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $patronymicName)
//            }
//
//            Group {
//                Text("29")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $university)
//                Text("30")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $institute)
//
//                Text("31")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $direction)
//            }
//
//            Group {
//                Text("27")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $birthDate)
//
//                Text("Город")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $city)
//
//                Text("32")
//                    .fontWeight(.bold)
//                MainTextField(isSecureField: false, text: "", result: $aboutMe)
//            }
//        }
////        .frame(maxWidth: .infinity, alignment: .leading)
////        .foregroundStyle(Color("SecondaryColor"))
//        .padding(.horizontal, 16)
//    }
//}
//
