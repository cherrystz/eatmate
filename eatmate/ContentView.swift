//
//  AppView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomeView().tabItem { TabItem(imageName: "HomeIcon", text: "Home") }
            CreateView().tabItem { TabItem(imageName: "AddIcon", text: "Create") }
            ChatView().tabItem { TabItem(imageName: "ChatIcon", text: "Chat") }
            NotificationView().tabItem { TabItem(imageName: "AlarmIcon", text: "Notification") }
        }
        
    }
}
