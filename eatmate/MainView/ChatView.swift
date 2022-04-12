//
//  ChatView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        FullScreenView{
            NavbarView(  destination: AnyView(HomeView()), title: "Messages",showBackButton: false,showMoreButton: false,shadow: 2)
            
           
        }
    }
    }

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
