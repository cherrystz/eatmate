//
//  GoogleLoginModel.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct GoogleLoginModel: View {
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    
    var body: some View {
        Button(action: handlelogin, label: {
            HStack(alignment: .center) {
                Image("GIcon")
                    .resizable()
                    .frame(width: 33, height: 33)
                Text("Sign in with Google")
                    .font(.system(size: 20 , weight: .semibold))
            }
            .foregroundColor(.black)
            .background(Color(hexString: "#FFFFFF"))
            .frame(width: 300, height: 55)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 1.5)
            )
        })
    }
    
    func handlelogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) { user, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else {
                    return
                }
                
                print(user.displayName ?? "Success!")
                loggedIn.toggle()
                bottomSheetShown = false
                
            }
            
        }
    }
}
