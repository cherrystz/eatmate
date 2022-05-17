//
//  MessageView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct MessageItem: Identifiable,Hashable {
    let id = UUID()
    let groupName : String
    let recentChat : String
    let time : String
    let chatRead : Bool
}

struct MessageView: View {
    
    @State var isPress = false
    @State private var MessageList : [MessageItem] = [
        MessageItem(groupName: "ไปกินชาบูชูบา", recentChat: "Gong joined the Group.", time: "00.38", chatRead: true),
        MessageItem(groupName: "KFC มีเมนูใหม่มาน่ากินมากไปกินกันน", recentChat: "พรุ่งนี้ว่างกันไหม ไปกันๆ", time: "00.45", chatRead: false),
        MessageItem(groupName: "หิว อยากกินMomo paradise มากๆ เลยย", recentChat: "ชอบเนื้อโมโม่มากกก เนื้อนุ่มสุด ๆ ต้องกินกับไข่ดิบ เนื้อนวล อร่อยขึ้นมากๆๆๆๆๆๆ", time: "00.45", chatRead: false)
    ]
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Messages",showBackButton: false,showMoreButton: false,shadow: 2)
            
          
            List {
               ForEach (MessageList,id: \.self) { MessageItem in
                   MessageRowView(GroupName: MessageItem.groupName,RecentChat: MessageItem.recentChat, time: MessageItem.time, chatRead: MessageItem.chatRead)
                   
                      
               }
               .listRowSeparator(.hidden)
            }.listStyle(.plain)
        
                
        }
    }
    }

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
