//
//  IconLabelLabelRow.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-12.
//

import UIKit

class IconLabelLabelRow: BaseSettingsRow {
    
    // MARK: - Properties
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, model: SettingsRowDataModel) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label2)
        label2.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: 0, right: -30))
        configure(model: model)
    }
    
    // MARK: - Configuration
    
    override func configure(model: SettingsRowDataModel) {
        icon.image = UIImage(systemName: model.iconName)
        icon.tintColor = .gray
        label.text = model.title
        label2.text = model.title2
        label2.textColor =  .gray
    }
}
