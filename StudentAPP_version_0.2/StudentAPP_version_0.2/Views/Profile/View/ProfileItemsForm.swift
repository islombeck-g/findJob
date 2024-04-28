//
//  ProfileItemsForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct ProfileItemsForm: View {
    var aboutMe:String
    var birthDate: String
    var institute: String
    var direction: String
    var university: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if birthDate != "" {
                Title3Text(text: "Дата рождения")
                Title4Text(text: birthDate)
            }
            if university != "" || institute != "" || direction != "" {
                Title1Text(text: "Место учёбы")
                if university != "" {
                    Title3Text(text: "Университет")
                    Title4Text(text: university)
                    Divider()
                }
                if institute != "" {
                    Title3Text(text: "Институт")
                    Title4Text(text: institute)
                    Divider()
                }
                if direction != "" {
                    Title3Text(text: "Направление")
                    Title4Text(text: direction)
                    Divider()
                }
            }
            if aboutMe != "" {
                Title3Text(text: "О себе")
                Title4Text(text: aboutMe)
                Divider()
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 16)
    }
}


