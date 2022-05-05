//
//  RegisterPersonalInformationView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 28.04.22.
//

import SwiftUI

struct RegisterPersonalInformationView: View {
    
    @State var nameField : String = ""
    @State var birthdayField : String = ""
    @State var genderField : String = ""
    
    
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
                    Button(action: {}, label: {
                        Image("ProfileImageDefault")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .cornerRadius(15)
                    })
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Name")
                            .font(.nunito(size: 18, weight: .semiBold))
                        TextField("", text: $nameField)
                            .font(.nunito(size: 18, weight: .regular))
                            .textFieldStyle(BottomLineTextFieldStyle())
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Gender")
                            .font(.nunito(size: 18, weight: .semiBold))
                        TextField("", text: $genderField)
                            .font(.nunito(size: 18, weight: .regular))
                            .textFieldStyle(BottomLineTextFieldStyle())
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Birthday")
                            .font(.nunito(size: 18, weight: .semiBold))
                        TextField("", text: $birthdayField)
                            .font(.nunito(size: 18, weight: .regular))
                            .textFieldStyle(BottomLineTextFieldStyle())
                    }
                    VStack(spacing: 22) {
                        
                        NavigationLink(destination: InterestSelectView()) { EmptyView() }
                        Button(action: {
                        }
                               , label: {
                            HStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.system(size: 35))
                            }
                        })
                    }.padding(.top, 10)
                    }.alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                        .position(x: gp.size.width / 2, y: gp.size.height / 2)
                }
                
            }.padding(.top, 28)
            Spacer()
        }.padding(.horizontal, 20)
            .navigationBarHidden(true)
        
    }}

struct RegisterPersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPersonalInformationView()
    }
}
