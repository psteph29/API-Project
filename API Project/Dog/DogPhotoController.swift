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
    
    func fetchDog() async throws -> Dog {
        let baseURL = "https://dog.ceo/api/breeds/image/random"
        let (data, response) = try await URLSession.shared.data(from: URL(string: baseURL)!)
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw SearchItemError.imageDataMissing
        }
        let decoder = JSONDecoder()
        let dog = try decoder.decode(Dog.self, from: data)
        return dog
    }


    func fetchDogPicture(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw SearchItemError.imageDataMissing
        }
        guard let image = UIImage(data: data) else {
            throw SearchItemError.imageDataMissing
        }
        return image
    }
}

   

    
// The fetchDog(matching:) function retrieves data from the Dog API and decodes it into a Dog object using the JSONDecoder class provided by the Swift standard library. This function fetches a URL that returns a JSON object that contains a random dog picture URL, which is then decoded into the Dog object. The fetchDog(matching:) function does not download the actual image, it only retrieves the URL of the image.
//On the other hand, the fetchDogPicture(from:) function takes the URL of a dog picture and downloads the image data using the URLSession.shared.data(from:) method. It then creates a UIImage object from the downloaded data and returns it. This function is called by the updateUI(with:) method in DogViewController to set the image in the UIImageView with the downloaded dog picture.
//So, fetchDog(matching:) function fetches the URL of the dog picture, and fetchDogPicture(from:) function downloads and returns the actual image data for that URL.
    






