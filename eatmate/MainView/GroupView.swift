//
//  groupView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI
import SwiftColor

struct GroupDetailItem: Identifiable,Hashable {
    let id = UUID()
    let groupOwner : String
    let groupName : String
    let groupMember : Int
    let groupLimit : Int
    let groupDescription : String
    let groupTime : String
    let groupLocation : String
}

struct GroupView: View {
    
    var GroupDetail = GroupDetailItem(groupOwner: "Phumipat Apivansri", groupName: "ไปกินชูบาชาบูกันเถอะ", groupMember: 2, groupLimit: 10, groupDescription: "อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง ", groupTime: "22 มีนาคม 2565", groupLocation: "https://www.google.com/maps/place/Shuba+Shabu+(Ratchathewi)+%E0%B8%8A%E0%B8%B9%E0%B8%9A%E0%B8%B2+%E0%B8%8A%E0%B8%B2%E0%B8%9A%E0%B8%B9+(%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B9%80%E0%B8%97%E0%B8%A7%E0%B8%B5)/@13.7517685,100.5297017,17z/data=!3m1!4b1!4m5!3m4!1s0x30e29ecb7db75303:0xbeb219bab8d260bf!8m2!3d13.7517633!4d100.5318904")
    @State var status : Int = 2
    @State var groupApprove : Bool = false

    
    func ButtonToggle() {
        if (groupApprove) {
            groupApprove = false
            status = 2
        } else {
            groupApprove = true
            status = 0
        }
       
        // ส่งค่ากลับDB status จาก 2 เป็น 3 ไรงี้
    }
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "")
            ZStack{
            ScrollView{
            ImageSliderModule()
                .frame(height: 250)
                .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
            GroupContentModule(groupOwner: GroupDetail.groupOwner,groupName: GroupDetail.groupName, groupMember: GroupDetail.groupMember, groupLimit: GroupDetail.groupLimit, groupDescription: GroupDetail.groupDescription, groupTime: GroupDetail.groupTime, groupLocation: GroupDetail.groupLocation,status:status
            ).padding(.bottom,60)
            
            }
                VStack{
                    
                    
                    
                    

                }
            }
           
        }
    }
}




struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
