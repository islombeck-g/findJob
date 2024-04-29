//
//  CvCreateView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CvCreateView: View {
    @State private var cv: CvData
    let isCreate: Bool
    let action: (_ newCV: CvData) -> ()
//    let action1: (_ newCV: CvData) -> ()?
//    let action2: (_ newCV: CvData, _ id: String) -> ()?

    init(cv: CvData = DataConstants.emptyCvData,
         action: @escaping (_: CvData) -> Void,
//         action1: @escaping (_: CvData) -> Void?,
//         action2: @escaping (_: CvData, _ id: String) -> Void?,
         isCreate: Bool = true) {
        self.cv = cv
        self.action = action
//        self.action1 = action1
//        self.action2 = action2
        self.isCreate = isCreate
        
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                ScrollView {
                    CvCreateViewTextFieldItems(cv: $cv)
                        .padding(.vertical, 20)
                    Button {
                        cv = DataConstants.customCvData
                    } label: {
                        Group {
                            Text("Заполнить rand()")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(.white)
                                .background(Color("buttonBlue"))
                                .clipShape(.rect(cornerRadius: 13))
                        }
                    }
                    .padding(.horizontal, 16)
                    Button {
//                        if action1 != nil {action1(cv)}
//                        if action2 != nil {action2(cv, cv.id)}
                        action(cv)
                    } label: {
                        Group {
                            Text(isCreate ? Localizable.createResume.localized : Localizable.saveChanges.localized)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(.white)
                                .background(Color("AccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationBackButton()
            }
            ToolbarItem(placement: .principal) {
                Title1Text(alignment: .center, text: isCreate ? Localizable.resumeCreation.localized : Localizable.editResume.localized)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

