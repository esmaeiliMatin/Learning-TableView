//
//  SettingsViewController.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-08.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    // MARK: - prareties
    
    lazy var settingsRepository = SettingsRepository()
    
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
        
        lazy var settingsRowData = settingsRepository.decodedData()
        
        lazy var language = IconLabelLabelRow(frame: .zero, model: settingsRowData[0])
        lazy var notifications = IconLabelSwitchRow(frame: .zero, model: settingsRowData[2])
        lazy var currentVersion = IconLabelLabelRow(frame: .zero, model: settingsRowData[1])
        lazy var faq = IconLabelChevronRow(frame: .zero, model: settingsRowData[3])
        lazy var aboutUs = IconLabelChevronRow(frame: .zero, model: settingsRowData[4])
        lazy var privacyPolicy = IconLabelChevronRow(frame: .zero, model: settingsRowData[5])
        lazy var termsAndConditions = IconLabelChevronRow(frame: .zero, model: settingsRowData[6])
        lazy var deleteAccount = IconLabelChevronRow(frame: .zero, model: settingsRowData[7])
        lazy var logout = UIView()
        lazy var deleteButton = DeleteButton(title: "Log out", iconName: "door.right.hand.open")
        
        view.addSubview(scrollView)
        scrollView.alignAllEdgesWithSuperview(side: .allSides, .init(top: 100, left: 0, bottom: 0, right: 0))
        
        scrollView.addSubview(stack)
        stack.setSize(width: 430)
        stack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 10, left: 0, bottom: 0, right: 0))
        
        logout.setSize(height: 112)
        logout.addSubview(deleteButton)
        
        deleteButton.setSize(width: 360, height: 66)
        deleteButton.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        deleteButton.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        
        stack.addArrangedSubview(language)
        stack.addArrangedSubview(notifications)
        stack.addArrangedSubview(currentVersion)
        stack.addArrangedSubview(faq)
        stack.addArrangedSubview(aboutUs)
        stack.addArrangedSubview(privacyPolicy)
        stack.addArrangedSubview(termsAndConditions)
        stack.addArrangedSubview(deleteAccount)
        stack.addArrangedSubview(logout)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBarController = self.tabBarController {
            tabBarController.title = "Settings"
        }
    }
}
