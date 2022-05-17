//
//  RegisterPersonalInformationView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 28.04.22.
//

import SwiftUI
import Alamofire
import Firebase
import FirebaseStorage

struct RegisterPersonalInformationView: View {
    
    @State var nameField : String = ""
    @State var genderField : String = ""
    @State private var image = UIImage()
    @State private var imageDefault = UIImage()
    @State private var showSheet = false
    @State private var birthDate = Date()
    @AppStorage("userApp") var userApp: Data = Data()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    Text("Edit Profile")
                        .font(.nunito(size: 24, weight: .extraBold))
                        .padding(.vertical, 27)
                    Spacer()
                }
                GeometryReader { gp in
                    VStack {
                        Button(action: {
                            showSheet = true
                        }, label: {
                            if let url = decoder().profile_picture{
                                if url != "" {
                                    Image(uiImage: self.image)
                                        .resizable()
                                        .frame(width: 350, height: 350)
                                        .cornerRadius(15)
//                                    AsyncImage(url: URL(string: url)) { image in
//                                        image.resizable()
//                                    } placeholder: {
//                                        ProgressView()
//                                    }
//                                    .frame(width: 350, height: 350)
//                                    .cornerRadius(15)
                                }
                                else {
                                    Image("ProfileImageDefault")
                                        .resizable()
                                        .frame(width: 350, height: 350)
                                        .cornerRadius(15)
                                }
                            }
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
                            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                Text("Birthday")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                        }
                                .font(.nunito(size: 18, weight: .regular))
                                .textFieldStyle(BottomLineTextFieldStyle())
                        }
                        VStack(spacing: 22) {
                            
                            NavigationLink(destination: InterestSelectView()) { EmptyView() }
                            Button(action: {
                                let dateFormatter = DateFormatter()
                                var nameImage: String = ""
                                var imageUrl = decoder().profile_picture
                                
                                if image != imageDefault {
                                    dateFormatter.dateFormat = "ddMMyyyyHHmmss"
                                    nameImage = "\(dateFormatter.string(from: Date()))\(decoder().uid)"
                                    uploadImage(image: image, name: nameImage)
                                    imageUrl = "https://firebasestorage.googleapis.com/v0/b/eatmateapp.appspot.com/o/imageProfile%2F\(nameImage).jpg?alt=media"
                                }
                                
                                dateFormatter.dateFormat = "dd/MM/yyyy"
                                
                                let parameters = [
                                    "name": nameField,
                                    "birthday" : dateFormatter.string(from: birthDate),
                                    "gender": genderField,
                                    "uid": decoder().uid,
                                    "profile_picture": imageUrl
                                ]
                                print(parameters)
                                
                                AF.request("\(urlAPI.rawValue)/data/users/update_user", method: .post,  parameters: parameters, encoder: JSONParameterEncoder.default)
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
                                
                                self.presentationMode.wrappedValue.dismiss()
                            }
                                   , label: {
                                HStack {
                                    Text("Apply")
                                        .font(.nunito(size: 24, weight: .semiBold))
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.green)
                                        .cornerRadius(50)
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
     
            .onAppear {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                
                
                nameField = decoder().name
                genderField = decoder().gender
                let imageData = try? Data(contentsOf: URL(string: decoder().profile_picture)!)
                image = UIImage(data: imageData!)!
                imageDefault = UIImage(data: imageData!)!
                if decoder().birthday != "" {
                    birthDate = dateFormatter.date(from:decoder().birthday)!
                }
            }
            .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }
}


struct RegisterPersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPersonalInformationView()
    }
}
