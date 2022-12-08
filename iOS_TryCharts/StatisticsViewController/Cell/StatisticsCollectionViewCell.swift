//
//  CollectionViewCell.swift
//  iOS_TryCharts
//
//  Created by Fintech on 06/12/2022.
//

import UIKit

class StatisticsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 10
        }
    }
        @IBOutlet weak var img: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var quantityLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(with viewModel: StatisticsEntity) {
//        self.img.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
        self.quantityLabel.text = viewModel.quantity
//        self .backView.backgroundColor = UIColor(named: viewModel.backgroundColor)
    }
    
}
