//
//  CircleImage.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct CircleImage: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .cornerRadius(100)
            .frame(width: 160, height: 160)
    }
    
}

