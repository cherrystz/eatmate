//
//  NotificationView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct NotificationView: View {
    
    var notiImage : String = "Image"
    @State var notiHeader = ["Header1","Header2","Header3"]
    var notiDescription = ["Description1","Description2","Description3"]
    var notiTime = ["Time1","Time2","Time3"]
    
    var body: some View {
        FullScreenView{
            NavbarView(
                destination: AnyView(HomeView()), title: "Notification",showBackButton: false,showMoreButton: false,shadow: 2
            )
            
            List {
                
                ForEach (notiHeader, id: \.self) {
                    header in CustomRowView(header: header)
                }
                .onDelete(perform: { indexSet in
                    deleteAction(indexSet)
                })
            }.listStyle(PlainListStyle())
   
    

           

            
           
        
            
        }
        }
    func deleteAction(_ index: IndexSet) {
        notiHeader.remove(atOffsets: index)
    }
   
}


struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
