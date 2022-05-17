//
//  MyGroupView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 06.05.22.
//

import SwiftUI
import Alamofire

struct MyGroupView: View {
    
    @State var groupHome: [Group] = []
    @State var groupString: [String] = []
    @AppStorage("userApp") var userApp: Data = Data()
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "History",showBackButton: true,showMoreButton: false,shadow: 2)
            ScrollView(showsIndicators: false) {
           
                if !groupHome.isEmpty {
                    ForEach(groupHome, id: \.self) { groupModule in
                        NavigationLink(destination: GroupView(groupDetail: groupModule, groupImage: groupModule.groupImage), label: {
                            GroupDisplayModule(imageName: groupModule.groupImage, topic: groupModule.groupName, personCount: groupModule.groupMember.count ,limitCount: groupModule.groupLimit, dueDate: groupModule.groupTime, catagory: groupModule.groupType)
                        })
                    }
                }
                else {
                    VStack(alignment: .center) {
                        LottieView(name: "96253-data-not-found", loopMode: .loop)
                            .frame(height: 150)
                        Text("Not Found Group? Let's Create!").font(.nunito(size: 14, weight: .light)).foregroundColor(.gray)
                    }
                }
            }
            
        }
        .onAppear {
            groupString = decoder().group_id
            groupString.removeFirst()
            for id in groupString {
                searchGroup(id)
            }
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

struct MyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MyGroupView()
    }
}
