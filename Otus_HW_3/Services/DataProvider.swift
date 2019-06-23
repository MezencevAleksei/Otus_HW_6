//
//  File.swift
//  Otus_HW_3
//
//  Created by alex on 15/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation

import UIKit

final class DataProvider {
    private var arrayOfItem:[String] = [String]()
    private let itemCount = 20
    
    init(){
        for i in 1...itemCount {
            arrayOfItem.append("Item \(i)")
        }
    }
    
    func count()-> Int {
        return arrayOfItem.count
    }
    
    func itemFor(index: Int )-> String?{
        if index <= arrayOfItem.count {
            return arrayOfItem[index]
        }
        return nil
    }
    
}
