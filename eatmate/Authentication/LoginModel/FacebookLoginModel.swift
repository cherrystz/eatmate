//
//  GoogleLoginModel.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI
import Firebase
import FBSDKLoginKit

struct FacebookLoginModel: View {
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    
    var body: some View {
        Button(action: FacebookLogin, label: {
            HStack(alignment: .center) {
                Image("FBIcon")
                    .resizable()
                    .frame(width: 33, height: 33)
                Text("Sign in with Facebook")
                    .font(.system(size: 18 , weight: .semibold))
            }
            .padding(.horizontal, 38)
            .padding(.vertical, 20)
            .foregroundColor(.white)
            .background(Color(hexString: "#3B5998"))
            .frame(width: 300, height: 55)
            .cornerRadius(50)
        })
    }
    
    func FacebookLogin() {
        let fbLoginManager = LoginManager()
        let permission = ["email"]
        fbLoginManager.logIn(permissions: permission, from: UIHostingController(rootView: FacebookLoginModel())) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                return
            }
            
            guard let _ = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            if result?.isCancelled == true {
                print("User canceled")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    print("asd")
                    return
                }
                
                loggedIn.toggle()
                bottomSheetShown = false
                return
                
            })
        }
    }
}

