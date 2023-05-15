//
//  DogViewController.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import UIKit

class DogViewController: UIViewController {
    
    let dogPhotoController = DogPhotoController()
    
    @IBOutlet weak var dogPhotoHolder: UIImageView!
    @IBOutlet weak var loadNewImageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogPhotoHolder.image = UIImage(systemName: "photo.on.rectangle")
        
        Task {
            let dog = try await dogPhotoController.fetchDog()
            updateUI(with: dog)
        }
    }
        
      
    @IBAction func loadNewImageButton(_ sender: UIButton) {
        Task {
            
            let dog = try await dogPhotoController.fetchDog()
            updateUI(with: dog)
            
        }
    }
        
        func updateUI(with dog: Dog) {
            Task {
                let url = URL(string: dog.dogPicture)
                let image = try await dogPhotoController.fetchDogPicture(from: url!)
                dogPhotoHolder.image = image
            }
        }
    }

    
    

