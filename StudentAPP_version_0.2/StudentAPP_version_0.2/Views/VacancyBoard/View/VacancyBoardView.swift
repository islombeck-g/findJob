//
//  VacancyBoardView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct VacancyBoardView<ViewModel>: View where ViewModel: VacancyBoardViewModelProtocol {

    @StateObject var viewModel: ViewModel
    @State var isFavouriteList = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button {
                            //sort items
                        } label: {
                            Image(systemName: "arrow.up.and.down.text.horizontal")
                                .padding(8)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Главная")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                        
                        Button {
                            withAnimation(.spring) {
                                viewModel.isFavouriteList.toggle()
                            }
                        }label: {
                            Image(systemName: isFavouriteList == true ?  "star.fill" : "star")
                                .padding(8)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal, 16)
                    
                    ScrollView {
                        SearchBar(text: self.$viewModel.searchText)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        
                        if viewModel.isFavouriteList == true {
                            
                            Spacer()
                                .frame(height: 15)
                            
                            ForEach(viewModel.favouriteListOfVacancy){ job in
                                NavigationLink {
                                    VacancyDetailView(vc: job, isFavorite: false)
                                } label: {
                                    VacancyOverView(vc: job)
                                }
                                .padding(.horizontal, 16)
                            }
                            .listStyle(.inset)
                        } else {
                            if viewModel.searchText == "" {
                                ScrollView(.horizontal) {
                                    LazyHStack {
                                        ForEach(viewModel.filteredJobs) { job in
                                            NavigationLink {
                                                VacancyDetailView(vc: job, isFavorite: false)
                                            } label: {
                                                VacancyOverView(vc: job)
                                            }
                                            .shadow(radius: 10)
                                        }
                                        .scrollTargetLayout()
                                    }
                                }
                                .safeAreaPadding(.vertical, 0)
                                .frame(height: 200)
                                .contentMargins(.horizontal, 16, for:.scrollContent)
                                .scrollIndicators(.hidden)
                                .scrollClipDisabled()
                                .scrollTargetBehavior(.paging)
                            }
                            
                            ForEach(viewModel.filteredJobs){ job in
                                NavigationLink {
                                    VacancyDetailView(vc: job, isFavorite: false)
                                } label: {
                                    VacancyOverView(vc: job)
                                }
                                .padding(.horizontal, 16)
                            }
                            //                        .listStyle(.inset)
                        }
                    }
                }
            }
        }
    }
}
