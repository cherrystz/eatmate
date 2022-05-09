//
//  SettingView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 25.04.22.
//

import SwiftUI
import MessageUI
import Lottie
import GoogleSignIn
import Firebase

struct SettingView: View {
   
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State private var showingAlert = false
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    @AppStorage("userApp") var userApp: Data = Data()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Profile",showBackButton: true,showMoreButton: false,shadow: 2)
            HStack{
                if let url = decoder().profile_picture{
                    if url != "" {
                        AsyncImage(url: URL(string: url))
                        .frame(width: 48, height: 48)
                        .cornerRadius(15)
                    }
                    else {
                        Image("ProfileImageDefault")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .cornerRadius(15)
                    }
                }
                VStack(alignment:.leading){
                    Text(decoder().name)
                        .font(.nunito(size: 24, weight: .bold))
                    NavigationLink(destination: ProfileView(isSelf:true), label: {
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
                    Button(action: { showingAlert.toggle() }, label: {
                        HStack{
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Log out")
                        }.foregroundColor(.red)
                    })
                    .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Sign out"),
                                message: Text("Are you sure to sign out?"),
                                primaryButton: .default(
                                    Text("Cancel"),
                                    action: {}
                                ),
                                secondaryButton: .destructive(
                                    Text("Sign out"),
                                    action: { logout() }
                                )
                            )
                        }
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
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
    
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        try? Auth.auth().signOut()
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(userGuest) {
            userApp = data
        }
        loggedIn = false
        bottomSheetShown = false
        self.presentationMode.wrappedValue.dismiss()
    }
}
