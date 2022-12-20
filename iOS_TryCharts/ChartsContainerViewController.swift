//
//  ViewController.swift
//  iOS_TryCharts
//
//  Created by Fintech on 06/12/2022.
//

import UIKit
import Charts

class ChartsContainerViewController: UIViewController {
    
    @IBOutlet weak var multipleCharts: MultipleCircularProgressView!
    @IBOutlet weak var statisticsCollectionView: UIView!

    @IBOutlet weak var chartView: UIView!{
        didSet {
            chartView.layer.cornerRadius = 7
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let statisticsViewController = StatisticsCollectionViewController()
        let chartsViewController = ChartsViewController()
        
        self.addChildController(statisticsViewController, to: statisticsCollectionView)
        self.addChildController(chartsViewController, to: chartView)
        configCharts()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo_ic"))
    }
    
    func configCharts() {
        
        let progresses: [(Double, UIColor)] = [(0.1, .black),
                                               (0.2, .gray),
                                               (0.4, .red),
                                               (0.6, .cyan),
                                               (0.7, .yellow),
                                               (0.3, .purple),
                                               (0.9, .green),
                                               (1, .blue)]
        
        let circularCharts = progresses.map { progress in
            let circularChart = CircularProgressView()
            circularChart.progress = progress.0
            circularChart.progressColor = progress.1
            return circularChart
        }
        
        multipleCharts.setViews(circularCharts)
    }
    
}

