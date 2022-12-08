//
//  StatisticsCollectionViewController.swift
//  iOS_TryCharts
//
//  Created by Fintech on 06/12/2022.
//

import UIKit

class StatisticsCollectionViewController: UIViewController {
    @IBOutlet weak var statisticsCollectionView: UICollectionView!
    
    let statistics = [StatisticsEntity(title: "القيمة المضافة", quantity: "٢٠٠٠"),
                      StatisticsEntity(title: "القيمة المضافة", quantity: "٣٠٠٠"),
                      StatisticsEntity(title: "القيمة المضافة", quantity: "٤٠٠٠"),
                      StatisticsEntity(title: "القيمة المضافة", quantity: "٥٠٠٠")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configStatisticsCollectionView()
        
    }

    func configStatisticsCollectionView() {
        statisticsCollectionView.dataSource = self
        let cellNib = UINib(nibName: "StatisticsCollectionViewCell", bundle: .main)
        statisticsCollectionView.register(cellNib,
                                          forCellWithReuseIdentifier: "StatisticsCell")
    }
   
}

extension StatisticsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        statistics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatisticsCell",
                                                      for: indexPath) as? StatisticsCollectionViewCell
        else { return UICollectionViewCell()}
        cell.config(with: statistics[indexPath.row])
        return cell
    }
    
    
}
