//
//  CategoriesView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 25.04.22.
//

import SwiftUI

struct CategoriesView: View {
    
    var catagory : [String] = ["Breakfast","BBQ","Drink","Esan","Noodles","Japanese","Desserts","Coffee","Meat","Chinese","European","Chicken", "Salad","Italian","Streets","Grill","Shabu","Street","Seafood"]
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Catagories",showBackButton: true,showMoreButton: false,shadow: 2)
            
            List{
                ForEach(catagory, id: \.self) { catagory in
                    NavigationLink(destination: GroupCategoryView(group: catagory), label: {
                        Text(catagory)
                        .padding(.horizontal,20)
                    })
                    
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
