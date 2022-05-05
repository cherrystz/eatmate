//
//  LoginView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct LoginView: View {
    
    @State var emailField: String = ""
    @State private var passwordField: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image("SignInBanner")
            
            VStack(spacing: 28) {
                
                HStack {
                    Text("Sign in to EatMate")
                        .font(.nunito(size: 24, weight: .extraBold))
                    Spacer()
                }
                
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Email or Phone number")
                            .font(.nunito(size: 18, weight: .semiBold))
                        TextField("", text: $emailField)
                            .font(.nunito(size: 18, weight: .regular))
                            .textFieldStyle(BottomLineTextFieldStyle())
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Password")
                            .font(.nunito(size: 18, weight: .semiBold))
                        SecureField("", text: $passwordField)
                            .font(.nunito(size: 18, weight: .regular))
                            .textFieldStyle(BottomLineTextFieldStyle())
                            .overlay(alignment: .trailing) {
                                Button(action: {}, label: {
                                    Image(systemName: "eye.slash")
                                        .font(.system(size: 15))
                                })
                            }
                    }
                }
                
                Button(action: {}, label: {
                    Text("Forgotten your password?")
                        .font(.nunito(size: 14, weight: .regular))
                })
                
                NavigationLink(destination: ContentView(), label: {
                    Text("Sign In")
                        .font(.nunito(size: 20, weight: .extraBold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 103)
                        .padding(.vertical, 3)
                        .background(Color(hexString: "#5AB763"))
                        .cornerRadius(25)
                })
                
                LabelledDivider(horizontalPadding: 27 ,color: .black.opacity(0.8), label: {
                    Text("or")
                        .font(.nunito(size: 14, weight: .regular))
                        .foregroundColor(.black.opacity(0.8))
                })
                
                HStack() {
                    Button(action: {}, label: {
                        Image(systemName: "applelogo")
                            .resizable()
                            .frame(width: 44, height: 53)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image("FBIcon")
                            .resizable()
                            .frame(width: 53, height: 53)
                    })
                    Spacer()
                    Button(action: {}, label: {
                            Image("GIcon")
                                .resizable()
                                .frame(width: 53, height: 53)
                    })
                    
                }.padding(.horizontal, 53)
                
                NavigationLink(destination: RegisterView(), label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.nunito(size: 14, weight: .regular))
                        Text("Sign Up")
                            .font(.nunito(size: 16, weight: .bold))
                            .foregroundColor(Color(hexString: "#5AB763"))
                    }
                })
                
            }
        }
        .padding(.horizontal, 20)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
