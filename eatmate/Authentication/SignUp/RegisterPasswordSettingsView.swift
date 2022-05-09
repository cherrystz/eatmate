//
//  RegisterPasswordSettingsView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct RegisterPasswordSettingsView: View {
  
    @State private var passwordField : String = ""
    @State private var rePasswordField : String = ""
    
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
                GeometryReader { gp in
                VStack {
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
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Repeat Password")
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
                    VStack(spacing: 22) {
                        
                        NavigationLink(destination: RegisterPersonalInformationView()) { EmptyView() }
                        Button(action: {
                        }
                               , label: {
                            HStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.system(size: 35))
                            }
                        })
                    }.padding(.top, 26)
                    }.alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                        .position(x: gp.size.width / 2, y: gp.size.height / 2)
                }
                
            }.padding(.top, 28)
            
           
            
            Spacer()
        }.padding(.horizontal, 20)
            .navigationBarHidden(true)
        
    }
}

struct RegisterPasswordSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPasswordSettingsView()
    }
}
