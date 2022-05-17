//
//  Message.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 15.05.22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var group_id: String
    var text: String
    var timestamp: Date
    var sender: String
}
