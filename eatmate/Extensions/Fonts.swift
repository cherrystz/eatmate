//
//  Fonts.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

extension Font {
    
    static func nunito(size: CGFloat = 24, weight: NunitoStyle = .bold) -> Font {
        return Font.custom(weight.rawValue, size: size)
    }
    
    static func kanit(size: CGFloat = 24, weight: KanitStyle = .bold) -> Font {
        return Font.custom(weight.rawValue, size: size)
    }
    
    enum NunitoStyle: String {
        case extraBold = "Nunito-ExtraBold"
        case bold = "Nunito-Bold"
        case semiBold = "Nunito-SemiBold"
        case regular = "Nunito-Regular"
        case light = "Nunito-Light"
    }
    
    enum KanitStyle: String {
        case bold = "Kanit-Bold"
        case regular = "Kanit-Regular"
        case semiBold = "Kanit-Semibold"
    }
}
