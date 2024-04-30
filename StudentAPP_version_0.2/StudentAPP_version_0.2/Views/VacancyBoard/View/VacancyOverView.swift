//
//  VacancyOverView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct VacancyOverView: View {
    let vc: Job
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .foregroundColor(Color("infoView"))
                
                VStack(alignment: .leading) {
                    Title1Text(text: vc.position, lineLimit: 1)
                        .padding(.bottom, 5)
                    Group {
                        Title4Text(text: Localizable.requiredExperience.localized + ": \(vc.minExperience) " + Localizable.years.localized,
                                   lineLimit: 1)
                        Title4Text(text: Localizable.industry.localized + ": \(vc.activity)",
                                   lineLimit: 1)
                        Title4Text(text: Localizable.company.localized + ": \(vc.nameOfCompany)", lineLimit: 1)
                    }
                    .font(.system(size: 9))
                    Title2Text(text: vc.money, linelimit: 1)
                        .font(.system(size: 17))
                    Text(vc.description)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 12))
                        .foregroundStyle(Color("SecondaryColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
    }
}
