//
//  CVListView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CVListView<ViewModel>: View where ViewModel: CVViewModelProtocol {
    
    @StateObject var viewModel : ViewModel
    
    var body: some View {
        
        ZStack {
            Color("ForegroundColor").ignoresSafeArea()
            ScrollView {
                ForEach(0..<viewModel.resumes.count, id: \.self) { index in
                    NavigationLink {
                        CvFullView(cv: viewModel.resumes[index], action: viewModel.updateResume, deleteCv: viewModel.deleteResume)
                    } label: {
                        CvOverForm(cv: viewModel.resumes[index])
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 5)
                }
                if viewModel.resumes.count == 0 {
                    Title1Text(alignment: .center, text: "В данный момент нет резюме\nнужно создать", lineLimit: 5)
                        .padding(.top, 40)
                        .padding(.horizontal, 16)
                }
            }
            .padding(.top, 20)
            .refreshable {
                viewModel.getResumes()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationBackButton()
            }
            ToolbarItem(placement: .principal) {
                Title1Text(alignment: .center, text: Localizable.myCV.localized)
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    CvCreateView(action: viewModel.createResume)
                } label: {
                    Image(systemName: "square.badge.plus")
                        .foregroundStyle(Color("AccentColor"))
                        .rotationEffect(.degrees(90))
                        .frame(width: 20, height: 30)
                }
            }
        }
        
    }
}
