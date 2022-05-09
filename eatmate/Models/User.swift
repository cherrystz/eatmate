//
//  User.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import Foundation

struct User: Encodable, Decodable {
    var _id: String = ""
    var name: String = ""
    var register_date: String = ""
    var email: String = ""
    var profile_picture: String = ""
    var gender: String = ""
    var age: Int = 0
    var description_profile: String = ""
    var favor_id: String = ""
    var subscription_id: String = ""
    var provider_id: String = ""
    var uid: String = ""
    var successful_profile: Bool = false
}

var userGuest = User(_id: "", name: "Guest", register_date: "", email: "", profile_picture: "", gender: "", age: 0, description_profile: "", favor_id: "", subscription_id: "", provider_id: "", uid: "", successful_profile: false)

