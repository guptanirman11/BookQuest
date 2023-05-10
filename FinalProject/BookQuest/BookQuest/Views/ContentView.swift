//
//  ContentView.swift
//  BookQuest
//
//  Created by Anshul Gupta on 26/02/23.
//

import SwiftUI
import Network

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var launchCounter = ReadData()
    @ObservedObject var networkMonitor = NetworkMonitor()
    @State private var showNetworkAlert = false
    @State private var searchText = ""
    let school = ["Modern School","Don Bosco","DPS Vasant Kunj","Springdales","Sanskriti School"]
    var showAlert: Bool {
        if launchCounter.launchCount == 1

        {
            print("cheking launcher value")
            return true
        }else{
            return false
        }
        }

    var body: some View {
        
        NavigationView {

                List () {
                    ForEach(searchResults, id: \.self){item in
                        HStack {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(item)
                                    .bold()
                                    .font(.custom("avenir", size: 25))
                                    .lineLimit(2)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    
                            }
                            
                            Spacer()
//                            Navigation link to gradeView
                            NavigationLink( destination: gradeView(school: item)){
                            }
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(10)
                            
                            
                            Spacer()
                            
                        }
                    }
                    .frame(height: 150.0)
                    .background(Color.blue.opacity(0.3))
            
                }
                .navigationBarTitle("BookQuest").font(.custom("avenir", size: 18))
                .toolbarBackground(Color(red: 0.9, green: 0.22, blue: 0.27).opacity(0.8), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .searchable(text: $searchText).foregroundColor(Color.black)
            }
        .accentColor(Color.black)
        
        //MARK: popping up the ratings alert
        .alert(isPresented: .constant(self.showAlert)
        ) {
            Alert(title: Text("Rate the app"), primaryButton:.default(Text("Ok")) , secondaryButton: .default(Text("maybe later")))
        }
        
// MARK: Taking into account whether device is connected to internet or not.
        .onChange(of: networkMonitor.isConnected) { connection in
                    showNetworkAlert = connection == false
                }
//        Prsesnting an alert if the internet connection is off.
        .alert(
            "This device is not connected to the internet.\n Please turn on WiFi or Data Services.",
            isPresented: $showNetworkAlert
        ) {}
        // MARK: Filtering the values depending upon the user input to search bar
//        if nothing entered then show the defuault values.
    }
    var searchResults: [String] {
            if searchText.isEmpty {
                return school
            } else {
                return school.filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
