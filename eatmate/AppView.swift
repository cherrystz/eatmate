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
            HomeView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    TabItem(imageName: "HomeIcon", text: "Home")
                }
            HomeView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    TabItem(imageName: "AddIcon", text: "Create")
                }
            HomeView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    TabItem(imageName: "ChatIcon", text: "Chat")
                }
            HomeView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    TabItem(imageName: "AlarmIcon", text: "Notification")
                }
        }
    }
}
