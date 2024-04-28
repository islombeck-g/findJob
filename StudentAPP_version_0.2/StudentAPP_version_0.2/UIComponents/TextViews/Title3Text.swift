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
    
    init(alignment: TextAlignment = .leading,
         color: Color = Color("SecondaryColor"),
         text: String) {
        let size: CGFloat = 18
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 24 - size
    }
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(alignment)
            .lineSpacing(spacing)
            .padding(.vertical, spacing / 2)
            .foregroundStyle(color)
            .bold()
    }
}
