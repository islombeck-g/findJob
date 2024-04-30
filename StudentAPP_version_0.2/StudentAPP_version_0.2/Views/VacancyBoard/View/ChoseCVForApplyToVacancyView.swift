//
//  ChoseCVForApplyToVacancyView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct ChoseCVForApplyToVacancyView: View {
    @Environment(\.dismiss) var dismiss
    let resumes = ResumeServiceFromFirebase.shared.cvs
    let action: (_ job: Job, _ cv: CvData)-> ()
    let vc:Job
    var body: some View {
        ZStack {
            Color("ForegroundColor").ignoresSafeArea()
            ScrollView {
                Title1Text(alignment: .center, text: Localizable.resume.localized)
                ForEach(resumes) { cv in
                    Button {
                        action(vc, cv)
                        dismiss()
                    } label: {
                        CvOverForm(cv: cv)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}
