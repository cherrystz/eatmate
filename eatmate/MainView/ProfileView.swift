//
//  ProfileView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 28.04.22.
//

import SwiftUI
import WrappingHStack

struct ProfileView: View {
    
    var username : String = "Gong"
    var age : Int = 21
    var gender : String = "Man"
    var interest : [String] = ["Bakery","Breakfast","Seafood","Hamburger","BBQ"]
    var aboutme : String = "อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ"
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Profile",showBackButton: true,showMoreButton: true,shadow: 2)
            // edit profile on show morebutton
            ScrollView{
            HStack{
                VStack{
                Button(action: {}, label: {
                    Image("ProfileImageDefault")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .cornerRadius(15)
                }).padding(.top,20)
                HStack{
                    Text(username + " " + String(age))
                        .font(.nunito(size: 28, weight: .semiBold))
                    Spacer()
                    }
                    HStack{
                        Image(systemName: "person")
                        Text(gender)
                            .font(.nunito(size: 20, weight: .semiBold))
                        Spacer()
                        }
                   
                    WrappingHStack(interest, id: \.self) { (interest) in
                        InterestButtonModule(interest:interest,disabled: true)
                    }
                    HStack{
                        Text("About me")
                            .font(.nunito(size: 24, weight: .semiBold))
                        Spacer()
                        }
                    HStack{
                        Text(aboutme)
                            .font(.kanit(size: 18, weight: .regular))
                        Spacer()
                        }
                }
            }.padding(.horizontal,20)
            }
           
        }
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
