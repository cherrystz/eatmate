//
//  AsyncImageView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/5/2565 BE.
//

import SwiftUI

struct AsyncImageView<Content> : View where Content : View {

    let url: URL?
    @ViewBuilder let content: (AsyncImagePhase) -> Content

    @State private var currentUrl: URL?
    
    
    
    var body: some View {
        AsyncImage(url: currentUrl, content: content)
        .onAppear {
            if currentUrl == nil {
                DispatchQueue.main.async {
                    currentUrl = url
                }
            }
        }
    }
}
