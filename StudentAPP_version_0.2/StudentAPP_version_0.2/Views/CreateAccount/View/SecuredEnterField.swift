//
//  SecuredEnterField.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct SecuredEnterField: View {
    
    @Binding var email: String
    @Binding var password: String
    var passwordPrompt: String?
    var emailPrompn: String?
    var action: () -> ()
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color("SecondaryColor"))
                
                VStack(alignment: .center) {
                    Text(Localizable.personalInformation.localized)
                        .foregroundStyle(Color("ForegroundColor"))
                        .font(.system(size: 34))
                        .bold()
                    
                    MainTextField(result: $email,
                                  isSecureField: false,
                                  text: Localizable.username.localized)
                    
                    if let text = emailPrompn {
                        Text(text)
                        //                        .errorText()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    MainTextField(result: $password,
                                  isSecureField: true,
                                  text: Localizable.password.localized)
                    
                    if let text = passwordPrompt {
                        Text(text)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    Button {
                        withAnimation {
                            self.action()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height: 50)
                                .foregroundColor(Color("AccentColor"))
                            Title4Text(color: .white,
                                       text:  Localizable.registration.localized)
                        }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
            }
            .frame(maxHeight: 370)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
