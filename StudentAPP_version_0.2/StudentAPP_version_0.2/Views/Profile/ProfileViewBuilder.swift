//
//  ProfileViewBuilder.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct ProfileViewBuilder {
    static func build() -> some View {
        let viewModel = ProfileViewModel()
        return ProfileView(viewModel: viewModel)
    }
}
