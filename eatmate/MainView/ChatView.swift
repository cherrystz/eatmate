//
//  ChatView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        FullScreenView{
            NavbarView(title: "หิว อยากกินMomo paradise มากๆ เลยย",showBackButton: true,showMoreButton: false,shadow: 2)
            MemberChatBarView()
           
          ChatInputTabView()
          
                
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
