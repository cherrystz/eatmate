//
//  MessageManager.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 16.05.22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

class MessageManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    @Published var group_id: String = ""
    @AppStorage("userApp") var userApp: Data = Data()
    
    let db = Firestore.firestore()
    
    init(group_id: String) {
        self.group_id = group_id
        getMessage()
    }
    
    func getMessage() {
        db.collection("messages").addSnapshotListener { QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else {
                print("Error fetching : \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap {documents -> Message? in
                do {
                    let doc = try documents.data(as: Message.self)
                    if doc.group_id == self.group_id {
                        return try documents.data(as: Message.self)
                    }
                    return nil
                   
                } catch {
                    print("Error: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
            
        }
    }
    
    func sendMessage(text:String) {
        do {
            let newMessage = Message(id: "\(UUID())", group_id: group_id ,text: text, timestamp: Date(), sender: decoder().name)
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
}




