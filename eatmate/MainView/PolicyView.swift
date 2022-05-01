//
//  PolicyView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 02.05.22.
//

import SwiftUI

struct PolicyView: View {
    let fileUrl = Bundle.main.url(forResource: "privacy_policy_20220502-1_th", withExtension: "pdf")!

    var body: some View {
        PDFKitView(url: self.fileUrl)
    }
}

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}
