//
//  FeedViewController.swift
//  Otus_HW_3
//
//  Created by alex on 15/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    private var dataProvider = Services.dataProvider
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(FeedTableViewCell.nib, forCellWithReuseIdentifier: FeedTableViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.nib, forCellReuseIdentifier: FeedTableViewCell.reuseID)
    }

}



//MARK: Extenion
extension FeedViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseID, for: indexPath) as? FeedTableViewCell else {
            fatalError("Bad cell")
        }
        

        if let itemText = dataProvider.itemFor(index: indexPath.row){
            cell.update(labelText: itemText)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let SessionSummaryViewController = storyboard.instantiateViewController(withIdentifier: "SessionSummaryViewControllerID")
        self.navigationController?.pushViewController(SessionSummaryViewController, animated: true)
    }
    
}
