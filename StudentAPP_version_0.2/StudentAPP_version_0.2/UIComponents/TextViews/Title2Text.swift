//
//  Title2Text.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct Title2Text: View {
    private let alignment: TextAlignment
    private let color: Color
    private let text: String
    private let spacing: CGFloat
    private let lineLimit: Int
    
    init(alignment: TextAlignment = .leading,
         color: Color = Color("SecondaryColor"),
         text: String,
         isItalic: Bool = false,
         linelimit: Int = 1) {
        let size: CGFloat = 20
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 28 - size
        self.lineLimit = linelimit
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

