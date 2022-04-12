//
//  CustomRowView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 12.04.22.
//

import SwiftUI

struct CustomRowView: View {
    var header: String
    var body: some View {
        HStack {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.green)
            Text(header)
        }
    }
}

struct CustomRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowView(header: "header")
    }
}
