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
//            VStack{
//                Image("EatMateLogo")
//                    .resizable()
//                    .frame(width:200, height: 200)
//                    .padding(.top,80)
//                Text("EatMate")
//                    .font(.nunito(size: 40, weight: .bold))
//                Text("V 0.0.1")
//                    .font(.nunito(size: 14, weight: .bold))
//                    .padding(.bottom,20)
//                    .foregroundColor(.gray)
//                Text("Feel bored when eating alone?")
//                    .font(.nunito(size: 18, weight: .regular))
//                Text("Let us help you find your soulmate!")
//                    .font(.nunito(size: 18, weight: .regular))
//
//            }
            GeometryReader { gp in
                       ZStack {
                           VStack{
                                          Image("EatMateLogo")
                                              .resizable()
                                              .frame(width:200, height: 200)
                                              
                                          Text("EatMate")
                                              .font(.nunito(size: 40, weight: .bold))
                                          Text("V 0.0.1")
                                              .font(.nunito(size: 14, weight: .bold))
                                              .padding(.bottom,10)
                                              .foregroundColor(.gray)
                                          Text("Feel bored when eating alone?")
                                              .font(.nunito(size: 18, weight: .regular))
                                          Text("Let us help you find your Eatmate!")
                               .font(.nunito(size: 18, weight: .regular))}
                               .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                               .position(x: gp.size.width / 2, y: gp.size.height / 2)
                       
                       }}
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
