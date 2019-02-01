//
//  PhotoTableViewController.swift
//  Photos
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    var photos: [PhotoCollection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return photos.count
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return photos[section].photos.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell",
                                                 for: indexPath)
        
        cell.textLabel?.text = photos[indexPath.section].photos[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        return photos[section].name
    }
    
    // MARK: - Helpers
    
    func loadData()
    {
        photos.append(PhotoCollection(
                        name: "City",
                        photos: [
                            Photo(name: "Barcelona", fileName: "Barcelona.jpg"),
                            Photo(name: "Florence", fileName: "Florence"),
        ]))
        
        photos.append(PhotoCollection(
            name: "Animal",
            photos: [
                Photo(name: "Bear", fileName: "Bear.jpg"),
                Photo(name: "Bull", fileName: "Bull.jpg"),
                ]))
    }
}
