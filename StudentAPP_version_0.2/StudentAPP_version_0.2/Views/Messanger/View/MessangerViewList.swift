//
//  MessangerViewList.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct MessangerViewList<ViewModel>: View where ViewModel: MessangerViewModelProtocol {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if viewModel.chats.isEmpty {
                        Title1Text(alignment: .center, text: "В данный момент нет чатов", lineLimit: 5)
                            .padding(.top, 40)
                            .padding(.horizontal, 16)
                    } else {
                        ForEach(viewModel.chats) { chat in
                            NavigationLink {
                                ChatDetailView(chat: chat)
                            } label: {
                                ChatOverView(chat: chat)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
                Spacer()
            }
            .onAppear {
                viewModel.loadChats()
            }
            .refreshable {
                viewModel.loadChats()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Title1Text(alignment: .center, text: Localizable.responses.localized)
                }
            }
        }
    }
}
