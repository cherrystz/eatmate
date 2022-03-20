//
//  StringProtocol.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 20/3/2565 BE.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
