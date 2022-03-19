//
//  LabelledDivider.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct LabelledDivider<Content: View>: View {
    
    let label: Content
    let horizontalPadding: CGFloat
    let color: Color
    
    init(horizontalPadding: CGFloat = 20, color: Color = .gray, @ViewBuilder label: () -> Content) {
        self.label = label()
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    
    var body: some View {
        HStack {
            leadingLine
            label
            trailingLine
        }
    }
    
    var leadingLine: some View {
        VStack { Divider().background(color) }.padding(.leading, horizontalPadding)
    }
    
    var trailingLine: some View {
        VStack { Divider().background(color) }.padding(.trailing, horizontalPadding)
        
    }
}
