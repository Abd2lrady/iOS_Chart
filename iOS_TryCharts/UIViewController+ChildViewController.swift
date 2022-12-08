//
//  UIViewController+ChildViewController.swift
//  iOS_TryCharts
//
//  Created by Fintech on 06/12/2022.
//

import UIKit

extension UIViewController {
    
    func addChildController(_ viewController: UIViewController, to view: UIView) {
        self.addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
                                     viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        viewController.didMove(toParent: self)
    }
    
    func removeChildController(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
