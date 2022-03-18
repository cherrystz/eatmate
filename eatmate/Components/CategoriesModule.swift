//
//  CategoriesModule.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct CategoriesModule: View {
    
    var imageName: String
    var text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 7) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(15, antialiased: true)
                .shadow(color: .black.opacity(0.1), radius: 4, y: 4)
            Text(text)
                .font(.nunito(size: 20, weight: .bold))
        }
    }
}
