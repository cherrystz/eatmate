//
//  SearchView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 02.05.22.
//

import SwiftUI

struct SearchView: View {
    
    @State var textFieldSearch: String = ""
    
    var body: some View {
        VStack{
        TextField("What do you want to eat ?", text: $textFieldSearch)
            .font(.kanit(size: 18))
            .textFieldStyle(OvalTextFieldStyle())
            .padding(.horizontal, 20)
            
        Spacer()
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
