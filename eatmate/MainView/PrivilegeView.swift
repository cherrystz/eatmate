//
//  PrivilegeView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 02.05.22.
//

import SwiftUI

struct PrivilegeView: View {
    var body: some View {
        FullScreenView{
            NavbarView(title:"Privilages",showBackButton: true,showMoreButton: false)
            Spacer()
            VStack{
                Image("clip-in-restaurant")
                    .resizable()
                    .frame(width: 250,height: 200)
         
        
            .cornerRadius(20)
            Text("Activate Premium")
                .font(.nunito(size: 22, weight: .bold))
                .padding(.top,20)
            Text("Access private groups, no advertising, can create private groups and can access any groups.")
                .font(.nunito(size: 16 , weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            VStack{
                VStack{
                    HStack{
                        Text("฿ 199 / Month")
                            .font(.nunito(size: 22, weight: .bold))
                    }
                }.frame(width: 300, height: 100)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 1)
                        )
                Button(action: {}, label: {
                    Text("Proceed to payment")
                        .font(.kanit(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 272, height: 45,alignment: .center)
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.top,50)
                })
            }.padding(.top, 20)
            }
            Spacer()
        }
    }
}

struct PrivilegeView_Previews: PreviewProvider {
    static var previews: some View {
        PrivilegeView()
    }
}
