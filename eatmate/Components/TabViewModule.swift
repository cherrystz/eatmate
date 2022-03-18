//
//  TabViewModule.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct TabItemDisplay: View {
    
    var imageName: String
    var tagName: String
    var foregroundColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .renderingMode(.template)
                .foregroundColor(foregroundColor)
            Text(tagName)
                .font(.nunito(size: 12, weight: .bold))
                .foregroundColor(foregroundColor)
        }
    }
}


