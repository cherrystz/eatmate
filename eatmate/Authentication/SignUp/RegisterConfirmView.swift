//
//  RegisterConfirmView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct RegisterConfirmView: View {
    
    @State var timeRemaining = 30
    @State var otpCode = ""
    var phoneNumber: String
    @State private var isSuccessOTP = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    Spacer()
                        .overlay(alignment: .leading) {
                            Button(action: { self.presentationMode.wrappedValue.dismiss() }, label: {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 24))
                            })
                        }
                    Text("Register")
                        .font(.nunito(size: 24, weight: .extraBold))
                        .padding(.vertical, 27)
                    Spacer()
                }
                
                Image("RegisterBanner")
                    .resizable()
                    .frame(width: 269, height: 151, alignment: .center)
                
                PasscodeField(otpCode: self.$otpCode)
                    .padding(.top, 50)
                
            }.padding(.top, 28)
            
            VStack(spacing: 22) {
                
                Text("0:\(String(format: "%02d", timeRemaining))")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }
                    .font(.nunito(size: 18, weight: .semiBold))
                
                Button(action: {
                    timeRemaining = 30
                    otpCode = ""
                }, label: {
                    Text("Send again")
                        .font(.nunito(size: 18, weight: .extraBold))
                        .foregroundColor(timeRemaining == 0 ? Color(hexString: "#5AB763") : .gray)
                })
                .disabled(timeRemaining != 0)
                
                Text("Please check you mailbox\nfor your registeration code")
                    .font(.nunito(size: 18, weight: .semiBold))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: HomeView(), isActive: $isSuccessOTP) { EmptyView() }
                Button(action: {
                    if !otpCode.isEmpty {
                        let code = otpCode
                        AuthManager.shared.verifyCode(smsCode: code) { success in
                            guard success else {return}
                            DispatchQueue.main.async {
                                isSuccessOTP = true
                            }
                        }
                    }
                }
                       , label: {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 35))
                    }
                })
                .opacity(otpCode.count == 6 ? 1 : 0)
            }.padding(.top, 26)
            
            Spacer()
        }.padding(.horizontal, 26)
            .navigationBarHidden(true)
        
    }
}

struct RegisterConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterConfirmView(phoneNumber: "+66837798450")
    }
}
