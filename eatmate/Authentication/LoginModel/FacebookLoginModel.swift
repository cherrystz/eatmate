//
//  GoogleLoginModel.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI
import Firebase
import FBSDKLoginKit
import Alamofire

struct FacebookLoginModel: View {
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    @AppStorage("userApp") var userApp: Data = Data()
    
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
                
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let parameters = [
                    "name": user?.user.displayName,
                    "register_date": dateFormatter.string(from: date),
                    "email": user?.user.email,
                    "profile_picture": user?.user.photoURL?.absoluteString.description,
                    "gender": "Unknown",
                    "birthday": "",
                    "description_profile": "I am new EatMate!",
                    "favor_id": "",
                    "subscription_id": "",
                    "provider_id": "facebook",
                    "uid": user?.user.uid,
                    "successful_profile": "false"
                ]
                print(parameters)
                
                AF.request("\(urlAPI)/data/users/check_user", method: .post,  parameters: parameters, encoder: JSONParameterEncoder.default)
                        .responseDecodable(of: ResultResponse.self) { response in
                            switch response.result {
                            case .success(let value):
                                let encoder = JSONEncoder()
                                if let data = try? encoder.encode(value.data) {
                                    userApp = data
                                }
                            case .failure(let error):
                                print(error)
                            }
                    }
                
                loggedIn.toggle()
                bottomSheetShown = false
                return
                
            })
        }
    }
}

