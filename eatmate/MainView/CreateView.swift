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
            
           
        }
    }
}
