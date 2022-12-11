//
//  CircularChartView.swift
//  iOS_TryCharts
//
//  Created by Fintech on 08/12/2022.
//

import UIKit

class CircularProgressView: UIView {

    @IBOutlet weak var contentView: UIView!
    private var forePath = UIBezierPath()
    private var backPath = UIBezierPath()
    private let backgroundLayer = CAShapeLayer()
    private let foregroundLayer = CAShapeLayer()

    var progressColor = UIColor.black
    var trackColor = UIColor.lightGray

    var progress: CGFloat  {
        get {
            return 0
        } set {
            let value = newValue > 1 ? 1 : newValue
            foregroundLayer.strokeEnd = value
            backgroundLayer.strokeEnd = 1 - value
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibInit()
    }

    override func draw(_ rect: CGRect) {
        
        let centerPoint = CGPoint(x: rect.width / 2,
                                  y: rect.height / 2)
        
        
        
        configBackLayer(at: centerPoint, radius: rect.width / 2)
        configForeLayer(at: centerPoint, radius: rect.width / 2)

        contentView.layer.addSublayer(backgroundLayer)
        contentView.layer.addSublayer(foregroundLayer)
        
    }
    
    private func configBackLayer(at centerPoint: CGPoint, radius: CGFloat) {
        backPath = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: .pi,
                                clockwise: true)
        
        backPath.addArc(withCenter: centerPoint,
                        radius: radius,
                        startAngle: .pi,
                        endAngle: .pi * 2,
                        clockwise: true)


        backgroundLayer.path = backPath.cgPath
        backgroundLayer.lineWidth = 10
        backgroundLayer.lineCap = CAShapeLayerLineCap.round
        backgroundLayer.strokeColor = trackColor.cgColor
        backgroundLayer.fillColor = nil
    }
    
    private func configForeLayer(at centerPoint: CGPoint,
                           radius: CGFloat) {
        forePath = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: .pi,
                                clockwise: false)
        
        forePath.addArc(withCenter: centerPoint,
                        radius: radius,
                        startAngle: .pi,
                        endAngle: .pi * 2,
                        clockwise: false)
        
        foregroundLayer.path = forePath.cgPath
        foregroundLayer.lineWidth = 10
        foregroundLayer.strokeColor = progressColor.cgColor
        foregroundLayer.fillColor = nil
        foregroundLayer.lineCap = CAShapeLayerLineCap.round

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
