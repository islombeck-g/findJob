//
//  TabText.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation
import SwiftUI

struct TabText: View {
    private let alignment: Alignment
    private let color: Color
    private let text: String
    private let spacing: CGFloat
    
    init(alignment: Alignment = .leading,
         color: Color = .text,
         text: String) {
        let size: CGFloat = 10
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 12 - size
    }
    
    var body: some View {
        Text(text)
            .lineSpacing(spacing)
            .padding(.vertical, spacing / 2)
            .foregroundStyle(color)
            .frame(maxWidth: .infinity, alignment: alignment)
            .bold()
    }
}
