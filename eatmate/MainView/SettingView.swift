//
//  SettingView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 25.04.22.
//

import SwiftUI
import MessageUI
import Lottie

struct SettingView: View {
   
    var username : String = "Phumipat Apivansri"
    @State var result: Result<MFMailComposeResult, Error>? = nil
        @State var isShowingMailView = false
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Profile",showBackButton: true,showMoreButton: false,shadow: 2)
            HStack{
                Image("ProfileImageDefault")
                    .resizable()
                    .frame(width: 96, height: 96)
                    .cornerRadius(15)
                VStack(alignment:.leading){
                    Text(username)
                        .font(.nunito(size: 24, weight: .bold))
                    NavigationLink(destination: ProfileView(), label: {
                        Text("View my profile")
                            .font(.nunito(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                    })
                } .padding(.leading,15)
            }
            .padding(.top, 20)
          
//                NavigationLink(destination: PrivilegeView(), label: {
//                    VStack(spacing: 0){
//                    HStack{
//                        LottieView(name: "8812-eatsready-home-header", loopMode: .loop)
//                            .frame(height: 150)
//                        Text("Try Premium!")
//                            .font(.nunito(size: 20, weight: .bold))
//                            .foregroundColor(.white)
//
//                    }.padding(.horizontal,20)
//
//                    }.frame(height:100)
//                            .background(.gray)
//                            .cornerRadius(20)
//                            .shadow(color: Color.black.opacity(0.3),
//                                    radius: 3,
//                                    x: 3,
//                                    y: 3)
//                }
//                ) .padding(.horizontal,26)
               
                    
            Form {
            Section(header: Text("Setting")) {
                NavigationLink(destination:MyGroupView(), label: {
                    HStack{
                        Image(systemName: "fork.knife.circle")
                        Text("History")
                    }

                })
                NavigationLink(destination: NotificationSettingVIew(), label: {
                    HStack{
                        Image(systemName: "bell")
                        Text("Notification")
                    }
                })
            }
                Section(header: Text("About")) {
                   NavigationLink(destination: PolicyView(), label: {
                        HStack{
                            Image(systemName: "newspaper")
                            Text("Term and Policy")
                        }
                        
                    })
                    NavigationLink(destination: AboutUsView(), label: {
                        HStack{
                            Image(systemName: "info.circle")
                            Text("About Eatmate")
                        }
                    }) .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                   
                    Button(action: {
                        self.isShowingMailView.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "message.circle")
                            Text("Contact us")
                        }.sheet(isPresented: $isShowingMailView) {
                            MailView(isShowing: self.$isShowingMailView, result: self.$result)
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
                  UITableView.appearance().backgroundColor = .white
                }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
