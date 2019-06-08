//
//  CustomButton.swift
//  Otus_HW_1
//
//  Created by alex on 05/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    @IBInspectable var cRadius: CGFloat = 10 {
        didSet{
            self.layer.cornerRadius = cRadius
        }
    }

    @IBInspectable var tColor: UIColor = UIColor.gray {
        didSet{
            self.titleLabel?.textColor = tColor
        }
    }
    
}
