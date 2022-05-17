//
//  groupView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI
import SwiftColor
import Alamofire

struct groupDetailContentItem: Identifiable,Hashable {
    let id = UUID()
    var groupName : String
    var groupMember : [String]
    var groupLimit : Int
    var groupDescription : String
    var groupTime : String
    var groupLocation : String
}

struct GroupView: View {
    
    @State var groupDetail = Group()
    @State var groupOwner: String = "Phumipat Apivansri"
    @State var groupImage: String = "https://firebasestorage.googleapis.com/v0/b/eatmateapp.appspot.com/o/imageGroup%2Fjay-wennington-N_Y88TWmGwA-unsplash.jpg?alt=media"
    @State private var image = UIImage()
    @State var groupDetailContent = groupDetailContentItem( groupName: "ไปกินชูบาชาบูกันเถอะ", groupMember: [], groupLimit: 10, groupDescription: "อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบางอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดี อยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง มีซุชิด้วยนะ ไอติมก็ดีอยากไปกินชาบูมากๆ ชาบูร้านนี้ดีมากเนื้อนุ่ม เนื้อบาง ", groupTime: "22 มีนาคม 2565", groupLocation: "https://www.google.com/maps/place/Shuba+Shabu+(Ratchathewi)+%E0%B8%8A%E0%B8%B9%E0%B8%9A%E0%B8%B2+%E0%B8%8A%E0%B8%B2%E0%B8%9A%E0%B8%B9+(%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B9%80%E0%B8%97%E0%B8%A7%E0%B8%B5)/@13.7517685,100.5297017,17z/data=!3m1!4b1!4m5!3m4!1s0x30e29ecb7db75303:0xbeb219bab8d260bf!8m2!3d13.7517633!4d100.5318904")
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
                    
                    TabView {
                        Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                        .frame(height: 250)
                        .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
                    GroupContentModule(
                        groupOwner: $groupOwner,
                        groupName: groupDetail.groupName,
                        groupMember: groupDetail.groupMember,
                        groupLimit: groupDetail.groupLimit,
                        groupDescription: groupDetail.groupDescription,
                        groupTime: groupDetail.groupTime,
                        groupLocation: groupDetail.groupLocation,
                        status:status
                    ).padding(.bottom,60)
                    
                }
                VStack{
                    
                    
                    
                    
                    
                }
            }
            
        }
        .onAppear(perform: {
            loadOwner()
            let imageData = try? Data(contentsOf: URL(string: groupImage)!)
            image = UIImage(data: imageData!)!
        })
    }
    
    func loadOwner() {
        
        AF.request("\(urlAPI.rawValue)/data/users/user/\(groupDetail.groupOwner)", requestModifier: { $0.timeoutInterval = 5 })
            .responseDecodable(of: ResultUIDtoName.self) { response in
                switch response.result {
                case .success(let value):
                    groupOwner = value.data
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}




struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
