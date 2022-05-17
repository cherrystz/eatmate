//
//  ChatView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var messagesManager = MessageManager(group_id: "")
    @State var title: String = ""
    var body: some View {
        FullScreenView{
            NavbarView(title: "หิว อยากกินMomo paradise มากๆ เลยย",showBackButton: true,showMoreButton: false,shadow: 2)
            VStack{
            MemberChatBarView()
            VStack{
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) {
                            message in MessageBubble(message: message)
                        }
                        .padding(.top, 20)
                    } .onChange(of: messagesManager.lastMessageId) {
                        id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }}
                   
                }
            }
            
                ChatInputTabView()
                    .environmentObject(messagesManager)

            }
          
          
                
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
