//
//  PasscodeField.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 20/3/2565 BE.
//

import SwiftUI
import Combine

struct PasscodeField: View {
    
    @Binding var otpCode: String
    
    var body: some View {
        TextField("", text: $otpCode)
            .multilineTextAlignment(.center)
            .font(.nunito(size: 24, weight: .semiBold))
            .frame(height: 50)
        .accentColor(.clear)
        .foregroundColor(.clear)
        .overlay {
            HStack {
                ForEach(0..<6, id: \.self) { index in
                    VStack(spacing: 0) {
                        Text(otpCode.count >= index+1 ? "\(otpCode[index].description)" : "")
                            .onReceive(otpCode.publisher.collect()) {
                                self.otpCode = String($0.prefix(6))
                                }
                            .onReceive(Just(otpCode)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.otpCode = filtered
                                            }
                                    }
                            .keyboardType(.decimalPad)
                            .font(.nunito(size: 24, weight: .semiBold))
                        .frame(width: 45, height: 49, alignment: .center)
                        Rectangle()
                            .fill(Color.black.opacity(0.8))
                            .frame(width: 45, height: 1, alignment: .bottom)
                    }
                    if index != 5 {
                        Spacer()
                    }
                }
            }
        }
    }
}
