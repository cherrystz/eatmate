//
//  CategoriesView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 25.04.22.
//

import SwiftUI

struct CategoriesView: View {
    
    var catagory : [String] = ["Bakery","Breakfast","Seafood","Hamburger","BBQ"]
    
    var body: some View {
        FullScreenView{
            NavbarView(  destination: AnyView(HomeView()), title: "Catagories",showBackButton: true,showMoreButton: false,shadow: 2)
            
            List{
                ForEach(catagory, id: \.self) { catagory in
                    Text(catagory)
                    
                    .padding(.horizontal,20)
            }
//                .listRowSeparator(.hidden)
            }.listStyle(.plain)
                .padding(.horizontal, -20)
          
            
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
