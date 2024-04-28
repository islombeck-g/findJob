//
//  CircleImageForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct CircleImageForm: View {
    
    var name: String
    var secondName: String
    var patronymicName: String
    var phoneNumber: String
    
    var body: some View {
        HStack{
            Group {
                Circle()
                    .foregroundStyle(.gray)
            }
            .frame(width: 77, height: 77)
            .padding(.leading, 16)
            
            Spacer()
                .frame(width: 14)
            
            VStack(alignment: .leading) {
                Text(verbatim: "\(name) \(secondName) \(patronymicName)")
                    .lineLimit(1)
                    .fontWeight(.bold)
                Text(verbatim: "\(phoneNumber)")
            }
            .foregroundStyle(Color("SecondaryColor"))
            
            Spacer()
        }
    }
}
