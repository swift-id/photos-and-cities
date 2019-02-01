//
//  PhotoTableViewController.swift
//  Photos
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    var collections: [PhotoCollection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return collections.count
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return collections[section].photos.count
    }
    
    // MARK: - Table view behaviours

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell",
                                                 for: indexPath)
        
        cell.textLabel?.text = collections[indexPath.section].photos[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        return collections[section].name
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPhotoAndMap" {
            if let destination = segue.destination as? PhotoAndMapViewController,
                let section = tableView.indexPathForSelectedRow?.section,
                let row = tableView.indexPathForSelectedRow?.row {

                destination.selectedPhoto = collections[section].photos[row]
            }
        }
    }
    
    // MARK: - Helpers
    
    func loadData()
    {
        collections.append(PhotoCollection(
                            name: "City",
                            photos: [
                                Photo(name: "Barcelona", fileName: "Barcelona.jpg"),
                                Photo(name: "Florence", fileName: "Florence"),
        ]))
        
        collections.append(PhotoCollection(
                            name: "Animal",
                            photos: [
                                Photo(name: "Bear", fileName: "Bear.jpg"),
                                Photo(name: "Bull", fileName: "Bull.jpg"),
        ]))
    }
}
