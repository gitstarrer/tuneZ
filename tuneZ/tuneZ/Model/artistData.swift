//
//  artistData.swift
//  myTunes
//
//  Created by Himanshu Gupta on 22/04/21.
//

import Foundation

struct artistData : Codable{ //for it to be decoded from the JSON format.
    let results : [Results]
}

struct Results : Codable{
    let trackName: String
    let collectionName : String
}
