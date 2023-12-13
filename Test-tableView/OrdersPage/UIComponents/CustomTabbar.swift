//
//  CustomTabbar.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-05.
//

import UIKit

class CustomTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        lazy var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 90
        return sizeThatFits
    }
}
