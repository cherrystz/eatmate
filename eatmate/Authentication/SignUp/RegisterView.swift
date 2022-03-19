//
//  RegisterView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct RegisterView: View {
    
    @State var countryCode: String = "+ 66"
    @State var telephoneNumber: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Register")
                    .font(.nunito(size: 24, weight: .extraBold))
                    .padding(.vertical, 27)
                
                HStack {
                    Text("Phone Number")
                        .font(.nunito(size: 18, weight: .semiBold))
                    Spacer()
                }
                
                HStack(spacing: 14) {
                    TextField("", text: $countryCode)
                        .font(.nunito(size: 18, weight: .semiBold))
                        .textFieldStyle(BottomLineTextFieldStyle())
                        .frame(width: 113)
                    
                    TextField("", text: $telephoneNumber)
                        .font(.nunito(size: 18, weight: .semiBold))
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
            }.padding(.top, 28)
            
            VStack(spacing: 39) {
                Button(action: {}, label: {
                    Text("Continue")
                        .font(.nunito(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 94)
                        .padding(.vertical, 3)
                        .background(Color(hexString: "#5AB763"))
                        .cornerRadius(25)
                })
                
                Button(action: {}, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.nunito(size: 14, weight: .regular))
                        Text("Sign in")
                            .font(.nunito(size: 16, weight: .bold))
                            .foregroundColor(Color(hexString: "#5AB763"))
                    }
                })
            }.padding(.top, 78)
            
            Spacer()
        }.padding(.horizontal, 26)
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
