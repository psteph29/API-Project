//
//  Representative.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import Foundation

struct Representative: Codable {
    var name: String
    var party: String
    var link: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case party
        case link
    }
}

struct SearchResponse: Codable {
    let results: [Representative]
}
