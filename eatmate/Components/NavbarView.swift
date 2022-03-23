//
//  NavbarModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI

struct NavbarView: View {
    
    var title : String = "Title"
 
    
    var body: some View {
     
        HStack{
            Button(action: {
                
            },
                   label: {
                    Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12, height: 24)
                
            })
                
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
        .accentColor(.gray)

    }
}

struct NavbarViewPreviews: PreviewProvider {
    static var previews: some View {
        VStack{
            NavbarView()
            Spacer()
        }
    }
}
