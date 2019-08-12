//
//  Extension.swift
//  Otus_HW_4
//
//  Created by alex on 15/07/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func removingDuplicates() -> Array {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}
