//
//  MessageBubble.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 15.05.22.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime : Bool = false
    @AppStorage("userApp") var userApp: Data = Data()
    
    var body: some View {
        VStack(alignment: decoder().name != message.sender ? .leading : .trailing) {
            HStack {
                VStack(alignment:.leading){
                    if decoder().name != message.sender {
                        Text(message.sender)
                            .font(.kanit(size: 18, weight: .regular))
                            .padding(.bottom, -5)
                    }
                   
                Text(message.text)
                    .font(.kanit(size: 20, weight: .regular))
                    .padding()
                    .background(decoder().name != message.sender ? Color(hex: 0xe0e0e0) : Color(hex: 0xEFAE8A))
                    .cornerRadius(20)
                    
                }
            }
            .frame(maxWidth: 300, alignment: decoder().name != message.sender ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.kanit(size: 16, weight: .semiBold))
                    .foregroundColor(.gray)
                    .padding(decoder().name != message.sender ? .leading : .trailing)
            }
        }
        .frame(maxWidth: .infinity, alignment: decoder().name != message.sender ? .leading : .trailing)
        .padding(.horizontal, 20)
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1234", group_id: "", text: "Hello dude", timestamp: Date(), sender: "Anna"))
    }
}
