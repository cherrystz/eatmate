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
            LottieView(name: "96916-searching", loopMode: .loop)
                .frame(width: 200, height: 200)
           
                Text("Find Eatmate to eat with you!")
                    .font(.nunito(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top,-20)
            Text("Search for your favourite food or your favourite restaurant ")
                .font(.nunito(size: 20, weight: .regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top,-20)
            Spacer()
            //Search sorting by groupname or restaurant name in groupname
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
