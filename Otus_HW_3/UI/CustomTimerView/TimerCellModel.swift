//
//  TimerCellModel.swift
//  Otus_HW_3
//
//  Created by alex on 19/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import Foundation

class TimerCellModel{
    
    private var timerLabelText:String
    private var timer: Timer?
    private var timeCounter: Double = 0.0 {
        didSet{
            updateTimerLabel()
            cellDelegate?.update()
        }
    }
    private var active = false
    
    var cellDelegate: UpdateViewCellDelegat?
    
    init(){
        timerLabelText = "0.0"
    }
    
    private func updateTimerLabel(){
        timerLabelText = String(format:"%.1f", timeCounter)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {_ in self.timeCounter = self.timeCounter + 0.1})
        active = true
    }
    
    private func stopTimer(){
        timer?.invalidate()
        active = false
    }
    
    
    func getTimerLabelText()->String{
        return timerLabelText
    }
    
    func getActive()->Bool{
        return active
    }
    
    func startStopTimer(){
        if active {
            stopTimer()
        }else{
            startTimer()
        }
    }
    
    func removeTimer(){
        stopTimer()
        self.timeCounter = 0.0
    }
    
    
    
}


