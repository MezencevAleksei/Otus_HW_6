//
//  FeedTableViewCell.swift
//  Otus_HW_3
//
//  Created by alex on 15/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    static let reuseID = String(describing: FeedTableViewCell.self)
    static let nib = UINib(nibName: String(describing: FeedTableViewCell.self), bundle: nil)
    
    @IBOutlet var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func update(labelText: String) {
        itemLabel.text = labelText
    }
}
