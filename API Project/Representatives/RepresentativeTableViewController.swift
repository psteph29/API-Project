//
//  RepresentativeTableViewController.swift
//  API Project
//
//  Created by Paige Stephenson on 4/24/23.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let representativeInfoController = RepresentativeInfoController()
    
    var representatives: [Representative] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func loadRepresentatives() {
        Task {
            let reps = try await
            representativeInfoController.fetchRepresentatives(zip: searchBar.text!)
            updateUI(with: reps)
        }
    }

    func updateUI(with representatives: [Representative]) {
        self.representatives = representatives
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as! RepresentativeTableViewCell
    
        let representative = representatives[indexPath.row]
        
        cell.update(with: representative)
        cell.showsReorderControl = true
        return cell
    }
    
}

extension RepresentativeTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadRepresentatives()
    }
    
}
