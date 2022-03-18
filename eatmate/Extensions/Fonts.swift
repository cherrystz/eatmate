//
//  Fonts.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

extension Font {
    
    static func nunito(size: CGFloat = 24, weight: NunitoStyle = .bold) -> Font {
        return Font.custom(weight == .bold ? "Nunito-Bold" : "Nunito-Light", size: size)
    }
    
    static func kanit(size: CGFloat = 24, weight: KanitStyle = .bold) -> Font {
        return Font.custom(weight == .bold ? "Kanit-Bold" : "Kanit-Regular", size: size)
    }
    
    enum NunitoStyle {
        case bold
        case light
    }
    
    enum KanitStyle {
        case bold
        case regular
    }
}
