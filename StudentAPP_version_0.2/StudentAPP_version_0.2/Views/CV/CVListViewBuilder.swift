//
//  CVListViewBuilder.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import SwiftUI

struct CVListViewBuilder {
    static func build() -> some View {
        let viewModel = CVViewModel()
        return CVListView(viewModel: viewModel)
    }
}

