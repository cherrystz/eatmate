//
//  AboutUsView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 28.04.22.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        FullScreenView{
            NavbarView(  destination: AnyView(SettingView()), title: "Eatmate",showBackButton: true,showMoreButton: false,shadow: 2)
            VStack{
                Image("EatMateLogo")
            }
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
