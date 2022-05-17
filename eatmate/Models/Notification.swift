//
//  Notification.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 17/5/2565 BE.
//

import Foundation

struct Notification: Encodable, Decodable, Hashable {
    var _id: String = ""
    var name: String = ""
    var description: String = ""
    var time: String = ""
}
