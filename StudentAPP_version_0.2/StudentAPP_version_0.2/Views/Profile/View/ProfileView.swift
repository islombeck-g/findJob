//
//  ProfileView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct ProfileView<ViewModel>: View where ViewModel: ProfileViewModelProtol {
    
    @StateObject var viewModel: ViewModel
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color("ForegroundColor").ignoresSafeArea()
                    VStack {
                        ScrollView {
                            CircleImageForm(
                                name: viewModel.userData?.firstName ?? "error",
                                secondName: viewModel.userData?.secondName ?? "error",
                                patronymicName: viewModel.userData?.patronymicName ?? "error",
                                phoneNumber: viewModel.userData?.phoneNumber ?? "error")
                            .padding(.vertical, 16)
                            
                            NavigationLink {
                                ViewFactory.build(.cv)
                            } label: {
                                Group {
                                    Text(LocalizedStringKey("Мое резюме"))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .foregroundStyle(Color.white)
                                        .background(Color("AccentColor"))
                                        .clipShape(.rect(cornerRadius: 13))
                                    
                                }
                                .padding(.horizontal, 16)
                            }
                            Spacer()
                                .frame(height: 36)
                            ProfileItemsForm(aboutMe: viewModel.userData?.aboutMe ?? "",
                                             birthDate: viewModel.userData?.birthDate ?? "",
                                             institute: viewModel.userData?.institute ?? "",
                                             direction: viewModel.userData?.direction ?? "",
                                             university: viewModel.userData?.university ?? "")
                            Spacer()
                                .frame(height: 30)
                            Button {
                                withAnimation {
                                    
                                }
                            } label: {
                                Group {
                                    Text("Тех. поддержка")
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .foregroundStyle(Color.white)
                                        .background(Color("AccentColor"))
                                        .clipShape(.rect(cornerRadius: 13))
                                }
                                .padding(.horizontal, 16)
                            }
                            Spacer()
                                .frame(height: 15)
                            Divider()
                            Spacer()
                                .frame(height: 10)
                            Button {
                                self.logOut_isAllertShow.toggle()
                            }label: {
                                Text(Localizable.logOut.localized)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(.red)
                                    .background(Color("darkAccentColor"))
                                    .clipShape(.rect(cornerRadius: 13))
                            }
                            .padding(.horizontal, 16)
                            .alert(Localizable.logOutConfirmation.localized, isPresented: self.$logOut_isAllertShow) {
                                Text(Localizable.cancel.localized)
                                Button {
                                    UserStateManager.shared.signOut()
                                } label: { Text(Localizable.logOut.localized) }
                            } message: {
                                Text("")
                            }
                            .alert(Localizable.deleteAccount.localized, isPresented: self.$deleteAcount_isAllertShow) {
                                Button {} label: {
                                    Text(Localizable.cancel.localized)
                                }
                                Button {
                                    
                                } label: { Text(Localizable.delete.localized) }
                            } message: {
                                Text(Localizable.accountRecoveryNote.localized)
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Menu {
                            Button{
                                
                            }label: {
                                Label("English", image: "en")
                            }
                            Button{
                                
                            }label: {
                                Label("Русский", image: "ru")
                            }
                            Button{
                                
                            }label: {
                                Label("Uzbek", image: "uz")
                            }
                            
                        } label: {
                            Image(systemName: "globe.europe.africa.fill")
                                .font(.system(size: 19))
                                .fontWeight(.bold)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Title1Text(alignment: .center, text: Localizable.profile.localized)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            NavigationLink {
                                EditAccountInfoView(user: viewModel.userData ?? DataConstants.emptyUserData , action: viewModel.saveProfileEditChanges)
                            }label:{
                                Text(Localizable.editProfile.localized)
                            }
                            Divider()
                            Button(role: .destructive) {
                                self.deleteAcount_isAllertShow.toggle()
                            }label:{
                                Text(Localizable.deleteAccount.localized)
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 6)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }
            .task {
                await viewModel.getUserData()
            }
        }
    }
}
