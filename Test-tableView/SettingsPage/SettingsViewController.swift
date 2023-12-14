//
//  SettingsViewController.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-08.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    // MARK: - prareties
    private lazy var vm: SettingsViewModel = {
        let repository = SettingsRepository()
        let vm = SettingsViewModel(repository: repository)
        return vm
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.alignAllEdgesWithSuperview(side: .allSides, .init(top: 100, left: 0, bottom: 0, right: 0))
        
        scrollView.addSubview(stack)
        stack.setSize(width: 430)
        stack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 10, left: 0, bottom: 0, right: 0))
        
        vm.dataset.forEach { model in
            
            let view: BaseSettingsRow
            
            switch model.typeAndValue {
            case .keyValue(let value):
                view = IconLabelLabelRow(model: model, value: value)
            case .switch(let value):
                view = IconLabelSwitchRow(model: model, value: value)
            case .onlyKey:
                view = IconLabelChevronRow(model: model)
            case .unknown:
                view = BaseSettingsRow(model: model)
            }
            
            stack.addArrangedSubview(view)
            view.setSize(height: BaseSettingsRow.preferredHeight)
        }
        
        lazy var logout = UIView()
        lazy var deleteButton = DeleteButton(title: "Log out", iconName: "door.right.hand.open")
        
        logout.setSize(height: 112)
        logout.addSubview(deleteButton)
        
        deleteButton.setSize(width: 360, height: 66)
        deleteButton.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        deleteButton.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        
        stack.addArrangedSubview(logout)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBarController = self.tabBarController {
            tabBarController.title = "Settings"
        }
    }
}
