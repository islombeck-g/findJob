//
//  Title4Text.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation
import SwiftUI

struct Title4Text: View {
    private let alignment: Alignment
    private let color: Color
    private let text: String
    private let spacing: CGFloat
    private let lineLimit: Int
    
    init(alignment: Alignment = .center,
         color: Color = Color("SecondaryColor"),
         text: String,
         lineLimit: Int = 1) {
        self.alignment = alignment
        self.color = color
        self.text = text
        self.spacing = 20 - 16
        self.lineLimit = lineLimit
    }
    
    var body: some View {
        Text(text)
            .lineLimit(lineLimit)
            .kerning(0.2)
            .lineSpacing(spacing)
            .foregroundStyle(color)
            .bold()
    }
}
