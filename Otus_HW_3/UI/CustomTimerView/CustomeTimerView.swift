//
//  CustomeTimerView.swift
//  Otus_HW_3
//
//  Created by alex on 17/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

//class CustomeTimerView: UICollectionViewCell {
//    static let reuseID = String(describing: CustomeTimerView.self)
//    static let nib = UINib(nibName: String(describing: CustomeTimerView.self), bundle: nil)
//    
//    
//    @IBOutlet var timerLabel: UILabel!
//    @IBOutlet var activityIndicator: UIActivityIndicatorView!
//    private var timer: Timer?
//    private var timeCounter: Double = 0.0 {
//        didSet{
//             updateTimerLabel()
//        }
//    }
//    private var active = false{
//        didSet{
//            if active {
//                backgroundColor = UIColor.orange
//            }else{
//                backgroundColor = UIColor.gray
//            }
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        updateTimerLabel()
//        backgroundColor = UIColor.gray
//    }
//
//    private func updateTimerLabel(){
//        timerLabel.text = String(format:"%.1f", self.timeCounter)
//    }
//    
//    private func startTimer(){
//        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {_ in self.timeCounter = self.timeCounter + 0.1})
//        activityIndicator.startAnimating()
//        active = true
//    }
//    
//    private func stopTimer(){
//        self.timer?.invalidate()
//        activityIndicator.stopAnimating()
//        active = false
//    }
//    
//    func didSelected(){
//        if active {
//            stopTimer()
//        }else{
//            startTimer()
//        }
//    }
//    
//    func removeTimer(){
//        stopTimer()
//        self.timeCounter = 0.0
//    }
//    
//}


class CustomeTimerView: UICollectionViewCell {
    static let reuseID = String(describing: CustomeTimerView.self)
    static let nib = UINib(nibName: String(describing: CustomeTimerView.self), bundle: nil)
    
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var model: TimerCellModel?{
        didSet{
            updateUI()
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.gray
    }
    
    private func updateUI(){
        if self.model != nil {
            timerLabel.text = model?.getTimerLabelText()
            if model!.getActive() {
                activityIndicator.startAnimating()
                backgroundColor = UIColor.green
            }else{
                activityIndicator.stopAnimating()
                 backgroundColor = UIColor.gray
            }
        }
    }
    
    func didSelected(){
        if model == nil {return}
        model!.startStopTimer()
        updateUI()
    }
    
    func removeTimer(){
        if model == nil {return}
        model!.removeTimer()
        updateUI()
    }
    
}

protocol UpdateViewCellDelegat {
    func update()
}

extension CustomeTimerView: UpdateViewCellDelegat {
    func update() {
        updateUI()
    }
}
