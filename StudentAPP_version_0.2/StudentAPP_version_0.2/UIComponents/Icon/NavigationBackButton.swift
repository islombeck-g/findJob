//
//  NavigationBackButton.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.dismiss) var dismiss
    var callback: () -> Void
    
    init(callback: @escaping () -> Void = {}) {
        self.callback = callback
    }
    
    var body: some View {
        Button {
            dismiss()
            callback()
        } label: {
            Image(systemName: "chevron.left")
                .font(.system(size: 19))
                .fontWeight(.regular)
                .foregroundStyle(Color("SecondaryColor"))
        }
    }
}

#Preview {
    NavigationBackButton()
}
