//
//  InterestButtonModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.04.22.
//

import SwiftUI
import WrappingHStack

struct InterestButtonModule: View {
    
    var interest : String = "Bakery & Pasties"
    @State var interestSelected : Bool = false
    
    var body: some View {
        
        Button(action: {
            if (interestSelected) {
                interestSelected = false
            } else {
            interestSelected = true
            }
        }, label: {
            Text(interest)
                .font(.kanit(size: 18, weight: .semiBold))
                .foregroundColor(interestSelected ? Color(hex: 0xEFAE8A): .gray)
                .padding(.vertical,5)
                .padding(.horizontal,10)
                .overlay(
                           RoundedRectangle(cornerRadius: 20)
                               .stroke(interestSelected ? Color(hex: 0xEFAE8A): .gray, lineWidth: 1)
                       )
                
        }).padding(.bottom,10)
    }
}

struct InterestButtonModule_Previews: PreviewProvider {
    static var previews: some View {
        InterestButtonModule()
    }
}
