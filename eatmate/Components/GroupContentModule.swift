//
//  GroupContentModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 26.03.22.
//

import SwiftUI


struct GroupContentModule: View {
    
    var groupOwner : String
    var groupName: String
    var groupMember : Int
    var groupLimit : Int
    var groupDescription : String
    var groupTime : String
    var groupLocation : String
    var status : Int 
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "person.fill")
                    Text(groupOwner)
                }
                .foregroundColor(.gray)
                HStack{
                    Text(groupName)
                        .font(.kanit(size: 32, weight: .bold))
                    Spacer()
                   Text(String(groupMember)+"/"+String(groupLimit))
                        .font(.kanit(size: 16, weight: .bold))
                }
                
                switch status {
                case 0:
                    Text("รอการอนุมัติ")
                        .font(.kanit(size: 20, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.bottom, 1)
                case 1:
                    Text("เข้าร่วมกลุ่มแล้ว")
                        .font(.kanit(size: 20, weight: .bold))
                        .foregroundColor(.green)
                        .padding(.bottom, 1)
                default:
                    Text("")
                }
               
                Text(groupDescription)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.kanit(size: 14, weight: .regular))
                    .padding(.bottom, 1)
                    
                Text("เวลานัด")
                    .font(.kanit(size: 24, weight: .bold))
                Text(groupTime)
                    .font(.kanit(size: 14, weight: .regular))
                    .padding(.bottom, 1)
                Text("สถานที่")
                    .font(.kanit(size: 24, weight: .bold))
                Link("ดูสถานที่",
                      destination: URL(string: "https://www.google.com/maps/place/Shuba+Shabu+(Ratchathewi)+%E0%B8%8A%E0%B8%B9%E0%B8%9A%E0%B8%B2+%E0%B8%8A%E0%B8%B2%E0%B8%9A%E0%B8%B9+(%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B9%80%E0%B8%97%E0%B8%A7%E0%B8%B5)/@13.7517685,100.5297017,17z/data=!3m1!4b1!4m5!3m4!1s0x30e29ecb7db75303:0xbeb219bab8d260bf!8m2!3d13.7517633!4d100.5318904")!)
                    .font(.kanit(size: 14, weight: .regular))
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top, 10)
            }
        
        }
       
}

 
