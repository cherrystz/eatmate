//
//  CustomRowView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 12.04.22.
//

import SwiftUI

struct CustomRowView: View {
    var header: String
    var description: String
    var time: String
    var body: some View {
        Button(action: {}, label: {
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)
                VStack(alignment: .leading){
                    HStack{
                        Text(header)
                            .font(.kanit(size: 14, weight: .bold))
                        Spacer()
                        Text(time)
                            .font(.kanit(size: 10, weight: .regular))
                           
                    }
                    
                    Text(description)
                        .font(.kanit(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
              
            }
            .padding(.leading, 20)
            .padding(.trailing,10)
            .padding(.vertical,5)
            
        })
       
       
    }
    
}

struct CustomRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowView(header: "header",description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo sapien quis cursus. ", time: "time")
        
    }
}
