//
//  ContentView.swift
//  bookmarkApp
//
//  Created by Admin on 19.04.2023.
//

import SwiftUI

struct LinkWithTitle{
    var title: String
    var url: String
}

struct ContentView: View {
    @State var showSheet = false
    @Binding  var title: String
    @Binding  var url: String
    @State var links: [LinkWithTitle] = []
    var body: some View {
        VStack {
            main
        }
    }
    var main: some View {
        VStack{
            if links.isEmpty{
                Text("Bookmark App")
                    .font(.system(size: 17, weight: .semibold))
            } else {
                Text("List")
                    .font(.system(size: 17, weight: .semibold))
            }
            Spacer()
            ZStack {
                List(links, id: \.url){ link in
                    HStack{
                        Link(link.title, destination: URL(string: link.url)!).foregroundColor(.black)
                        Spacer()
                        Image("Group")
                    }
                }
                .scrollContentBackground(.hidden)
                if links.isEmpty {
                    Text("Save your first \nbookmark")
                        .frame(width: 358, height: 92)
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.center)
                }
                
            }
            Spacer()
            VStack(spacing: 37) {
                Button(action: {
                    showSheet.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.black)
                            .frame(height: 60)
                        Text("Add bookmark")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    
                }
            }.sheet(isPresented: $showSheet) {
                AddBookmarkView(showSheet: $showSheet, onSave: { name, link in
                    links.append(LinkWithTitle(title: name, url: link))
                    showSheet.toggle()
                })
                .presentationDetents([.height(380),.medium, .large])
            }
        }
    }
}





    struct AddBookmarkView: View {
        @State private var title = ""
        @State private var url = ""
        @Binding var showSheet: Bool
        var onSave: ((String,String)-> Void)
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Button(action:{
                    showSheet = false
                }) {
                    Image("Vector")
                }.padding(.leading,350)
                VStack{
                    Text("Title")
                        .padding(.trailing,300)
                    TextField("Bookmark title", text: $title)
                        .foregroundColor(.orange)
                        .padding(.all,14)
                        .background(Color(red: 0.949, green: 0.949, blue: 0.933))
                        .cornerRadius(12)
                }
                VStack{
                    Text("Link")
                        .padding(.trailing,300)
                    TextField("Bookmark link (URL)", text: $url)
                        .foregroundColor(.orange)
                        .padding(.all,14)
                        .background(Color(red: 0.949, green: 0.949, blue: 0.933))
                        .cornerRadius(12)

                }

                Button(action: {
                    onSave(title,url)
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.black)
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.custom("Welcome", size: 16))
                    }
                }
                .frame(width: 350,height: 57)
            }
            .padding()
        }
    }

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
