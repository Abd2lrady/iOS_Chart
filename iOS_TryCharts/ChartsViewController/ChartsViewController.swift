//
//  ChartsViewController.swift
//  iOS_TryCharts
//
//  Created by Fintech on 06/12/2022.
//

import UIKit

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var circularChats: CircularProgressViewWithLabel!
    
    let branchs = [chartData(title: "العقيق", progress: 0.1),
                   chartData(title: "الرياض", progress: 0.2),
                   chartData(title: "الدمام", progress: 0.3),
                   chartData(title: "المدينة", progress: 0.4),
                   chartData(title: "الطائف", progress: 0.5),
                   chartData(title: "العقيق", progress: 0.6),
                   chartData(title: "الرياض", progress: 0.7),
                   chartData(title: "الدمام", progress: 0.8),
                   chartData(title: "المدينة", progress: 0.9),
                   chartData(title: "الطائف", progress: 1)]
    
    @IBOutlet weak var chartCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularChats.config(with: 0.5)
        configChartsCollectionView()
    }

    @IBAction func selectionButtonAction(_ sender: Any) {
        print("button tapped")
    }
    
}

extension ChartsViewController: UICollectionViewDataSource {
    func configChartsCollectionView() {
        chartCollectionView.dataSource = self
        let cellNib = UINib(nibName: "\(ChartCollectionViewCell.self)",
                            bundle: .main)
        chartCollectionView.register(cellNib, forCellWithReuseIdentifier: "ChartCell")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return branchs.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChartCell",
                                                         for: indexPath)
        if let cell = (cell as? ChartCollectionViewCell) {
            cell.progressView.progress = branchs[indexPath.row].progress
            cell.branchLabel.text = branchs[indexPath.row].title
        }
        return cell
    }
}

struct chartData {
    let title: String
    let progress: CGFloat
}
