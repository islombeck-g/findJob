//
//  MainTextField.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct MainTextField: View {
    @State private var showPassword: Bool = false
    @Binding var result: String
    let isSecureField: Bool
    let text: String
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color("textFieldBack"))

            Group {
                if !self.isSecureField {
                    
                    TextField(self.text, text: self.$result)
                        .padding(.horizontal, 16)
                    
                } else {
                    Group {
                        if self.showPassword {
                            TextField(self.text, text: self.$result)
                        }
                        else{
                            SecureField(self.text, text: self.$result)
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 30)
                    
                    Button(action: {
                        self.showPassword.toggle()
                    }) {
                        Image(systemName: self.showPassword ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    .padding(.trailing, 5)
                }
            }
        }
        .foregroundStyle(Color("TextColor"))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}
