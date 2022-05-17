//
//  NavbarModule.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 24.03.22.
//

import SwiftUI
import Alamofire

struct NavbarView : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var title : String = "Title"
    var canEdit: Bool = false
    @State var showBackButton : Bool = true
    @State var showMoreButton : Bool = true
    @State var showAlert : Bool = false
    @State var shadow : CGFloat = 0
    @State var group_id : String = ""
    @State var isOwner : Bool = false
    var body: some View {
     
        HStack{

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                       label: {
                    if self.showBackButton {
                        Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 24)
                    }
                    
                })

            
                
            Spacer()
            VStack() {
                Text(title)
                    .font(.nunito(size: 24, weight: .bold))
                    .lineLimit(1)
                    .padding(.horizontal, 50)
      
            }
            Spacer()
            Button(action: {
                
            },
                   label: {
                if showMoreButton && canEdit{
                    NavigationLink(destination: RegisterPersonalInformationView(), label: {
                        Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    })
                }
                if isOwner && !group_id.isEmpty {
                    Button(action: {
                        showAlert = true
                    },
                           label: {
                            Image(systemName: "trash.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 24, height: 24)
                        
                    })
                }
                    
            })
                
        }
        .alert(isPresented:$showAlert) {
            Alert(
                title: Text("Are you sure to delete the group?"),
                
                primaryButton: .destructive(Text("Delete")) {
                    
                        AF.request("\(urlAPI.rawValue)/data/groups/delete/\(group_id)", requestModifier: { $0.timeoutInterval = 5 })
                            .responseDecodable(of: ResultUIDtoName.self) { response in
                                switch response.result {
                                case .success(let value):
                                    print("success", value)
                                    presentationMode.wrappedValue.dismiss()
                                case .failure(let error):
                                    print(error)
                                }
                            }
                    
                },
                secondaryButton: .default(Text("Cancel")){
                    
                }
            )
        }
      
        .padding(.horizontal,26)
        .padding(.bottom,20)
        .accentColor(.gray)
        .background(
            Color.white.ignoresSafeArea(edges:.top)
                .shadow(radius: shadow)
        )
    }
}

struct NavbarViewPreviews: PreviewProvider {
    static var previews: some View {
        VStack{
            NavbarView()
            Spacer()
        }
    }
}
