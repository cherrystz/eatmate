//
//  AppView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    let tabItemList: [TabItem] = [
        TabItem(image: "HomeIcon", name: "Home"),
        TabItem(image: "AddIcon", name: "Create"),
        TabItem(image: "ChatIcon", name: "Chat"),
        TabItem(image: "AlarmIcon", name: "Notification")
    ]
    
    var body: some View {
        VStack {
            // Content
            VStack {
                
                switch selectedIndex {
                case 0: HomeView()
                case 1: CreateView()
                case 2: ChatView()
                case 3: NotificationView()
                default: EmptyView()
                }
                
                HStack {
                    ForEach(0..<tabItemList.count, id: \.self) { number in
                        Spacer()
                        Button(action: { selectedIndex = number }, label: {
                            TabItemDisplay(imageName: tabItemList[number].image,
                                           tagName: tabItemList[number].name,
                                           foregroundColor: selectedIndex == number ? .black : .gray)
                        })
                        Spacer()
                    }
                }
                .frame(height: 87)
                .background(.white)
            }
        }
    }
}

struct TabItem: Codable {
    var id = UUID()
    var image: String
    var name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
