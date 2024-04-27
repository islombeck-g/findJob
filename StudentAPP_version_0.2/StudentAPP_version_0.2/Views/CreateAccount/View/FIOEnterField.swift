//
//  FIOEnterField.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct FIOEnterField: View {
    
    @Binding var firstName: String
    @Binding var secondName: String
    @Binding var patronymicName: String
    var action: () -> ()
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color("SecondaryColor"))
                
                VStack(alignment: .center) {
                    Title1Text(color: Color("ForegroundColor"),
                               text: "Личные данные")
                    
                    MainTextField(result: $firstName,
                                  isSecureField: false,
                                  text: "Имя*")
                    MainTextField(result: $secondName,
                                  isSecureField: false,
                                  text: "Фамилия*")
                    MainTextField(result: $patronymicName,
                                  isSecureField: false,
                                  text: "Отчество*")
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("*Обязательное поле")
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color("darkGray"))
                    
                    Button {
                        withAnimation { action() }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(
                                    height: 46)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("AccentColor"))
                            
                            Title4Text(color: .white, text: "Далее")
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 410, alignment: .top)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
