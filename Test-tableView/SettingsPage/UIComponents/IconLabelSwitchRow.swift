//
//  IconLabelSwitchRow.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-05.
//

import UIKit

class IconLabelSwitchRow: BaseSettingsRow {
    
    // MARK: - Properties
    
    lazy var switchButton: UISwitch = {
        let view = UISwitch()
        view.onTintColor = #colorLiteral(red: 0.6745263934, green: 0.7824765444, blue: 0.3298357725, alpha: 1)
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect, model: SettingsRowDataModel) {
        super.init(frame: frame, model: model)
        addSwitchButton(isOn: model.switchButton)
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubview(switchButton)
        
        switchButton.alignAllEdgesWithSuperview(side: .allSides, .init(top: 26, left: 350, bottom: 0, right: 0))
    }
    
    // MARK: - Configuration
    
    func addSwitchButton(isOn: Bool?) {
        
        addSubview(switchButton)
        if let active = isOn { switchButton.isOn = active }
        switchButton.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        switchButton.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
    }
}
