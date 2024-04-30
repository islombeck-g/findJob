//
//  MessangerViewBuilder.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import SwiftUI

struct MessangerViewListBuilder {
    static func build() -> some View {
        let viewModel = MessangerViewModel()
        return MessangerViewList(viewModel: viewModel)
    }
}
