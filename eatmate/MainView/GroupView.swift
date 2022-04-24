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
    
    var GroupDetail = GroupDetailItem(groupOwner: "Phumipat Apivansri", groupName: "ไปกินชูบาชาบูกันเถอะ", groupMember: 2, groupLimit: 10, groupDescription: "อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง ", groupTime: "22 มีนาคม 2565", groupLocation: "กรุงเทพฯ")
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
            NavbarView(destination: AnyView(HomeView()), title: "")
            ZStack{
            ScrollView{
            ImageSliderModule()
                .frame(height: 250)
                .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
            GroupContentModule(groupOwner: GroupDetail.groupOwner,groupName: GroupDetail.groupName, groupMember: GroupDetail.groupMember, groupLimit: GroupDetail.groupLimit, groupDescription: GroupDetail.groupDescription, groupTime: GroupDetail.groupTime, groupLocation: GroupDetail.groupLocation,status:status
            ).padding(.bottom,60)
            
            }
                VStack{
                    Spacer()
                    HStack {
                        Button(action: {
                            ButtonToggle()
                        }, label: {
                            Text(groupApprove ? "ยกเลิก" : "เข้าร่วม")
                                .font(.kanit(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 272, height: 33,alignment: .center)
                                .background(groupApprove ? Color.red : Color.green)
                                .cornerRadius(25)

                        })
                            .shadow(color: Color.black.opacity(0.3),
                                    radius: 3,
                                    x: 3,
                                    y: 3)
                            .padding(.bottom,20)
                    }

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
