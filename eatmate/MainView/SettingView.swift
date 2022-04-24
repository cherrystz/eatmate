//
//  SettingView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 25.04.22.
//

import SwiftUI

struct SettingView: View {
    
    var username : String = "Phumipat Apivansri"
    
    var body: some View {
        FullScreenView{
            NavbarView(  destination: AnyView(HomeView()), title: "Profile",showBackButton: true,showMoreButton: false,shadow: 2)
            HStack{
                Image("ProfileImageDefault")
                    .resizable()
                    .frame(width: 96, height: 96)
                    .cornerRadius(15)
                VStack(alignment:.leading){
                    Text(username)
                        .font(.nunito(size: 24, weight: .bold))
                    Button(action: {}, label: {
                        Text("View my profile")
                            .font(.nunito(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                    })
                } .padding(.leading,15)
            }
            .padding(.top, 20)
            
            Form {
            Section(header: Text("Setting")) {
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "creditcard")
                        Text("Payment")
                    }
                    
                })
                Button(action: {}, label: {
                    HStack{
                        Image(systemName: "bell")
                        Text("Notification")
                    }
                })
            }
                Section(header: Text("About")) {
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "newspaper")
                            Text("Term and Policy")
                        }
                        
                    })
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "info.circle")
                            Text("About Eatmate")
                        }
                    })
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "message.circle")
                            Text("Contact us")
                        }
                        
                    })
                   
                }
                Section(header: Text("")) {
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Log out")
                        }.foregroundColor(.red)
                    })
                   
                   
                }
            }
            .font(.nunito(size: 20, weight: .regular))
            .background(Color.white)
                .onAppear { // ADD THESE
                  UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear {
                  UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
