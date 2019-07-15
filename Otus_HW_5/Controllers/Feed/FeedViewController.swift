//
//  FeedViewController.swift
//  Otus_HW_3
//
//  Created by alex on 15/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    //@IBOutlet var searchController: UISearchController!
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var tableView: UITableView!
    private var feedDataProvider = Services.feedDataProvider
    var filteredFeedData = [FeedData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search algorithm"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.nib, forCellReuseIdentifier: FeedTableViewCell.reuseID)
    }

}



//MARK: Extension
//UISearchController
extension FeedViewController: UISearchResultsUpdating  {
   
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
            filterContentForSearchText(text)
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        if searchText.count > 0 {
            filteredFeedData = feedDataProvider.findFeedDataByFeedName(searchText)
        }
        tableView.reloadData()
    }
    
    //search in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredFeedData.count
        }
        return feedDataProvider.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseID, for: indexPath) as? FeedTableViewCell else {
            fatalError("Bad cell")
        }
        
        if isFiltering() {
            if indexPath.row <= filteredFeedData.count - 1 {
                let itemText = filteredFeedData[indexPath.row]
                cell.update(labelText: itemText.name)
            }
        } else {
            if let itemText = feedDataProvider.itemFor(index: indexPath.row){
                cell.update(labelText: itemText.name)
            }
        }
        return cell
        
    }

}


//UITableView
extension FeedViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1 + feedDataProvider.count()
//    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseID, for: indexPath) as? FeedTableViewCell else {
//            fatalError("Bad cell")
//        }
//
//        if let itemText = feedDataProvider.itemFor(index: indexPath.row){
//            cell.update(labelText: itemText.name)
//        }
//
//        return cell
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController?
        
        if let currentCell = tableView.cellForRow(at: indexPath) as? FeedTableViewCell, let name = currentCell.itemLabel.text {
            switch name {
                case "SuffixArray":
                    let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                    vc = storyboard.instantiateViewController(withIdentifier: "SuffixArrayViewController")
                default:
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    vc = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewController")
            }
        }
        
        
        if let pushViewController = vc {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        
    }
    
}
