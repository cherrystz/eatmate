//
//  RegisterView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct RegisterView: View {
    
    @State var countryCode: String = "66"
    @State var telephoneNumber: String = ""
    @State private var isNextToRegisterConfirmed = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                
                HStack(alignment: .bottom ,spacing: 14) {
                    VStack(spacing: 0) {
                        Button(action: {}, label: {
                            Image("THIcon")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                            Text("+ \(countryCode)")
                                .font(.nunito(size: 18, weight: .semiBold))
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 14, height: 8, alignment: .center)
                        })
                        .padding(.bottom, 5)
                    
                        Rectangle()
                            .frame(width: 113, height: 0.5)
                            .background(.black.opacity(0.8))
                        
                    }
                    
                    TextField("", text: $telephoneNumber)
                        .font(.nunito(size: 18, weight: .semiBold))
                        .textFieldStyle(BottomLineTextFieldStyle())
                }
            }.padding(.top, 28)
            VStack(spacing: 39) {
                NavigationLink(destination: RegisterConfirmView( phoneNumber: "+\(countryCode)\(telephoneNumber)"), isActive: $isNextToRegisterConfirmed) { EmptyView() }
                Button(action: {
//                    if !telephoneNumber.isEmpty {
//                        let number = "+\(countryCode)\(telephoneNumber)"
//                        AuthManager.shared.startAuth(phoneNumber: number) { success in
//                            guard success else { return }
//                            DispatchQueue.main.async {
                                isNextToRegisterConfirmed = true
//                            }
//                        }
//                    }
                }) {
                    Text("Continue")
                        .font(.nunito(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 94)
                        .padding(.vertical, 3)
                        .background(Color(hexString: "#5AB763"))
                        .cornerRadius(25)
                }
                
                Button(action: { self.presentationMode.wrappedValue.dismiss() } , label: {
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
            .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
