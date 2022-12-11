//
//  MultipleCircularProgressView.swift
//  iOS_TryCharts
//
//  Created by Fintech on 08/12/2022.
//

import UIKit

class MultipleCircularProgressView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibInit()
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
    
    
    func setViews(_ views: [CircularProgressView]) {
        
        
        views.forEach { view in
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                         view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                         view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                         view.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
            
        }
        
        for current in 1 ..< views.count {
            let lastView = views[current - 1]
            let currentView = views[current]
            let scaling = lastView.transform

            currentView.transform = CGAffineTransform(scaleX:scaling.a * 0.75,
                                                      y: scaling.d * 0.75)
        }
    }
}
