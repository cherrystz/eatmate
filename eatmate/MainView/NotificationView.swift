//
//  NotificationView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI
import grpc
struct NotificationItem: Identifiable,Hashable {
    let id = UUID()
    let header : String
    let description : String
    let time : String
}

struct NotificationView: View {
    
    var notiImage : String = "Image"
 
    @State private var notificationList: [NotificationItem] = [
        NotificationItem(header: "Header", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "7 March 10.02 PM"),
        NotificationItem(header: "Header", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "7 March 10.02 PM"),
        NotificationItem(header: "Header", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "7 March 10.02 PM"),
        NotificationItem(header: "Header", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "7 March 10.02 PM")
        
    ]
    
    var body: some View {
        FullScreenView{
            NavbarView(
                destination: AnyView(HomeView()), title: "Notification",showBackButton: false,showMoreButton: false,shadow: 2
            )
            
            List {
               ForEach (notificationList,id: \.self) { NotificationItem in
                   CustomRowView(header: NotificationItem.header, description: NotificationItem.description, time:NotificationItem.time)
                   
                      
               }
                .onDelete(perform: { indexSet in
                    deleteAction(indexSet)
                })
            }.listStyle(.plain)
                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
   
    

           

            
           
        
            
        }
        }
    func deleteAction(_ index: IndexSet) {
        notificationList.remove(atOffsets: index)
    }
   
}


struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
