//
//  GroupDisplayModule.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 19/3/2565 BE.
//

import SwiftUI

struct GroupDisplayModule: View {
    
    @State var imageName: String = "https://firebasestorage.googleapis.com/v0/b/eatmateapp.appspot.com/o/imageGroup%2Fjay-wennington-N_Y88TWmGwA-unsplash.jpg?alt=media"
    @State var topic: String = "ไปกินชาบูชูบากัน"
    @State var personCount: Int = 2
    @State var limitCount: Int = 2
    @State var dueDate: String = "22/03/2022-00:00"
    @State var catagory: String = "Shabu"
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageName)) { image in
                image.resizable()
//                image.aspectRatio(contentMode: .fill)
//                image.clipped()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 335, height: 156, alignment: .center)
            .cornerRadius(15, corners: [.topLeft, .topRight])
            
            VStack(spacing: 5) {
                HStack{
                    Text(catagory)
                        .font(.kanit(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(topic)
                        .font(.kanit(weight: .bold))
                    Spacer()
                    HStack(spacing: 4) {
                        Text("\(personCount)/\(limitCount)")
                            .font(.kanit(size: 12, weight: .bold))
                        Image(systemName: "person.fill")
                            .font(.system(size: 12))
                    }
                }.padding(.top,-10)
               
                HStack(alignment:.top) {
                    HStack(spacing: 6) {
                        Image("CalendarIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(dueDate).font(.kanit(size: 16, weight: .regular))
                    }
                    Spacer()
//                    Button(action: {}, label: {
//                        Text("เข้าร่วม")
//                            .foregroundColor(.white)
//                            .font(.kanit(size: 12, weight: .regular))
//                            .padding(.init(top: 8, leading: 25, bottom: 8, trailing: 25))
//                            .background(Color(hexString: "#57D96C"))
//                            .cornerRadius(10)
//                    })
                }.padding(.bottom,25)
//                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: 335, height: 245)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, y: 4)
        .padding(.bottom, 20)
        .onAppear {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy-HH:mm"
            let date = dateFormatter.date(from: dueDate)
            dateFormatter.dateFormat = "dd MMMM yyyy"
            dueDate = dateFormatter.string(from: date ?? Date())
        }
    }
}

struct GroupDisplayModule_Previews: PreviewProvider {
    static var previews: some View {
        GroupDisplayModule()
//            .previewLayout(.fixed(width: 335, height: 156))
    }
}
