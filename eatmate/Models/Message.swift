//
//  Message.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 15.05.22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
    var sender: String
}
