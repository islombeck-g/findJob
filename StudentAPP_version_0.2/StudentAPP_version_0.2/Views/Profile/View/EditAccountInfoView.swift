//
//  EditAccountInfoView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct EditAccountInfoView: View {
    
    @State var user: UserData
    let action: (_ userData: UserData) -> ()
    
    init(user: UserData, action: @escaping (_ userData: UserData) -> Void) {
        self._user = State(initialValue: user)
        self.action = action
    }
    var body: some View {
        ZStack {
            Color("ForegroundColor").ignoresSafeArea()
            
            VStack {
                ScrollView {
                    CircleImage(image: Image("userImage"))
                    
                    EditProfileItemsView(firstName: $user.firstName,
                                         secondName: $user.secondName,
                                         patronymicName: $user.patronymicName,
                                         birthDate: $user.birthDate,
                                         university: $user.university,
                                         institute: $user.institute,
                                         phoneNumber: $user.phoneNumber,
                                         aboutMe: $user.aboutMe,
                                         city: $user.city,
                                         direction: $user.direction)
                    Button {
                        withAnimation { action(user) }
                    } label: {
                            Text(Localizable.saveChanges.localized)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(Color.white)
                                .background(Color("AccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                        .padding(.horizontal, 16)
                    }
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton()
                }
                ToolbarItem(placement: .principal) {
                    Title2Text(text: Localizable.editProfile.localized)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

