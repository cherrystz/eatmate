//
//  User.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import Foundation

struct Group: Encodable, Decodable, Hashable {
    var _id: String = ""
    var groupName: String = ""
    var groupMember: [String] = []
    var groupLimit: Int = 0
    var groupDescription: String = ""
    var groupOwner: String = ""
    var groupTime: String = ""
    var groupLocation: String = ""
    var groupImage: String = "https://firebasestorage.googleapis.com/v0/b/eatmateapp.appspot.com/o/imageGroup%2Fjay-wennington-N_Y88TWmGwA-unsplash.jpg?alt=media"
    var groupStatus: Bool = false
    var groupType: String = ""
    
}

