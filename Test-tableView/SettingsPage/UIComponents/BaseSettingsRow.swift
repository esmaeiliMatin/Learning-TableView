//
//  BaseSettingsRow.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-05.
//

import UIKit

protocol switchable where Self: UIView & BaseSettingRowProtocol {
    var boolValue: Bool { get }
}

protocol BaseSettingRowProtocol where Self: UIView {
    var label: UILabel { get set }
    var icon: UIImageView { get set }
}

class BaseSettingsRow: UIView {
    
    // MARK: - Properties}
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    lazy var icon = UIImageView()
    
    private let viewHeight = 72.0
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, model: SettingsRowDataModel) {
        super.init(frame: frame)
        commonInit()
        configure(model: model)
    }
    
    // MARK: - Configuration
    private func commonInit() {
        backgroundColor = .white
        setSize(height: viewHeight)
        
        addSubview(label)
        label.setSize(width: 200)
        label.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        label.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 80, bottom: 0, right: 0))
        
        addSubview(icon)
        icon.setSize(width: 24, height: 24)
        icon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 30, bottom: 0, right: 0))
        icon.setCenterAnchorToCenterOfSuperview(axis: .vertical)
    }
    
    func configure(model: SettingsRowDataModel) {
        label.text = model.title
        icon.image = UIImage(systemName: model.iconName)
        icon.tintColor = .systemGray
    }   
}
