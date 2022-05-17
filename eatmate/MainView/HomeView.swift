//
//  HomeView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI
import SwiftColor
import Alamofire
import Lottie

struct HomeView: View {
    
    @State var textFieldSearch: String = ""
    @State var groupHome: [Group] = []
    @AppStorage("userApp") var userApp: Data = Data()
    
    let categoriesList = [
        "Esan",
        "Grill",
        "Shabu",
        "Street",
        "Italian"
    ]
    
    var body: some View {
        FullScreenView {
            ScrollView {
                VStack {
                    VStack(spacing: 0) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Good Morning")
                                    .font(.nunito(size: 18))
                                
                                Text(decoder().name)
                                    .font(.nunito(size: 24))
                            }
                            Spacer()
                            NavigationLink(destination: SettingView(), label: {
                                
                                if let url = decoder().profile_picture{
                                    if url != "" {
                                        AsyncImage(url: URL(string: url)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 48, height: 48)
                                        .cornerRadius(15)                                 }
                                    else {
                                        Image("ProfileImageDefault")
                                            .resizable()
                                            .frame(width: 48, height: 48)
                                            .cornerRadius(15)
                                    }
                                }
                                
                            })
                            
                        }
                        NavigationLink(destination: SearchView(), label: {
                            TextField("What do you want to eat ?", text: $textFieldSearch)
                                .font(.kanit(size: 18))
                                .textFieldStyle(OvalTextFieldStyle())
                                .multilineTextAlignment(.leading)
                        }).padding(.top)
                        
                        
                        
                        HStack(alignment: .bottom) {
                            NavigationLink (destination:CategoriesView(), label: {
                                HStack {
                                    Text("Categories").font(.nunito())
                                    Image(systemName: "arrow.forward.circle.fill")
                                        .font(.system(size: 24))
                                }
                            })
                            Spacer()
                        }.padding(.top, 29)
                    }
                    .padding(.leading, 26)
                    .padding(.trailing, 30)
                    
                    
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 21) {
                            Spacer()
                            ForEach(categoriesList, id: \.self) { category in
                                NavigationLink(destination: GroupCategoryView(group: category), label: {
                                    CategoriesModule(imageName: category, text: category)
                                })
                            }
                            
                            Spacer()
                        }
                    }
                    
                    HStack(alignment: .bottom) {
                        Button (action: {}, label: {
                            HStack {
                                Text("Recommended").font(.nunito())
                            }
                        })
                        Spacer()
                        Button (action: refreshGroup, label: {
                            HStack {
                                Image(systemName: "goforward")
                                    .font(.system(size: 24))
                            }
                        })
                    }.padding(.top, 20)
                        .padding(.leading, 26)
                        .padding(.trailing, 30)
                    
                    
                    Spacer()
                    
                    ScrollView{
                        
                        
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
                        
                    }.padding(.bottom,50)
                }.padding(.top, 15)
            }
        }
        .background(Color(hexString: "#F3F3F3"))
        .onAppear(perform: refreshGroup)
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
    
    func refreshGroup() {
        AF.request("\(urlAPI.rawValue)/data/groups/home_group_rec", requestModifier: { $0.timeoutInterval = 5 })
            .responseDecodable(of: ResultGroupHome.self) { response in
                switch response.result {
                case .success(let value):
                    groupHome = value.data
                    print(value.data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
