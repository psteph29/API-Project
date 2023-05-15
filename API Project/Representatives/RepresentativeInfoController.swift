//
//  RepresentativeInfoController.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import Foundation
import UIKit

class RepresentativeInfoController {
    
    enum fetchRepresentativesError: Error, LocalizedError {
        case representativeNotFound
    }
    
    let baseURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php")!
    
    func fetchRepresentatives(zip: String) async throws -> [Representative] {
        var urlComps = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        let zipQueryItem = URLQueryItem(name: "zip", value: zip)
        let jsonQueryItem = URLQueryItem(name: "output", value: "json")
        urlComps.queryItems = [zipQueryItem, jsonQueryItem]
        
        let (data, response) = try await URLSession.shared.data(from: urlComps.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw fetchRepresentativesError.representativeNotFound
        }
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        return searchResponse.results
    }
    
}
