//
//  MessageManager.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 16.05.22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init() {
        getMessage()
    }
    
    func getMessage() {
        db.collection("messages").addSnapshotListener {QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else {
                print("Error fetching : \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap {documents -> Message? in
                do {
                    return try documents.data(as: Message.self)
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
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date(), sender: "me")
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error: \(error)")
        }
    }
}




