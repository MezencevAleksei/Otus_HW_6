//
//  Feed3ViewController.swift
//  Otus_HW_2
//
//  Created by alex on 14/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

class Feed3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PopToRootNC(_ sender: Any) {
       navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
