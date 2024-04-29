//
//  CvCreateViewTextFieldItems.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CvCreateViewTextFieldItems: View {
    
    @Binding var cv: CvData
    
    var body: some View {
        VStack {
            Group {
                Title3Text(text: Localizable.firstName.localized)
                MainTextField(result: $cv.firstName)
                
                Title3Text(text: Localizable.lastName.localized)
                MainTextField(result: $cv.secondName)
                
                Title3Text(text: Localizable.middleName.localized)
                MainTextField(result: $cv.patronymicName)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Title3Text(text: Localizable.age.localized)
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundStyle(Color("lightGray"))
                    TextField(Localizable.age.localized, value: $cv.age, formatter: NumberFormatter())
                        .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                    .frame(height: 50)
                
                Title3Text(text: Localizable.phone.localized)
                MainTextField(result: $cv.phoneNumber)
                
                Title3Text(text: Localizable.dateOfBirth.localized)
                MainTextField(result: $cv.birthDate)
                
                Title3Text(text: Localizable.placeOfStudy.localized)
                MainTextField(result: $cv.birthCountry)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Title3Text(text: Localizable.university.localized)
                MainTextField(result: $cv.university)
                
                Title3Text(text: Localizable.institute.localized)
                MainTextField(result: $cv.institute)
                
                Title3Text(text: Localizable.fieldOfStudy.localized)
                MainTextField(result: $cv.direction)
                
                Title3Text(text: Localizable.additionalEducation.localized)
                MainTextField(result: $cv.anotherEducation)
                
                Title3Text(text: Localizable.certificatesRecommendations.localized)
                MainTextField(result: $cv.certificates)
                Title3Text(text: Localizable.skills.localized)
                MainTextField(result: $cv.skills)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Group {
                Title3Text(text: Localizable.desiredPosition.localized)
                MainTextField(result: $cv.position)
                
                Title3Text(text: Localizable.desiredSalaryLevel.localized)
                MainTextField(result: $cv.money)
                
                Title3Text(text: Localizable.workExperience.localized)
                MainTextField(result: $cv.workExperience)
                
                Title3Text(text: Localizable.aboutMe.localized)
                MainTextField(result: $cv.aboutMe)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
    }
}
