//
//  View.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}

