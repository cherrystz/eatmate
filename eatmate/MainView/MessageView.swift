//
//  MessageView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI
import Alamofire

struct MessageItem: Identifiable,Hashable {
    let id = UUID()
    let groupName : String
    let recentChat : String
    let time : String
    let chatRead : Bool
}

struct MessageView: View {
    
    
    @State var groupHome: [Group] = []
    
    @State var groupString: [String] = []
    @AppStorage("userApp") var userApp: Data = Data()
    @State var isPress = false
    @State var appear = false
    @State private var MessageList : [MessageItem] = [
        MessageItem(groupName: "ไปกินชาบูชูบา", recentChat: "Gong joined the Group.", time: "00.38", chatRead: true),
        MessageItem(groupName: "KFC มีเมนูใหม่มาน่ากินมากไปกินกันน", recentChat: "พรุ่งนี้ว่างกันไหม ไปกันๆ", time: "00.45", chatRead: false),
        MessageItem(groupName: "หิว อยากกินMomo paradise มากๆ เลยย", recentChat: "ชอบเนื้อโมโม่มากกก เนื้อนุ่มสุด ๆ ต้องกินกับไข่ดิบ เนื้อนวล อร่อยขึ้นมากๆๆๆๆๆๆ", time: "00.45", chatRead: false)
    ]
    
    var body: some View {
        NavigationView {
            FullScreenView{
                NavbarView(title: "Messages",showBackButton: false,showMoreButton: false,shadow: 2)
                
                
                List {
                    if !groupHome.isEmpty {
                        ForEach(groupHome, id: \.self) { group in
                            NavigationLink {
                                ChatView(messagesManager: MessageManager(group_id: group._id), title: group.groupName)
                            } label: {
                                MessageRowView(GroupName: group.groupName, RecentChat: "", time: "", urlName: group.groupImage, chatRead: true)
                            }
                        }
                    }
                    else {
                        VStack(alignment: .center) {
                            LottieView(name: "96253-data-not-found", loopMode: .loop)
                                .frame(height: 150)
                            Text("Not Found Group? Let's Create or Join!").font(.nunito(size: 14, weight: .light)).foregroundColor(.gray)
                        }
                    }
                    
                }
                .opacity(appear ? 1 : 0)
                .listStyle(.plain)
                    .listRowSeparator(.hidden)
            }
        }
        .onAppear {
            groupString = decoder().group_id
            groupString.removeFirst()
            groupHome = []
            
            
            for id in groupString {
                searchGroup(id)
            }
            appear = true
            
            
        }
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
    
    func searchGroup(_ id: String) {
        AF.request("\(urlAPI.rawValue)/data/groups/group/\(id)", requestModifier: { $0.timeoutInterval = 5 })
            .responseDecodable(of: ResultGroup.self) { response in
                switch response.result {
                case .success(let value):
                    groupHome.append(value.data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
