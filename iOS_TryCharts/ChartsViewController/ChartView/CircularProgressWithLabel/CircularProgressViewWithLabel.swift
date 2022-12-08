//
//  CircularProgressWithLabel.swift
//  iOS_TryCharts
//
//  Created by Fintech on 08/12/2022.
//

import UIKit

class CircularProgressViewWithLabel: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var progressView: CircularProgressView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var progresslabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibInit()
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        labelView.layer.cornerRadius = labelView.bounds.height / 2
        labelView.backgroundColor = UIColor.lightGray
    }
    
    func config(with progress: Double) {
        var color = UIColor.black
        
        if (0 ..< 0.35).contains(progress) {
            color = .red
        } else if (0.35 ..< 0.7).contains(progress) {
            color = .orange
        } else {
            color = .green
        }
        progresslabel.text = "\(lroundl(progress * 100))" + " %"
        progresslabel.textColor = color
        progressView.progress = CGFloat(progress)
        progressView.progressColor = color

    }
    
    private func xibInit() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: .main)
        guard let view = nib.instantiate(withOwner: self).first as? UIView
        else { return }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    
    
}
