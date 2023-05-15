//
//  Dog.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import Foundation
import UIKit

struct Dog {
    var dogPicture: UIImage
    
    enum CodingKeys: String, CodingKey {
        case dogPicture = "message"
    }

}
