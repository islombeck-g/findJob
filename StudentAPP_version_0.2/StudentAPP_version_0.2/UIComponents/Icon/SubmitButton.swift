//
//  SubmitButton.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct SubmitButton: View {
    let action: () -> ()
    let text: String
    let textColor: Color
    
    init(action: @escaping () -> Void,
         text: String,
         textColor: Color = .text) {
        self.action = action
        self.text = text
        self.textColor = textColor
    }
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Group {
                Text("Тех. поддержка")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundStyle(Color.white)
                    .background(Color("AccentColor"))
                    .clipShape(.rect(cornerRadius: 13))
            }
            .padding(.horizontal, 16)
        }
    }
}

