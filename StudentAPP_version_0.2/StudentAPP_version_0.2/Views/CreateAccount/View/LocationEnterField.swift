//
//  SecuredEnterField.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct LocationEnterField: View {
    
    @Binding var phoneNumber: String
    @Binding var university: String
    let action: () -> ()
    private let formatter = PhoneFormatter()
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color("SecondaryColor"))
                
                VStack(alignment: .center) {
                    Title1Text(color: Color("ForegroundColor"),
                               text: "Личные данные")
                    
                        .padding(.top,  20)
                    
                    ZStack {
                        VStack {
                            
                            MainTextField(result: $phoneNumber, 
                                          isSecureField: false,
                                          text: "Номер телефона*")
                                .onChange(of: phoneNumber) { oldValue, newValue in
                                    phoneNumber = formatter.format(number: newValue)
                                }
                            Button {} label: {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(
                                            height: 46)
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text("Прикрепить аватар")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                                
                            }
                            
                            
                            Text("*Обязательное поле")
                                .font(.system(size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color("darkGray"))
                            
                            Button {
                                withAnimation {
                                    action()
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(
                                            height: 46)
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text("Далее")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 60)
                        
                        VStack {
                            DropDownMenuView(menuActions: DataConstants.universityes,
                                             title: $university)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                }
                
                .padding(.horizontal)
            }
            .frame(maxHeight: 370)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

class PhoneFormatter {
    func format(number: String) -> String {
        let digits = number.filter { $0.isNumber }
        let mask = "+X (XXX) XXX-XX-XX"
        
        var result = ""
        var index = digits.startIndex
        
        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
