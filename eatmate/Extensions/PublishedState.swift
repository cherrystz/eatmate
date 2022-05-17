//
//  PublishedState.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 17/5/2565 BE.
//

import SwiftUI

final class PublishedState: ObservableObject {
    
    @Published var selectedIndexTabBar: Int = 0
    
    func changeSelected(_ number: Int) {
        selectedIndexTabBar = number
    }
    
}
