//
//  Title1Text.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation
import SwiftUI

struct Title1Text: View {
    private let alignment: TextAlignment
    private let color: Color
    private let text: String
    private let spacing: CGFloat
    
    init(alignment: TextAlignment = .leading,
         color: Color = .text,
         text: String) {
        let size: CGFloat = 26
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 32 - size
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 26))
            .kerning(0.25)
            .multilineTextAlignment(alignment)
            .lineSpacing(spacing)
            .padding(.vertical, spacing / 2)
            .foregroundStyle(color)
            .bold()
    }
}
