//
//  FullScreenView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct FullScreenView<Content: View>: View {
    
    let content: Content
    
    // init form
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            VStack {
                
                self.content
                Spacer(minLength: 0)
                
            }
            Spacer(minLength: 0)
        }
    }
}

