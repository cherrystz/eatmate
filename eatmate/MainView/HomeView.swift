//
//  HomeView.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 9/3/2565 BE.
//

import SwiftUI
import SwiftColor

struct HomeView: View {
    
    @State var textFieldSearch: String = ""
    
    let categoriesList = [
        "Esan",
        "Grill",
        "Shabu",
        "Street",
        "Italian"
    ]
    
    var body: some View {
        FullScreenView {
            ScrollView {
                VStack {
                    VStack(spacing: 0) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Good Morning")
                                    .font(.nunito(size: 18))
                                
                                Text("John Doe")
                                    .font(.nunito(size: 24))
                            }
                            Spacer()
                            Image("ProfileImageDefault")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .cornerRadius(15)
                        }
                        
                        TextField("What do you want to eat ?", text: $textFieldSearch)
                            .font(.nunito(size: 18))
                            .textFieldStyle(OvalTextFieldStyle())
                            .padding(.top)
                        
                        HStack(alignment: .bottom) {
                            Button (action: {}, label: {
                                HStack {
                                    Text("Categories").font(.nunito())
                                    Image(systemName: "arrow.forward.circle.fill")
                                        .font(.system(size: 24))
                                }
                            })
                            Spacer()
                        }.padding(.top, 29)
                    }
                    .padding(.leading, 26)
                    .padding(.trailing, 30)
                    
                    
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 21) {
                            Spacer()
                            ForEach(categoriesList, id: \.self) { category in
                                Button(action: {}, label: {
                                    CategoriesModule(imageName: category, text: category)
                                })
                                
                            }
                        }
                    }
                    
                    HStack(alignment: .bottom) {
                        Button (action: {}, label: {
                            HStack {
                                Text("Recommended").font(.nunito())
                            }
                        })
                        Spacer()
                    }.padding(.top, 20)
                        .padding(.leading, 26)
                        .padding(.trailing, 30)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            Spacer(minLength: 21)
                            ForEach(0..<3, id: \.self) { number in
                                GroupDisplayModule()
                            }
                        }
                    }
                    
                }.padding(.top, 15)
            }
        }
        .background(Color(hexString: "#F3F3F3"))
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
