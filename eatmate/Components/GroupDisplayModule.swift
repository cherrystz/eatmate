//
//  GroupDisplayModule.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct GroupDisplayModule: View {
    
    var imageName: String = "ShubaShabu"
    var topic: String = "ไปกินชาบูชูบากัน"
    var personCount: Int = 2
    var dueDate: String = "22 มีนาคม 2565"
    var catagory: String = "Shabu"
    
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 335, height: 156, alignment: .center)
                .clipped()
                .cornerRadius(15, corners: [.topLeft, .topRight])
            
            VStack(spacing: 5) {
                HStack{
                    Text(catagory)
                        .font(.kanit(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(topic)
                        .font(.kanit(weight: .bold))
                    Spacer()
                    HStack(spacing: 4) {
                        Text("\(personCount)/10")
                            .font(.kanit(size: 12, weight: .bold))
                        Image(systemName: "person.fill")
                            .font(.system(size: 12))
                    }
                }.padding(.top,-10)
               
                HStack(alignment:.top) {
                    HStack(spacing: 6) {
                        Image("CalendarIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(dueDate).font(.kanit(size: 16, weight: .regular))
                    }
                    Spacer()
//                    Button(action: {}, label: {
//                        Text("เข้าร่วม")
//                            .foregroundColor(.white)
//                            .font(.kanit(size: 12, weight: .regular))
//                            .padding(.init(top: 8, leading: 25, bottom: 8, trailing: 25))
//                            .background(Color(hexString: "#57D96C"))
//                            .cornerRadius(10)
//                    })
                }.padding(.bottom,25)
//                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: 335, height: 245)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, y: 4)
        .padding(.bottom, 20)
    }
}

struct GroupDisplayModule_Previews: PreviewProvider {
    static var previews: some View {
        GroupDisplayModule()
//            .previewLayout(.fixed(width: 335, height: 156))
    }
}
