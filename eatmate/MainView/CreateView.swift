//
//  CreateView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI
import Alamofire
import FirebaseStorage
import SwiftColor

struct CreateView: View {
    
    @State var groupNameField : String = ""
    @State var typeField : String = ""
    @State var descriptionField : String = ""
    @State var dateField = Date()
    @State var locationField : String = ""
    @State var catagory : [String] = ["Breakfast","Seafood","Snack","Noodle"]
    @State var showAlert : Bool = false

    @State var navigateActive : Bool = false
    @State var limitField : Int = 0
    @State var memberlimit : [Int] = [2,3,4,5,6,7,8,9,10]

    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var limit = 3
    @AppStorage("userApp") var userApp: Data = Data()
    @StateObject var modelPublished = PublishedState()

    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Create",showBackButton: false,showMoreButton: false,shadow: 2)
            ZStack{
                ScrollView{
                    
                    HStack{
                        VStack{
                            Button(action: {showSheet = true}, label: {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 350, height: 350)
                                    .cornerRadius(15)
                            }).padding(.top,20)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Group name")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                TextField("", text: $groupNameField)
                                    .font(.nunito(size: 18, weight: .regular))
                                    .textFieldStyle(BottomLineTextFieldStyle())
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                HStack{
                                    VStack{
                                        Text("Category")
                                            .font(.nunito(size: 18, weight: .semiBold))
                                        Picker("Category", selection: $typeField) {
                                            ForEach(catagory, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                HStack{
                                    HStack{
                                        Text("Members (\(limit))")
                                            .font(.nunito(size: 18, weight: .semiBold))
                                        Stepper("", value: $limit, in: 3...10)
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Description")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                TextField("", text: $descriptionField)
                                    .font(.nunito(size: 18, weight: .regular))
                                    .textFieldStyle(BottomLineTextFieldStyle())
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Date")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                
                                DatePicker("Date", selection: $dateField, displayedComponents: [.date, .hourAndMinute])
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .frame(maxHeight: 400)
                                    .font(.nunito(size: 18, weight: .semiBold))
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Location")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                TextField("Fill in Google Map Link", text: $locationField)
                                    .font(.nunito(size: 18, weight: .regular))
                                    .textFieldStyle(BottomLineTextFieldStyle())
                            }
                        }
                   
                    }.padding(.horizontal,20)
                        .padding(.bottom,80)
                }
                VStack{
                    Spacer()
                    HStack {
                        Button(action: {
                            showAlert = true
                            //add to database and feed to homepage
                        }, label: {
                            Text("Create group")
                                .font(.kanit(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 272, height: 33,alignment: .center)
                                .background(!groupNameField.isEmpty && !descriptionField.isEmpty && !locationField.isEmpty ? Color.green : Color.gray)
                                .cornerRadius(25)
                            
                        }).disabled(groupNameField.isEmpty || descriptionField.isEmpty || locationField.isEmpty)
                        
                            .alert(isPresented:$showAlert) {
                                Alert(
                                    title: Text("Are you sure to create the group?"),
                                    
                                    primaryButton: .destructive(Text("No")) {
                                        
                                    },
                                    secondaryButton: .default(Text("Yes")){
                                        createGroup()
                                        modelPublished.changeSelected(0)
                                    }
                                )
                            }
                            .shadow(color: Color.black.opacity(0.3),
                                    radius: 3,
                                    x: 3,
                                    y: 3)
                            .padding(.bottom,20)
                    }
                    
                }
                //add image block
            }
        }
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .onAppear(perform: {
            image = UIImage.init(named: "dinnerGroup")!
        })
    }
    
    func createGroup() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMyyyyHHmmss"
        let nameUrl = "\(dateFormatter.string(from: Date()))\(decoder().uid)"
        let url = "https://firebasestorage.googleapis.com/v0/b/eatmateapp.appspot.com/o/imageGroup%2F\(image != UIImage.init(named: "dinnerGroup")! ? nameUrl : "jay-wennington-N_Y88TWmGwA-unsplash").jpg?alt=media"
        
        uploadGroupImage(image: image, name: nameUrl)
        
        dateFormatter.dateFormat = "dd/MM/yyyy-HH:mm"
        let parameters = [
            "groupName": groupNameField,
            "groupMember": decoder().uid,
            "groupLimit": "\(limit)",
            "groupDescription": descriptionField,
            "groupOwner": decoder().uid,
            "groupTime": dateFormatter.string(from: dateField),
            "groupLocation": locationField,
            "groupImage": url,
            "groupStatus": "true",
            "groupType": typeField
        ]
        print(parameters)
        
        AF.request("\(urlAPI.rawValue)/data/groups/create_group", method: .post,  parameters: parameters, encoder: JSONParameterEncoder.default)
                .responseDecodable(of: ResultGroup.self) { response in
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
    }
    
    func decoder() -> User {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(User.self, from: userApp) {
            return data
        }
        return userGuest
    }

}
