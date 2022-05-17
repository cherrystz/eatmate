//
//  GroupCategoryView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/5/2565 BE.
//

import SwiftUI
import Alamofire

struct GroupCategoryView: View {
    
    @State var group = ""
    @State var groupShow: [Group] = []
    
    var body: some View {
        FullScreenView{
            NavbarView(title: group ,showBackButton: true ,shadow: 2)
            if !groupShow.isEmpty {
                
                ScrollView{
                    ForEach(groupShow, id: \.self) { groupModule in
                        NavigationLink(destination: GroupView(groupDetail: groupModule, groupImage: groupModule.groupImage), label: {
                            GroupDisplayModule(imageName: groupModule.groupImage, topic: groupModule.groupName, personCount: groupModule.groupMember.count ,limitCount: groupModule.groupLimit, dueDate: groupModule.groupTime, catagory: groupModule.groupType)
                        })
                    }
                }
                
            }
            else
            {
                LottieView(name: "96916-searching", loopMode: .loop)
                    .frame(width: 200, height: 200)
                Text("Find Eatmate to eat with you!")
                    .font(.nunito(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top,-20)
                    .padding(.bottom,2)
                Text("Search for your favourite food or your favourite restaurant ")
                    .font(.nunito(size: 20, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear(perform: refreshGroup)
    }
    
    func refreshGroup() {
        AF.request("\(urlAPI.rawValue)/data/groups/category/\(group)", requestModifier: { $0.timeoutInterval = 5 })
            .responseDecodable(of: ResultGroupHome.self) { response in
                switch response.result {
                case .success(let value):
                    groupShow = value.data
                    print(value.data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
