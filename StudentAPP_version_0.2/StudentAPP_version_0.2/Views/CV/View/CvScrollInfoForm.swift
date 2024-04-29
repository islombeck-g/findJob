//
//  CvScrollInfoForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CvScrollInfoForm: View {
    
    let cv: CvData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if cv.firstName != "" {
                Title3Text(text: Localizable.firstName.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.firstName)
                Divider()
            }
            if cv.secondName != "" {
                Title3Text(text: Localizable.lastName.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.secondName)
                Divider()
            }
            if cv.patronymicName != "" {
                Title3Text(text: Localizable.middleName.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.patronymicName)
                Divider()
            }
            if cv.age != 0 {
                Title3Text(text: Localizable.age.localized)
                    .font(.system(size: 14))
                Title4Text(text: "\(cv.age)")
                Divider()
            }
            if cv.phoneNumber != "" {
                Title3Text(text: Localizable.phone.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.phoneNumber)
                Divider()
            }
            if cv.birthDate != "" {
                Title3Text(text: Localizable.dateOfBirth.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.birthDate)
                Divider()
            }
            if cv.birthCountry != "" {
                Title3Text(text: "Место рождения")
                    .font(.system(size: 14))
                Title4Text(text: cv.birthCountry)
                Divider()
            }
            if cv.position != "" {
                Title3Text(text: Localizable.placeOfStudy.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.position)
                Divider()
            }
            if cv.university != "" || cv.anotherEducation != "" || cv.certificates != "" || cv.direction != "" || cv.institute != "" || cv.skills != "" {
                Group {
                    Title2Text(text: Localizable.education.localized)
                        .font(.system(size: 18))
                        .padding(.top, 5)
                    if cv.university != "" {
                        Title3Text(text: Localizable.university.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.position)
                        Divider()
                    }
                    if cv.institute != "" {
                        Title3Text(text: Localizable.institute.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.institute)
                        Divider()
                    }
                    if cv.direction != "" {
                        Title3Text(text: Localizable.fieldOfStudy.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.direction)
                        Divider()
                    }
                    if cv.anotherEducation != "" {
                        Title3Text(text: Localizable.additionalEducation.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.anotherEducation)
                        Divider()
                    }
                    if cv.certificates != "" {
                        Title3Text(text: Localizable.certificatesRecommendations.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.certificates)
                        Divider()
                    }
                    if cv.skills != "" {
                        Title3Text(text: Localizable.skills.localized)
                            .font(.system(size: 14))
                        Title4Text(text: cv.skills)
                        Divider()
                    }
                }
            }
            if cv.money != "" {
                Title3Text(text: Localizable.desiredSalaryLevel.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.money)
                Divider()
            }
            if cv.workExperience != "" {
                Title3Text(text: Localizable.workExperience.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.workExperience)
                Divider()
            }
            if cv.employmentType != "" {
                Title3Text(text: Localizable.employmentFormat.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.employmentType)
                Divider()
            }
            if cv.aboutMe != "" {
                Title3Text(text: Localizable.aboutMe.localized)
                    .font(.system(size: 14))
                Title4Text(text: cv.aboutMe, lineLimit: 10)
                Divider()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
