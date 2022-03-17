//
//  TabItem.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI

struct TabItem: View {
    
    var imageName: String = ""
    var text: String = ""
    
    var body: some View {
        VStack {
            Image(self.imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.gray)
            Text(self.text)
        }
    }
}
