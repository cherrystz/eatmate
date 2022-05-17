//
//  SearchView.swift
//  eatmate
//
//  Created by Phumipat Apivansri on 02.05.22.
//

import SwiftUI
import Alamofire


struct SearchView: View {
    
    @State var textFieldSearch: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var groupSearch: [Group] = []
    
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ZStack(alignment:.center){
                        Circle()
                            .fill(.white)
                            .shadow(color: .black.opacity(0.1), radius: 4, y: 4)
                            .frame(width: 40, height: 40)
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 12, height: 24)
                            .foregroundColor(.gray)
                    }
                })
                TextField("What do you want to eat ?", text: $textFieldSearch, onEditingChanged: { change in
                    searchGroup()
                    print("testzzz")
                })
                
                .font(.kanit(size: 18))
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.leading,10)
                
                
            }
            
            if !searchResults.isEmpty {
                
                    ScrollView{
                        ForEach(searchResults, id: \.self) { groupModule in
                            NavigationLink(destination: GroupView(groupDetail: groupModule, groupImage: groupModule.groupImage), label: {
                                GroupDisplayModule(imageName: groupModule.groupImage, topic: groupModule.groupName, personCount: groupModule.groupMember.count ,limitCount: groupModule.groupLimit, dueDate: groupModule.groupTime, catagory: groupModule.groupType)
                            })
                        }
                    }
                
            }
            else
            {
                LottieView(name: "96916-searching", loopMode: .loop)
                    .frame(width: 200, height: 200)
                Text("Find Eatmate to eat with you!")
                    .font(.nunito(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top,-20)
                    .padding(.bottom,2)
                Text("Search for your favourite food or your favourite restaurant ")
                    .font(.nunito(size: 20, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            //Search sorting by groupname or restaurant name in groupname
        }.navigationBarHidden(true)
            .padding(.top,20)
            .padding(.horizontal,20)
        
            .onAppear(perform: searchGroup)
    }
    
    func searchGroup() {
        
        let parameters = [
            "name": textFieldSearch
        ]
        
        AF.request("\(urlAPI.rawValue)/data/groups/search/", method: .post,  parameters: parameters, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: ResultGroupHome.self) { response in
                switch response.result {
                case .success(let value):
                    groupSearch = value.data
                    print(value.data)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    var searchResults: [Group] {
        if textFieldSearch.isEmpty {
            return []
        } else {
            return groupSearch.filter { $0.groupName.contains(textFieldSearch) }
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
