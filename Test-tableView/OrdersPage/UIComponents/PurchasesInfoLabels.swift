//
//  PurchasesInfoLabels.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-16.
//

import UIKit

class PurchasesInfoLabels: UIView {
    
    lazy var staticLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.textColor = .systemGray
        view.textAlignment = .left
        return view
    }()
    
    lazy var dynamicLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, staticText: String, dynamicText: String) {
        super.init(frame: frame)
        addSubview(staticLabel)
        addSubview(dynamicLabel)
        staticLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 18, left: 0, bottom: 0, right: 0))
        staticLabel.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 0, bottom: 0, right: 0))
        dynamicLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 50, left: 0, bottom: 0, right: 0))
        dynamicLabel.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 0, bottom: 0, right: 0))
        canfigure(staticText: staticText, dynamicText: dynamicText)
    }
    
    func canfigure(staticText: String, dynamicText: String) {
        
        staticLabel.text = staticText
        dynamicLabel.text = dynamicText
    }
}
