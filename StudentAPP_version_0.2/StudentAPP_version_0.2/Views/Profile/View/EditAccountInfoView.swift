//
//  EditAccountInfoView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct EditAccountInfoView: View {
    
    let user: UserData
//    let action: () -> ()
    var body: some View {
        ZStack {
            Color("ForegroundColor").ignoresSafeArea()
            
            VStack {
                ScrollView {
                    CircleImage(image: Image("userImage"))
                    
                    EditProfileItemsView(firstName: user.firstName,
                                         secondName: user.secondName,
                                         patronymicName: user.patronymicName,
                                         birthDate: user.birthDate,
                                         university: user.university,
                                         institute: user.institute,
                                         phoneNumber: user.phoneNumber,
                                         aboutMe: user.aboutMe,
                                         city: user.city,
                                         direction: user.direction)
                    Button {
//                        action()
                    } label: {
                        Text("save changes")
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
            }
        }
    }
}

