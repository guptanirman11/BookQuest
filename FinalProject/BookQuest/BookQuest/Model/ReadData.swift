//
//  ReadData.swift
//  BookQuest
//
//  Created by Anshul Gupta on 02/03/23.
//

import Foundation
class ReadData: ObservableObject  {
    @Published var books = [Book]()
    @Published var launchCount: Int = 1
    
        
    init(){
        launchCount += 1
        
//        print(launchCount)
        loadData()
//        UserDefaults.standard.set(self.launchCount, forKey: "launchCount")
    }
    // Loading the data from json data file books_data
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "books_data", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
       
        let books = try? JSONDecoder().decode([Book].self, from: data!)

        if let books = books {
            self.books = books
            
            
           

        }

        
    }
     
}
