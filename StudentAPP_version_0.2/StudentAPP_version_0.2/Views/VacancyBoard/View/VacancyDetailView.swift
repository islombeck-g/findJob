//
//  VacancyDetailView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct VacancyDetailView: View {
    let vc:Job
    @State var isFavorite: Bool = false
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        VacancyScrollInfoForm(vc: vc)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                            .frame(height: 25)
                        Button{
                            
                        } label: {
                            
                            Text("Откликнутся")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color("AccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                                .padding(.horizontal, 16)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton()
                }
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Вакансия")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                        Button {
                            withAnimation(.spring) {
                                //                            self.toggleFavorite()
                            }
                        } label: {
                            Image(systemName: isFavorite == true ?  "star.fill" : "star")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 13)
                        }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        }
    }
}

