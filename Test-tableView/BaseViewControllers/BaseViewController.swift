//
//  BaseViewController.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-05.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        let titleFont = UIFont.boldSystemFont(ofSize: 28)
        appearance.titleTextAttributes = [.font: titleFont, .foregroundColor: UIColor.black]
        appearance.titlePositionAdjustment = UIOffset(horizontal: -120, vertical: 0)
        navigationController?.navigationBar.standardAppearance = appearance
    }
}
