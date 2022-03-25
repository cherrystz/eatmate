//
//  NavbarModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI

struct NavbarView : View {
    
    var destination : AnyView
    var title : String = "Title"
    @State var backActive = false
    
    
    var body: some View {
     
        HStack{
            NavigationLink(destination: destination, isActive: $backActive){
                Button(action: {
                    self.backActive = true
                },
                       label: {
                        Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 24)
                    
                })
            }
            
                
            Spacer()
            VStack() {
                Text(title)
                    .font(.nunito(size: 24, weight: .bold))
      
            }
            Spacer()
            Button(action: {
                
            },
                   label: {
                    Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 16, height: 3.7)
            })
                
        }
        .padding(.leading, 26)
        .padding(.trailing,26)
        .padding(.bottom,20)
        .accentColor(.gray)
        .background(
            Color.white.ignoresSafeArea(edges:.top)
        )

    }
}

struct NavbarViewPreviews: PreviewProvider {
    static var previews: some View {
        VStack{
            NavbarView(destination: AnyView(HomeView()))
            Spacer()
        }
    }
}
