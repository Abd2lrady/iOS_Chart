//
//  ChartCellCollectionViewCell.swift
//  iOS_TryCharts
//
//  Created by Fintech on 07/12/2022.
//

import UIKit

class ChartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var branchLabel: UILabel!
    
    @IBOutlet weak var progressView: BarProgressView!
//    var progressBar: UIProgressView = {
//        let view = UIProgressView()
//        view.progressTintColor = .blue
//        view.trackTintColor = .black
//        view.progress = 0.8
//        
//        return view
//    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        contentView.addSubview(progressView)
//        progressView.addSubview(progressBar)
//        progressBar.translatesAutoresizingMaskIntoConstraints = false
//        
//        let frame = CGRect(x: progressView.bounds.minX,
//                           y: progressView.bounds.maxX,
//                           width: progressView.bounds.width,
//                           height: progressView.bounds.height)
//        progressBar.frame = frame
//        
//        progressBar.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
