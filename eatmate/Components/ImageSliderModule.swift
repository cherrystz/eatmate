//
//  ImageSlider.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 26.03.22.
//

import SwiftUI

struct ImageSliderModule: View {
    
    @Binding var imageName: String
    
    var body: some View {
        
        TabView {
            AsyncImage(url: URL(string: imageName)) { image in
                image.resizable()
                image.scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

