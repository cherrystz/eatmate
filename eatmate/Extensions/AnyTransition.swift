//
//  AnyTransition.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 20/3/2565 BE.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
