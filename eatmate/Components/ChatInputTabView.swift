//
//  ChatInputTabView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct ChatInputTabView: View {
    @State var chatfield : String = ""
    @EnvironmentObject var messagesManager : MessageManager
    var body: some View {
        VStack{
            GeometryReader { geometry in
                Rectangle().fill(Color(red: 216/255, green: 216/255, blue: 216/255)).frame(width: geometry.size.width, height: 2)
            }
            .frame(height: 2.0)
           
            HStack{
                HStack{
                TextField("Aa", text:$chatfield)
                        .lineLimit(2)
                        .padding(.horizontal,10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        messagesManager.sendMessage(text: chatfield)
                        chatfield = ""
                    }, label: {
                        Image(systemName: "paperplane")
                    })
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                Color.white.ignoresSafeArea(edges:.top)
                    
            )
        }
      
    }
    
}

struct ChatInputTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChatInputTabView()
    }
}
