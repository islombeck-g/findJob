//
//  CvOverForm.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CvOverForm: View {
    
    let cv:CvData
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .foregroundColor(Color("infoView"))
                
                VStack(alignment: .leading) {
                    Title1Text(text: cv.position, lineLimit: 1)
                        .padding(.bottom, 5)
                    Group {
                        Title4Text(text: Localizable.age.localized + ":" + " \(cv.age) " + Localizable.years.localized, lineLimit: 1)
                        Title4Text(text: cv.employmentType, lineLimit: 1)
                        Title4Text(text: Localizable.university.localized + ": \(cv.university)", lineLimit: 1)
                    }
                    .font(.system(size: 9))
                    Title2Text(text: cv.money)
                        .padding(.top, 5)
                    Title3Text(text: cv.aboutMe, lineLimit: 2)
                        .font(.system(size: 12))
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
            }
        }
    }
}
#Preview {
    CvOverForm(cv: CvData(id: "", parentID: "", age: 10, position: "sdfsdf", firstName: "adsf", secondName: "adsf", patronymicName: "adfasd", birthDate: "10.10.2023", birthCountry: "adsf", phoneNumber: "asdf", university: "adsf", institute: "dsaf", direction: "adsf", anotherEducation: "adsf", certificates: "adsf", skills: "sadf", money: "adsf", workExperience: "asdf", employmentType: "полная занятость", aboutMe: "ad fhfdisuf"))
}
