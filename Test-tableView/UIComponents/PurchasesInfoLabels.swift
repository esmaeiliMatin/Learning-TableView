//
//  InfoLabels.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-16.
//

import UIKit

class PurchasesInfoLabels: UIView {
    
    var staticLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.textColor = .systemGray
        view.textAlignment = .left
        return view
    }()
    
    var dynamicLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        canfigure(staticText: "NOT SET", dynamicText: "NOT SET")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, staticText: String, dynamicText: String) {
        super.init(frame: frame)
        canfigure(staticText: staticText, dynamicText: dynamicText)
    }
    
    func canfigure(staticText: String, dynamicText: String) {
        staticLabel.text = staticText
        addSubview(staticLabel)
        
        staticLabel.setSize(width: 120,height: 34)
        staticLabel.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        staticLabel.alignAllEdgesWithSuperview(side: .bottom, .init(top: 0, left: 0, bottom: -14, right: 0))

        dynamicLabel.text = dynamicText
        addSubview(dynamicLabel)
        dynamicLabel.setSize(width: 120, height: 34)
        dynamicLabel.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        dynamicLabel.alignAllEdgesWithSuperview(side: .bottom, .init(top: 0, left: 0, bottom: 16, right: 0))
    }
}
