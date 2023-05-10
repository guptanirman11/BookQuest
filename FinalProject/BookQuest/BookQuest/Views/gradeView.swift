//
//  gradeView.swift
//  BookQuest
//
//  Created by Anshul Gupta on 26/02/23.
//

import SwiftUI

struct gradeView: View {
//    environment variable declared to manage th UIColors depending upon dark and loght mode.
    @Environment(\.colorScheme) var colorScheme
    @State private var showAlert1 = true
    @ObservedObject var datas = ReadData()
    var school: String
    let grades = ["4","5","6","7","8"]
    

    var body: some View {

         
        List () {
                    ForEach(grades, id: \.self){item in
                        HStack {
                            
                            Spacer()
                            VStack(alignment: .leading) {
                                Text( "Grade \(item)")
                                    .bold()
                                    .font(.custom("avenir", size: 24))
                                    .lineLimit(2)

                            }
                            
                            Spacer()
                            let currentSchoolBooks: [Book] = datas.books.filter { Book in
                             
                                let isSchool = Book.school == school
                                let isGrade = Book.grade == item
                                return isSchool && isGrade
                            }
                            
//                      Navigation link to BookView and passing the filtered data set depending upon the school and grade
                            NavigationLink( destination: BookView(book: currentSchoolBooks, bookCount: currentSchoolBooks.count)){
                            }
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(10)
                            
                        }
                    }
                    .frame(height: 75.0)
                    .background(Color.blue.opacity(0.3))
            
            //        Presenting an alert if the internet connection is off.

                }
        
//Setting the navigation tile bar attributes.
                .navigationBarTitle("Grades")
                .toolbarBackground(Color(red: 0.9, green: 0.22, blue: 0.27).opacity(0.8), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
               

    }
}

struct gradeView_Previews: PreviewProvider {
    static var previews: some View {
        gradeView(datas: ReadData(),school: "Modern School")
    }
}


