//
//  IconLabelSwitchRow.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-05.
//

import UIKit

class IconLabelSwitchRow: BaseSettingsRow {
    
    lazy var switchButton: UISwitch = {
        let view = UISwitch()
        view.onTintColor = #colorLiteral(red: 0.6745263934, green: 0.7824765444, blue: 0.3298357725, alpha: 1)
        view.isOn = value
        return view
    }()
    
    let value: Bool
    
    init(model: SettingModel, value: Bool) {
        self.value = value
        
        super.init(model: model)
        
        addSubview(switchButton)
        switchButton.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        switchButton.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
    }
}
