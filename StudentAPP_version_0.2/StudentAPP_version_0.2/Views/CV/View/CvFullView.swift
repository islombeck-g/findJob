//
//  CvFullView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CvFullView: View {
    
    @State private var deleteCV_isAllertShow: Bool = false
    let cv: CvData
    let action: (_ newCV: CvData) -> ()
    let deleteCv: (_ deleteCv: CvData) -> ()
    
    var body: some View {
        ZStack {
            Color("ForegroundColor").ignoresSafeArea()
            VStack {
                ScrollView {
                    CircleImageForm(name: cv.firstName,
                                    secondName: cv.secondName,
                                    patronymicName: cv.patronymicName,
                                    phoneNumber: cv.phoneNumber)
                    .padding(.vertical, 16)
                    CvScrollInfoForm(cv: cv)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 25)
                    Divider()
                }
                .foregroundStyle(Color("SecondaryColor"))
                .alert(Localizable.deleteResumeConfirmation.localized, isPresented: self.$deleteCV_isAllertShow) {
                    Button{
                    } label: {
                        Text(Localizable.cancel.localized)
                    }
                    Button {
                        deleteCv(cv)
                    } label: {
                        Text(Localizable.delete.localized)
                    }
                } message: {
                    Text("Восстановление резюме после удаления невозможно")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton()
                }
                ToolbarItem(placement: .principal) {
                    Title2Text(text: Localizable.resume.localized)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink {
                            CvCreateView(cv: cv, action: action, isCreate: false)
                        } label:{
                            Text(Localizable.editResume.localized)
                        }
                        Divider()
                        Button(role: .destructive) {
                            self.deleteCV_isAllertShow.toggle()
                        }label:{
                            Text("Удалить резюме")
                        }
                    }label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .frame(width: 20, height: 30)
                            .padding(4)
                            .padding(.trailing, 13)
                            .foregroundStyle(Color("AccentColor"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}




//.toolbar {
//
//    ToolbarItem(placement: .topBarLeading) {
//        NavigationBackButton()
//    }
//
//    ToolbarItem(placement: .principal) {
//
//        Text("Резюме")
//            .font(.system(size: 22))
//            .fontWeight(.bold)
//            .foregroundStyle(Color("SecondaryColor"))
//    }
//
//    ToolbarItem(placement: .topBarTrailing) {
//        withAnimation(.spring) {
//            Menu {
//                Button {
//                    self.router.navigateTo(route: .cvUpdate(cv: self.cv))
//                }label:{
//                    Text("Редактировать резюме")
//                }
//
//                Divider()
//
//                Button(role: .destructive) {
//                    self.deleteCV_isAllertShow.toggle()
//                }label:{
//                    Text("Удалить резюме")
//                }
//            }label: {
//                Image(systemName: "ellipsis")
//                    .rotationEffect(.degrees(90))
//                    .frame(width: 20, height: 30)
//                    .padding(4)
//                    .padding(.trailing, 13)
//                    .foregroundStyle(Color("AccentColor"))
//            }
//        }
//    }
//}
