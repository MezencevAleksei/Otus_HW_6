//
//  BenchmarkViewController.swift
//  Otus_HW_2
//
//  Created by alex on 09/06/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {
 
    private let countOfItemInCollectionView: Int = 80
    private var TimerModels = [IndexPath:TimerCellModel]()
    private let currentLayout: Int = 0
    private var layouts = [StagLayout]()
    private let layoutProvider = Services.layoutProvider
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomeTimerView.nib, forCellWithReuseIdentifier: CustomeTimerView.reuseID)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeLayout))
    
        addBehaviors(behaviors: [AddTimer()])
    }
    
    @objc func changeLayout() {
        collectionView.setCollectionViewLayout(layoutProvider.getLayout(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let timerCell = collectionView.cellForItem(at: indexPath)
        (timerCell as! CustomeTimerView).didSelected()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        for timerModel in TimerModels {
            if let cell = collectionView.cellForItem(at: timerModel.key){
                (cell as! CustomeTimerView).removeTimer()
            }
        }
    }
    
}

extension BenchmarkViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countOfItemInCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let timerCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomeTimerView.reuseID, for: indexPath) as? CustomeTimerView else {
                fatalError("Bad cell")
            }
        if let timerModel = TimerModels[indexPath] {
            timerModel.cellDelegate = timerCell
            timerCell.model = timerModel
        }else{
            let newTimerModel   = TimerCellModel()
            newTimerModel.cellDelegate = timerCell
            TimerModels[indexPath] = newTimerModel
            timerCell.model     = newTimerModel
        }
        return timerCell
    }
    
    
}
