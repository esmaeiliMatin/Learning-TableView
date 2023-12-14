//
//  IconLabelLabelRow.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-12.
//

import UIKit

class IconLabelLabelRow: BaseSettingsRow {
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = value
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    let value: String
    
    init(model: SettingModel, value: String) {
        self.value = value
        
        super.init(model: model)
        
        addSubview(valueLabel)
        valueLabel.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: 0, right: -30))
    }
}
