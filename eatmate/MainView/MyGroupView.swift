//
//  MyGroupView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 06.05.22.
//

import SwiftUI

struct MyGroupView: View {
    var body: some View {
        FullScreenView{
            NavbarView(title: "My Group",showBackButton: true,showMoreButton: false,shadow: 2)
            ScrollView(showsIndicators: false) {
           
                GroupDisplayModule()
                GroupDisplayModule()
                GroupDisplayModule()
                GroupDisplayModule()
            }
            
        }
    }
}

struct MyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MyGroupView()
    }
}
