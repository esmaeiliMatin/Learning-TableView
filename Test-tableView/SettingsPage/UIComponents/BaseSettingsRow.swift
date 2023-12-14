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
    
    public static let preferredHeight: CGFloat = 72.0
    
    let model: SettingModel
    
    init(model: SettingModel) {
        self.model = model
        
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(label)
        label.setSize(width: 200)
        label.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        label.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 80, bottom: 0, right: 0))
        
        addSubview(icon)
        icon.setSize(width: 24, height: 24)
        icon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 30, bottom: 0, right: 0))
        icon.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        
        configure(model: model)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func configure(model: SettingModel) {
        label.text = model.title
        icon.image = UIImage(systemName: model.iconName)
        icon.tintColor = .systemGray
    }   
}
