//
//  InterestSelectView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.04.22.
//

import SwiftUI
import WrappingHStack

struct InterestSelectView: View {
    
    @State var interestNumber : Int = 0
    var interest : [String] = ["Bakery","Breakfast","Seafood","Hamburger","BBQ"]
    
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Interest",showBackButton: false,showMoreButton: false,shadow: 2)
            ZStack{
            VStack{
            HStack{
                Text("คุณชอบกินอะไร")
                    .font(.kanit(size: 18, weight: .regular))
                    
                Spacer()
                Text("(เลือก "+String(interestNumber)+"/5)")
                    .font(.kanit(size: 18, weight: .regular))
            }
            
           WrappingHStack(interest, id: \.self) { (interest) in
               
               InterestButtonModule(interest:interest)
                  
               
            }
            }
                .padding(.leading, 20)
                .padding(.trailing,20)
                .padding(.top, 20)
        }
            VStack{
                Spacer()
                HStack {
                    Button(action: {}, label: {
                        Text("Save")
                            .font(.kanit(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 272, height: 33,alignment: .center)
                            .background(Color.green)
                            .cornerRadius(25)

                    })
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                        .padding(.bottom,40)
                }

            }
        }
    }
}

struct InterestSelectView_Previews: PreviewProvider {
    static var previews: some View {
        InterestSelectView()
    }
}
