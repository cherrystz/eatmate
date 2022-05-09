//
//  GoogleLoginModel.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI
import Firebase
import GoogleSignIn
import Alamofire

struct GoogleLoginModel: View {
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    @AppStorage("userApp") var userApp: Data = Data()
    
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
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let parameters = [
                    "name": user.displayName,
                    "register_date": dateFormatter.string(from: date),
                    "email": user.email,
                    "profile_picture": user.photoURL?.absoluteString.description,
                    "gender": "Unknown",
                    "age": "0",
                    "description_profile": "I am new EatMate!",
                    "favor_id": "",
                    "subscription_id": "",
                    "provider_id": "google",
                    "uid": user.uid,
                    "successful_profile": "false"
                ]
                print(parameters)
                
                AF.request("http://192.168.1.7:3000/data/users/check_user", method: .post,  parameters: parameters, encoder: JSONParameterEncoder.default)
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
                
                print(user.displayName ?? "Success!")
                loggedIn.toggle()
                bottomSheetShown = false
                
            }
            
        }
    }
}
