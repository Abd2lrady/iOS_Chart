//
//  ChartView.swift
//  iOS_TryCharts
//
//  Created by Fintech on 08/12/2022.
//

import UIKit

class BarProgressView: UIView {

    @IBOutlet weak var contentView: UIView!
    private var forePath = UIBezierPath()
    private var backPath = UIBezierPath()
    private let backgroundLayer = CAShapeLayer()
    private let foregroundLayer = CAShapeLayer()

    var progressColor = UIColor.black
    var trackColor = UIColor.white
    
    var progress: CGFloat  {
        get {
            return 0
        } set {
            let value = newValue > 1 ? 1 : newValue
            foregroundLayer.strokeEnd = value
            backgroundLayer.strokeEnd = 1 - value - 0.09
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
        
        configForeLayer(rect)
        configBackLayer(rect)
        contentView.layer.addSublayer(backgroundLayer)
        contentView.layer.addSublayer(foregroundLayer)
        
    }
    
    private func configForeLayer(_ rect: CGRect) {
        let foregroundStartPoint = CGPoint(x: rect.midX, y: rect.maxY)
        let foregroundEndPoint = CGPoint(x: rect.midX, y: rect.minY)
        forePath.move(to: foregroundStartPoint)
        forePath.addLine(to: foregroundEndPoint)
    
        foregroundLayer.path = forePath.cgPath
        foregroundLayer.lineWidth = rect.width
        foregroundLayer.strokeColor = progressColor.cgColor
        foregroundLayer.lineCap = CAShapeLayerLineCap.round
    }
    
    private func configBackLayer(_ rect: CGRect) {
        let backgroundStartPoint = CGPoint(x: rect.midX, y: rect.minY)
        let backgroundEndPoint = CGPoint(x: rect.midX, y: rect.maxY)
        backPath.move(to: backgroundStartPoint)
        backPath.addLine(to: backgroundEndPoint)

        backgroundLayer.path = backPath.cgPath
        backgroundLayer.lineWidth = rect.width
        backgroundLayer.lineCap = CAShapeLayerLineCap.round
        backgroundLayer.strokeColor = trackColor.cgColor

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
