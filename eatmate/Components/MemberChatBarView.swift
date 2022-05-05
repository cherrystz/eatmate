//
//  memberChatBarView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 17.04.22.
//

import SwiftUI

struct MemberChatBarView: View {
    var body: some View {
       
        HStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
            Spacer()
            Button(action: {}, label: {
                Text("See all")
                    .font(.kanit(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            })
        }
        .padding(.leading, 20)
        .padding(.trailing,20)
        .padding(.vertical,5)
        }
    
}

struct memberChatBarView_Previews: PreviewProvider {
    static var previews: some View {
        MemberChatBarView()
    }
}
