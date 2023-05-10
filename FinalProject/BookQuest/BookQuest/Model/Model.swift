//
//  Model.swift
//  BookQuest
//
//  Created by Anshul Gupta on 26/02/23.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: String{
        return (title ?? "niltitle") + (image ?? "nilurl")
    }
    
    

    let title: String?
    // We can use GitHub to conformt to `Identifiable`

    let image: String?
    let downloadLink: String?
    let grade: String?
    let school: String?
}




