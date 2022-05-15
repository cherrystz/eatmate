//
//  ChatView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct ChatView: View {
    var messageArray = ["Hello dude", "หาไรกินกัน", "อยากกินชาบูมากๆเลย"]
    var body: some View {
        FullScreenView{
            NavbarView(title: "หิว อยากกินMomo paradise มากๆ เลยย",showBackButton: true,showMoreButton: false,shadow: 2)
            VStack{
            MemberChatBarView()
            VStack{
                ScrollView{
                    ForEach(messageArray, id: \.self) {
                        text in MessageBubble(message: Message(id: "1234", text: text , received: true, timestamp: Date(), sender: "Anna"))
                    }
                    .padding(.top, 20)
                }
            }
            
                ChatInputTabView()

            }
          
          
                
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
