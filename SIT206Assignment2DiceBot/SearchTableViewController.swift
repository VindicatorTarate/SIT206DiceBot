//
//  SearchTableViewController.swift
//  SIT206Assignment2DiceBot
//
//  Created by Tarate Tian on 24/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit



class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var results = ["ACID SPLASH", "AID", "ANTILIFE SHELL", "AURA OF LIFE", "BARKSKIN", "EXPEDITIOUS RETREAT", "FALSE LIFE", "MASS HEALING WORD"]
    var myIndex = 0
    
    var filteredResults = [String]()
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        self.filteredResults = self.results.filter{ (result:String) -> Bool in
            if result.lowercased().contains(self.searchController.searchBar.text!.lowercased())
            {
                return true
            }
            else
            {
                return false
            }
        }
        
        self.resultsController.tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tableView
        {
            return self.results.count
    
        }
        else
        {
            return self.filteredResults.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        if tableView == self.tableView
        {
            cell.textLabel?.text = self.results[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = self.filteredResults[indexPath.row]
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination as! ResultViewController
        dest.results = results
        dest.myIndex = myIndex
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
