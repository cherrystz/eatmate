//
//  Result.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import Foundation

struct ResultResponse: Decodable {
    let result: String
    let data: User
}

struct ResultCreateGroup: Decodable {
    let result: String
    let data: User
    let group: Group
}

struct ResultGroup: Decodable {
    let result: String
    let data: Group
}

struct ResultGroupHome: Decodable {
    let result: String
    let data: [Group]
}

struct ResultUIDtoName: Decodable {
    let result: String
    let data: String
}

