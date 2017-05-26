//
//  fruitTableViewController.swift
//  searchBarExample
//
//  Created by Manish Kumar on 05/12/16.
//  Copyright © 2016 appface. All rights reserved.
//

import UIKit

class fruitTableViewController: UITableViewController,UISearchResultsUpdating{
    var fruitCollection = ["apple","banana","lichi","orange","guava","pineapple","papaya"]
    var searchController:UISearchController!
    let controllerTable = UITableViewController()
    var filterFruit = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controllerTable.tableView.dataSource = self
        self.controllerTable.tableView.delegate = self
        self.searchController = UISearchController(searchResultsController: self.searchController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true

    }

    func updateSearchResults(for searchController: UISearchController) {
        self.filterFruit = self.fruitCollection.filter{ (fruit:String) -> Bool in
            if fruitCollection.contains(self.searchController.searchBar.text!.localizedLowercase){
                return true
            }
            else{
                return false
            }
        }
        controllerTable.tableView.reloadData()
        
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.tableView{
        return fruitCollection.count
        }
        else{
        return filterFruit.count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Fruit Name"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView{
        cell.textLabel?.text = fruitCollection[indexPath.row]
        }
        else{
            cell.textLabel?.text = filterFruit[indexPath.row]
        }
        return cell
        }

}


  
