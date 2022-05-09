//
//  AppleLoginModel.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/5/2565 BE.
//

import SwiftUI
import CryptoKit
import Firebase
import AuthenticationServices
import Alamofire

struct AppleLoginModel: View {
    
    @AppStorage("isLoggedIn") var loggedIn = false
    @AppStorage("bottomSheetShown") private var bottomSheetShown = false
    @AppStorage("userApp") var userApp: Data = Data()
    
    var body: some View {
        
        SignInWithAppleButton(
            onRequest: { request in
                let nonce = randomNonceString()
                currentNonce = nonce
                request.requestedScopes = [.fullName, .email]
                request.nonce = sha256(nonce)
            }, onCompletion: { result in
                switch result {
                case .success(let authResults):
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        
                        guard let nonce = currentNonce else {
                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                        }
                        guard let appleIDToken = appleIDCredential.identityToken else {
                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                        }
                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                            return
                        }
                        
                        let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                        Auth.auth().signIn(with: credential) { (authResult, error) in
                            if (error != nil) {
                                // Error. If error.code == .MissingOrInvalidNonce, make sure
                                // you're sending the SHA256-hashed nonce as a hex string with
                                // your request to Apple.
                                print(error?.localizedDescription as Any)
                                return
                            }
                            
                            
                            let date = Date()
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            let parameters = [
                                "name": "EatMater",
                                "register_date": dateFormatter.string(from: date),
                                "email": Auth.auth().currentUser?.email,
                                "profile_picture": "",
                                "gender": "Unknown",
                                "age": "0",
                                "description_profile": "I am new EatMate!",
                                "favor_id": "",
                                "subscription_id": "",
                                "provider_id": "google",
                                "uid": Auth.auth().currentUser?.uid,
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

                            loggedIn.toggle()
                            bottomSheetShown = false
                            print("signed in")
                        }
                        
                        print("\(String(describing: Auth.auth().currentUser?.uid))")
                    default:
                        break
                        
                    }
                default:
                    break
                }
            })
        .frame(width: 300, height: 55, alignment: .center)
        .cornerRadius(30)
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    
    @State var currentNonce:String?
    
    //Hashing function using CryptoKit
    @available(iOS 13, *)
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    
}
