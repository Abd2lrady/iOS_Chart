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
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo_ic"))
        configViews()
    }
    
    override func viewWillLayoutSubviews() {
    }

    func configViews() {
        let chart = CircularProgressView()
        let charts = Array.init(repeating: chart, count: 5)
        multipleCharts.setViews(charts)
    }
}

