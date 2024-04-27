//
//  CreateAccountBuilder.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct CreateAccountViewBuilder {
    static func build() -> some View {
        let viewModel = CreateAccountViewModel()
        return CreateAccountView(viewModel: viewModel)
    }
}
