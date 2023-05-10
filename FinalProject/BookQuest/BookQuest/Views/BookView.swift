//
//  BookView.swift
//  BookQuest
//
//  Created by Anshul Gupta on 26/02/23.
//

import SwiftUI

struct BookView: View {
    //    environment variable declared to manage th UIColors depending upon dark and loght mode.
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    var book: [Book]
    var bookCount: Int
    let items = (1...6).map { "Item \($0)" }
    let url  = URL(string: "https://ncert.nic.in/textbook/pdf/eemh1dd.zip")
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                        ForEach(searchResults) { item in
                            
                            VStack(spacing: 10) {
                                Spacer()
                                
                                HStack(spacing: 1) {
//                                    Asunchronously downloading the images fro each from url
                                    AsyncImage(url: URL(string: item.image ?? "https://ncert.nic.in/textbook/pdf/deap1cc.jpg" )) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100.0, height: 100.0)
                                    } placeholder: {
                                        Image(systemName: "book.fill")
                                            .resizable()
                                            .foregroundColor(.gray)

                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100.0, height: 100.0)
                                            
                                    }
//                                    A button action method to redirect the user to download the book
                                    Button(action: {
                                        UIApplication.shared.open(URL(string: item.downloadLink ?? "https://ncert.nic.in/textbook/pdf/eemh1dd.zip" )!, options: [:], completionHandler: nil)
                                            }) {
                                                Text("Download Here")
                                                    .bold()
                                                    .font(.custom("avenir", size: 16))
                                                    .foregroundColor(Color.blue.opacity(0.7))
                                            }

                                }

                                Text(item.title ?? "nil")
                                    .bold()
                                    .font(.custom("avenir", size: 18))
                                    .foregroundColor(colorScheme == .dark ? .white : .black)

                                Spacer(minLength: 10)
                            }
                            .background(Color(red: 48/255, green: 191/255, blue: 191/255).opacity(0.3))

                        }
                    
                    }
            //Adding the search bar functionality to BookView as well.
                    .searchable(text: $searchText).foregroundColor(Color.black)
                }
        //Setting the navigation tile bar attributes.
        .navigationBarTitle("Booklist")
        .toolbarBackground(Color(red: 0.9, green: 0.22, blue: 0.27).opacity(0.8), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .searchable(text: $searchText).foregroundColor(Color.black)
            
    }
    // MARK: Filtering the values depending upon the user input to search bar
    //        if nothing entered then show the defuault values.
        
    var searchResults: [Book] {
            if searchText.isEmpty {
                return book
            } else {
                return book.filter { $0.title!.localizedCaseInsensitiveContains(searchText) }
            }
        }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let testdata = [Book(title: "Mathematics", image: "https://ncert.nic.in/textbook/pdf/deap1cc.jpg", downloadLink: "https://ncert.nic.in/textbook/pdf/eemh1dd.zip", grade: "5", school: "Modern School"),Book(title: "Mathe", image: "https://ncert.nic.in/textbook/pdf/deap1cc.jpg", downloadLink: "https://ncert.nic.in/textbook/pdf/eemh1dd.zip", grade: "5", school: "Modern School"),Book(title: "Math", image: "https://ncert.nic.in/textbook/pdf/deap1cc.jpg", downloadLink: "https://ncert.nic.in/textbook/pdf/eemh1dd.zip", grade: "5", school: "Modern School"),Book(title: "Mathematic", image: "https://ncert.nic.in/textbook/pdf/deap1cc.jpg", downloadLink: "https://ncert.nic.in/textbook/pdf/eemh1dd.zip", grade: "5", school: "Modern School")]
        BookView(book:testdata, bookCount: 4)
    }
}
