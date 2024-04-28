//
//  CustomSizeText.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation
import SwiftUI

struct CustomSizeText: View {
    private let alignment: Alignment
    private let color: Color
    private let text: String
    private let size: CGFloat
    
    init(alignment: Alignment = .leading,
         color: Color = Color("SecondaryColor"),
         text: String,
         size: CGFloat = 18) {
        self.alignment = alignment
        self.color = color
        self.text = text
        self.size = size
    }
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.system(size: size))
            .foregroundStyle(color)
            .frame(maxWidth: .infinity, alignment: alignment)
            .bold()
    }
}
