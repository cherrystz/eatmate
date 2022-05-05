//
//  CreateView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 18/3/2565 BE.
//

import SwiftUI

struct CreateView: View {
    
    @State var groupNameField : String = ""
    @State var typeField : String = ""
    @State var descriptionField : String = ""
    @State var dateField = Date()
    @State var locationField : String = ""
    @State var catagory : [String] = ["Breakfast","Seafood","Snack","Noodle"]
    @State var showAlert : Bool = false
    @State var navigateActive : Bool = false
    
    
    var body: some View {
        FullScreenView{
            NavbarView(title: "Create",showBackButton: false,showMoreButton: false,shadow: 2)
            NavigationLink(destination: HomeView(), isActive: $navigateActive,label: { EmptyView() })
            ZStack{
            ScrollView{
               
            HStack{
                VStack{
                Button(action: {}, label: {
                    Image("ProfileImageDefault")
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
                                Text("Catagory")
                                    .font(.nunito(size: 18, weight: .semiBold))
                                Picker("Catagory", selection: $typeField) {
                                               ForEach(catagory, id: \.self) {
                                                   Text($0)
                                               }
                                           }
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
//                        TextField("", text: $dateField)
//                            .font(.nunito(size: 18, weight: .regular))
//                            .textFieldStyle(BottomLineTextFieldStyle())
                        DatePicker("Date", selection: $dateField, displayedComponents: [.date])
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                        .frame(maxHeight: 400)
                                        .font(.nunito(size: 18, weight: .semiBold))
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Location")
                            .font(.nunito(size: 18, weight: .semiBold))
                        TextField("", text: $locationField)
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
                                .background(Color.green)
                                .cornerRadius(25)

                        }).alert(isPresented:$showAlert) {
                            Alert(
                                title: Text("Are you sure to create the group?"),
                                
                                primaryButton: .destructive(Text("No")) {
                                    
                                },
                                secondaryButton: .default(Text("Yes")){
                                   navigateActive = true
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
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
