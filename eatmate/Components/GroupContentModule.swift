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
                Text(groupLocation)
                    .font(.kanit(size: 14, weight: .regular))
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top, 10)
            }
        
        }
       
}

 
