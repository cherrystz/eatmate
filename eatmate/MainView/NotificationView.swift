//
//  NotificationView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI
import grpc
import Alamofire

struct NotificationItem: Identifiable,Hashable {
    let id = UUID()
    let header : String
    let description : String
    let time : String
}

struct NotificationView: View {
    
    var notiImage : String = "Image"
 
    @State private var notificationList: [Notification] = []
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Notification",showBackButton: false,showMoreButton: false,shadow: 2
            )
            
            List {
               ForEach (notificationList,id: \.self) { NotificationItem in
                   CustomRowView(header: NotificationItem.name, description: NotificationItem.description, time:NotificationItem.time)
                   
                      
               }
                .onDelete(perform: { indexSet in
                    deleteAction(indexSet)
                })
            }.listStyle(.plain)
                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
   
    

           

            
           
        
            
        }
        .onAppear(perform: fetch)
        }
    func deleteAction(_ index: IndexSet) {
        notificationList.remove(atOffsets: index)
    }
    
    func fetch() {
        AF.request("\(urlAPI.rawValue)/data/notis", requestModifier: { $0.timeoutInterval = 5 })
            .responseDecodable(of: ResultNotification.self) { response in
                switch response.result {
                case .success(let value):
                    notificationList = value.data
                case .failure(let error):
                    print(error)
                }
            }
    }
   
}


struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
