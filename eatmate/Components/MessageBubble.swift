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
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                VStack(alignment:.leading){
                    if message.received {
                        Text(message.sender)
                            .font(.kanit(size: 18, weight: .regular))
                            .padding(.bottom, -5)
                    }
                   
                Text(message.text)
                    .font(.kanit(size: 20, weight: .regular))
                    .padding()
                    .background(message.received ? Color(hex: 0xe0e0e0) : Color(hex: 0xEFAE8A))
                    .cornerRadius(20)
                    
                }
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.kanit(size: 16, weight: .semiBold))
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(.horizontal, 20)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1234", group_id: "", text: "Hello dude", received: true, timestamp: Date(), sender: "Anna"))
    }
}
