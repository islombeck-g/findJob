//
//  Title3Text.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct Title3Text: View {
    private let alignment: TextAlignment
    private let color: Color
    private let text: String
    private let spacing: CGFloat
    private let lineLimit: Int
    
    init(alignment: TextAlignment = .leading,
         color: Color = Color("SecondaryColor"),
         text: String,
         lineLimit: Int = 1) {
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 24 - 18
        self.lineLimit = lineLimit
    }
    
    var body: some View {
        Text(text)
            .lineLimit(lineLimit)
            .multilineTextAlignment(alignment)
            .lineSpacing(spacing)
            .padding(.vertical, spacing / 2)
            .foregroundStyle(color)
            .bold()
    }
}
