//
//  MessageRowView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct MessageRowView: View {
    var GroupName: String
    var RecentChat: String
    var time: String
    @State var urlName: String = ""
    @State var chatRead : Bool = false
    @State var isPress : Bool = false
    var body: some View {
        
        HStack {
            //GroupImage
            if urlName != "" {
                AsyncImage(url: URL(string: urlName)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
                .cornerRadius(40)
            }
            else {
                Image("ProfileImageDefault")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading){
                HStack{
                    Text(GroupName)
                        .font(.kanit(size: 14, weight: .bold))
                        .lineLimit(1)
                        .padding(.trailing,30)
                    Spacer()
                    
                    Text(time)
                        .font(.kanit(size: 10, weight: .regular))
                        .foregroundColor(.gray)
                    
                }
                HStack{
                    
                    Text(RecentChat)
                        .font(.kanit(size: 12, weight: chatRead ?  .regular : .bold))
                        .foregroundColor(chatRead ? .gray : .black)
                        .lineLimit(2)
                        .padding(.trailing,20)
                    
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.red)
                        .opacity(chatRead ? 0 : 100)
                    
                    
                    
                }
                .padding(.top, -15)
                
            }
            
        }
        .padding(.vertical,5)
        
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(GroupName: "ไปกินชาบูกันเถอะ เย้ๆไปกินชาบูกันเถอะ เย้ๆไปกินชาบูกันเถอะ เย้ๆ",RecentChat: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "00.38", chatRead: false)
        
    }
}
