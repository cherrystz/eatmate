//
//  NavbarModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI

struct NavbarView : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var title : String = "Title"
    var canEdit: Bool = false
    @State var showBackButton : Bool = true
    @State var showMoreButton : Bool = true
    @State var shadow : CGFloat = 0
    var body: some View {
     
        HStack{

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                       label: {
                    if self.showBackButton {
                        Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 24)
                    }
                    
                })

            
                
            Spacer()
            VStack() {
                Text(title)
                    .font(.nunito(size: 24, weight: .bold))
                    .lineLimit(1)
                    .padding(.horizontal, 50)
      
            }
            Spacer()
            Button(action: {
                
            },
                   label: {
                if showMoreButton{
                    NavigationLink(destination: RegisterPersonalInformationView(), label: {
                        Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 16, height: 3.7)
                    })
                }
                    
            })
                
        }
      
        .padding(.horizontal,26)
        .padding(.bottom,20)
        .accentColor(.gray)
        .background(
            Color.white.ignoresSafeArea(edges:.top)
                .shadow(radius: shadow)
        )
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
