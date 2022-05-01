//
//  PrivilegeView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 02.05.22.
//

import SwiftUI

struct PrivilegeView: View {
    var body: some View {
        FullScreenView{
            NavbarView(title:"Privilages",showBackButton: true,showMoreButton: false)
        }
    }
}

struct PrivilegeView_Previews: PreviewProvider {
    static var previews: some View {
        PrivilegeView()
    }
}
