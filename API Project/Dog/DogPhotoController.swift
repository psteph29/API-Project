//
//  DogPhotoController.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import Foundation
import UIKit

class DogPhotoController {
    
    enum SearchItemError: Error, LocalizedError {
        case imageDataMissing
    }
    
    
    func fetchItems(matching query: [String: String]) async throws -> [Dog] {
        let baseURL = "https://dog.ceo/api/breeds/image/random"
        
        var urlComponents = URLComponents(string: baseURL)!
        
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let image = UIImage(data: data) else {
            throw SearchItemError.imageDataMissing
        }
        
   
        
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        
        return Dog.image
        
    }
}
    
    


