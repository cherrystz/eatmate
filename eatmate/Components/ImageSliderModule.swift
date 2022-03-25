//
//  ImageSlider.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 26.03.22.
//

import SwiftUI

struct ImageSliderModule: View {
    
    var imageName = ["ShubaShabu","shabu2"]
    
    var body: some View {
        
        TabView {
            ForEach(imageName, id: \.self) {
                item in Image(item)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderModule()
    }
}
