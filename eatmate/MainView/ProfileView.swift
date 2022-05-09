//
//  ProfileView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 28.04.22.
//

import SwiftUI
import WrappingHStack

struct ProfileView: View {
    
    @AppStorage("userApp") var userApp: Data = Data()
    
    var isSelf : Bool = false
    var username : String = "Gong"
    var age : Int = 21
    var gender : String = "Man"
    var interest : [String] = ["Bakery","Breakfast","Seafood","Hamburger","BBQ"]
    var aboutme : String = "อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ"
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Profile",canEdit: isSelf,showBackButton: true,showMoreButton: true,shadow: 2)
            // edit profile on show morebutton
            ScrollView{
                HStack{
                    VStack{
                        Button(action: {}, label: {
                            if let url = decoder().profile_picture{
                                if url != "" {
                                    AsyncImage(url: URL(string: url),
                                               content: { phase in
                                        if let image = phase.image {
                                            image.resizable()
                                        }
                                    })
                                    .frame(width: 350, height: 350)
                                    .cornerRadius(15)
                                }
                                else {
                                    Image("ProfileImageDefault")
                                        .resizable()
                                        .frame(width: 350, height: 350)
                                        .cornerRadius(15)
                                }
                            }
                        }).padding(.top,20)
                        HStack{
                            Text(decoder().name + " " + String(decoder().age == 0 ? "Unknown" : "\(decoder().age)"))
                                .font(.nunito(size: 28, weight: .semiBold))
                            Spacer()
                        }
                        HStack{
                            Image(systemName: "person")
                            Text(decoder().gender)
                                .font(.nunito(size: 20, weight: .semiBold))
                            Spacer()
                        }
                        
                        if decoder().favor_id != "" {
                            WrappingHStack(decoder().favor_id.components(separatedBy: ","), id: \.self) { (interest) in
                                InterestButtonModule(interest: interest ,disabled: true)
                            }
                        }
                        HStack{
                            Text("About me")
                                .font(.nunito(size: 24, weight: .semiBold))
                            Spacer()
                        }
                        HStack{
                            Text(decoder().description_profile)
                                .font(.kanit(size: 18, weight: .regular))
                            Spacer()
                        }
                    }
                }.padding(.horizontal,20)
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
