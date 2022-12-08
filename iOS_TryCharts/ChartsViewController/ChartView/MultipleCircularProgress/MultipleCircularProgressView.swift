//
//  MultipleCircularProgressView.swift
//  iOS_TryCharts
//
//  Created by Fintech on 08/12/2022.
//

import UIKit

class MultipleCircularProgressView: UIView {

    @IBOutlet var contentView: UIView!
    
    var circularViews: [CircularProgressView]!
    
    
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
        circularViews = views
        
        print(circularViews.count)
        
        for current in 1 ..< circularViews.count {
            let lastView = views[current - 1]
            let currentView = views[current]
            self.addSubview(views[current])
            currentView.translatesAutoresizingMaskIntoConstraints = false
            let scaling = lastView.transform
            NSLayoutConstraint.activate([currentView.topAnchor.constraint(equalTo: lastView.topAnchor),
                                         currentView.bottomAnchor.constraint(equalTo: lastView.bottomAnchor),
                                         currentView.leadingAnchor.constraint(equalTo: lastView.leadingAnchor),
                                         currentView.trailingAnchor.constraint(equalTo: lastView.trailingAnchor)])
            
            views[current].transform = CGAffineTransform(scaleX:scaling.a * 0.75,
                                                         y: scaling.d * 0.75)
        }
        self.layoutSubviews()
        print(self.subviews.count)
    }

//    }
//        let viewsCount = views.count
//        print(viewsCount)
//        self.addSubview(views[0])
//
//        for current in 1 ..< viewsCount {
//            let lastView = views[current - 1]
//            let currentView = views[current]
//            self.addSubview(views[current])
//            currentView.translatesAutoresizingMaskIntoConstraints = false
//            let scaling = lastView.transform
//
//            NSLayoutConstraint.activate([currentView.topAnchor.constraint(equalTo: lastView.topAnchor),
//                                         currentView.bottomAnchor.constraint(equalTo: lastView.bottomAnchor),
//                                         currentView.leadingAnchor.constraint(equalTo: lastView.leadingAnchor),
//                                         currentView.trailingAnchor.constraint(equalTo: lastView.trailingAnchor)])
//
//            views[current].transform = CGAffineTransform(scaleX:scaling.a * 0.75,
//                                                         y: scaling.d * 0.75)
//        }
//        self.layoutSubviews()
//        print(self.subviews.count)
//    }
}
