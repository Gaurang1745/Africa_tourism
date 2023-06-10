//
//  VideoModel.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import Foundation

struct Video : Codable, Identifiable{
    let id: String
    let name: String
    let headline : String
    
    var thumbnail: String{
        "video-\(id)"
    }
}
