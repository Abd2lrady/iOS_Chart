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
        var charts = [CircularProgressView]()
        let progresses = [0.1, 0.2, 0.7, 0.8, 1]
        let colors: [UIColor] = [.black, .red, .green, .yellow, .blue ]
        
        for i in 0 ..< progresses.count {
            let chart = CircularProgressView()
            chart.progress = progresses[i]
            chart.progressColor = colors[i]
            charts.append(chart)
        }
        multipleCharts.setViews(charts)
    }
    
}

