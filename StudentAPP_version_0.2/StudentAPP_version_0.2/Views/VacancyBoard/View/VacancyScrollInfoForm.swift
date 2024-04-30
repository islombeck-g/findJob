//
//  VacancyScrollInfoForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct VacancyScrollInfoForm: View {
    let vc: Job
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                CustomSizeText(text: vc.position, size: 30)
                    .padding(.bottom, 10)
                
                Title3Text(text: Localizable.company.localized)
                    .font(.system(size: 14))
                Title4Text(text: vc.nameOfCompany)
                Divider()
                    .padding(.bottom, 10)
                
                
                Title3Text(text: Localizable.industry.localized)
                    .font(.system(size: 14))
                Title4Text(text: vc.activity)
                Divider()
                    .padding(.bottom, 10)
                
                Title3Text(text: Localizable.industry.localized)
                    .font(.system(size: 14))
                Title4Text(text: vc.activity)
                Divider()
                    .padding(.bottom, 10)
                
                CustomSizeText(text: Localizable.jobVacancy.localized, size: 22)
                    .padding(.bottom, 5)
                
                Title3Text(text: Localizable.employmentType.localized)
                    .font(.system(size: 14))
                Title4Text(text: vc.jobType)
                Divider()
                    .padding(.bottom, 10)
            }
            
            Title3Text(text: Localizable.requiredWorkExperience.localized)
                .font(.system(size: 14))
            
            ForEach(vc.experience.indices, id: \.self) {index in
                
                HStack {
                    Circle()
                        .frame(width: 7)
                    Title4Text(text: vc.experience[index], lineLimit: 4)
                }
                .padding(.leading, 10)
            }
            Divider()
                .padding(.bottom, 10)
            
            Title3Text(text: Localizable.location.localized)
                .font(.system(size: 14))
            Title4Text(text: vc.location)
            Divider()
                .padding(.bottom, 10)
            
            Title3Text(text: Localizable.salary.localized)
                .font(.system(size: 14))
            Title4Text(text: vc.money)
            Divider()
                .padding(.bottom, 10)
            
            Title3Text(text: Localizable.aboutVacancyPlaceholder.localized)
                .font(.system(size: 14))
            Title4Text(text: vc.description, lineLimit: 20)
            
            Divider()
                .padding(.bottom, 10)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VacancyScrollInfoForm(vc: Job(
        id: "1",
        activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2))
}
