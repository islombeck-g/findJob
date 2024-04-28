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
                    Text(Localizable.personalInformation.localized)
                        .foregroundStyle(Color("ForegroundColor"))
                        .font(.system(size: 34))
                        .bold()
                    
                    MainTextField(result: $firstName,
                                  isSecureField: false,
                                  text: Localizable.firstName.localized + "*")
                    MainTextField(result: $secondName,
                                  isSecureField: false,
                                  text: Localizable.lastName.localized + "*")
                    MainTextField(result: $patronymicName,
                                  isSecureField: false,
                                  text: Localizable.middleName.localized + "*")
                    
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
                            Title4Text(color: .white, text: Localizable.next.localized)
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
