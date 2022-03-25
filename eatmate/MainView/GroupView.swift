//
//  groupView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI
import SwiftColor

struct GroupView: View {
    
    var imageName: String = "ShubaShabu"
    var topic: String = "ไปกินชาบูชูบากัน"
    var personCount: Int = 2
    var dueDate: String = "22 มีนาคม 2565"
    
    var body: some View {
        FullScreenView{
            NavbarView(destination: AnyView(HomeView()), title: "")
            
            ImageSliderModule()
                .frame(height: 250)
                .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
            GroupContentModule()
            
               
        }
    }
}


struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
