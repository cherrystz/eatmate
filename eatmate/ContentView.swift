//
//  AppView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    @AppStorage("isLoggedIn") var loggedIn = false
    @StateObject var modelPublished = PublishedState()
    
    let tabItemList: [TabItem] = [
        TabItem(image: "HomeIcon", name: "Home"),
        TabItem(image: "AddIcon", name: "Create"),
        TabItem(image: "ChatIcon", name: "Chat"),
        TabItem(image: "AlarmIcon", name: "Notification")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Content
                VStack {
                    FullScreenView {
                        switch modelPublished.selectedIndexTabBar {
                        case 0: HomeView()
                        case 1: CreateView()
                        case 2: MessageView()
                        case 3: NotificationView()
                        default: EmptyView()
                        }
                    }
                    
                    HStack {
                        ForEach(0..<tabItemList.count, id: \.self) { number in
                            Spacer()
                            Button(action: { modelPublished.changeSelected(number)}, label: {
                                TabItemDisplay(imageName: tabItemList[number].image,
                                               tagName: tabItemList[number].name,
                                               foregroundColor: modelPublished.selectedIndexTabBar == number ? .black : .gray)
                            })
                            Spacer()
                        }
                    }
                    .frame(height: 87)
                    .background(.white)
                }.disabled(!loggedIn)
            }
            .onTapGesture {
                if !loggedIn {
                    bottomSheetShown.toggle()
                }
            }
            
            
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.7
            ) {
                LoginViewCard()
            }
            .opacity(!loggedIn ? 1 : 0)
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
