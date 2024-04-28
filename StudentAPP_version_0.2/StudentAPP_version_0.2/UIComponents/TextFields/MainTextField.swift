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
    
    init(result: Binding<String>,
         isSecureField: Bool = false,
         text: String = "") {
        self._result = result
        self.isSecureField = isSecureField
        self.text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color("lightGray"))
            Group {
                if !self.isSecureField {
                    TextField("",
                              text: self.$result,
                              prompt: Text(text)
                        .foregroundColor(Color("darkGray")))
                        .padding(.horizontal, 16)
                } else {
                    Group {
                        if self.showPassword {
                            TextField("",
                                      text: self.$result,
                                      prompt: Text(text)
                                .foregroundColor(Color("darkGray")))
                        } else {
                            SecureField("",
                                        text: self.$result,
                                        prompt: Text(text)
                                  .foregroundColor(Color("darkGray")))
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
        .foregroundStyle(Color("black"))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}
