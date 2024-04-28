//
//  SignInEnterDataForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct SignInEnterDataForm: View {
    
    @Binding var email: String
    @Binding var password: String
    var passwordPrompt: String?
    var emailPrompn: String?
    var action: () -> ()
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Title1Text(color: Color("ForegroundColor"),
                           text: "Личные данные")
                
                MainTextField(result: $email, 
                              isSecureField: false,
                              text: "Почта")
                
                if let text = emailPrompn {
                    Text(text)
//                        .errorText()
                }
                
                Spacer()
                    .frame(height: 10)
                
                MainTextField(result: $password, 
                              isSecureField: true,
                              text: "Пароль")
                
                if let text = passwordPrompt {
                    Text(text)
//                        .errorText()
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
                        
                        Text(LocalizedStringKey("Войти"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
        }
    }
}

