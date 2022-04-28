//
//  CreateView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        FullScreenView{
            NavbarView(  destination: AnyView(HomeView()), title: "Create",showBackButton: false,showMoreButton: false,shadow: 2)
            ImageSliderModule()
                .frame(height: 250)
                .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
            //add image block
            
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
