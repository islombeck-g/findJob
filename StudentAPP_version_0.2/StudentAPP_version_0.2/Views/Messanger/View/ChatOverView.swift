//
//  ChatOverView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct ChatOverView: View {
    @ObservedObject var chat: JobApplication
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("SecondaryColor"), lineWidth: 2)
                .foregroundColor(Color("infoView"))
            HStack {
                Image(systemName: "person")
                    .font(.title)
                    .padding()
                VStack(alignment: .leading, spacing: 4) {
                    Text(chat.vacancyName)
 
                    if let lastMessage = chat.messages.last {
                        Text(lastMessage.text)
                            .foregroundStyle(.gray)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 70)
    }
}
