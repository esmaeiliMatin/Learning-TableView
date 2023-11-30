//
//  ViewController.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-08.
//

import UIKit

class SettingsView: UIViewController {
    
    // MARK: - Models
    let languageModel = IconLabelLabelRowModel(iconName: "globe", title1: "Language", title2: "English") //magnifyingglass
    let currentVersionModel = IconLabelLabelRowModel(iconName: "magnifyingglass", title1: "Current Version", title2: "1.1.2")
    let notificationsModel = IconLabelChevronRowModel(IconName: "heart", title: "Notifications", hasForwardArrow: false)
    let faqModel = IconLabelChevronRowModel(IconName: "magnifyingglass", title: "FAQ", hasForwardArrow: true)
    let aboutUsModel = IconLabelChevronRowModel(IconName: "questionmark.circle", title: "About us", hasForwardArrow: true)
    let privacyPolicyModel = IconLabelChevronRowModel(IconName: "checkmark.shield", title: "Privacy Policy", hasForwardArrow: true)
    let termsAndConditionsModel = IconLabelChevronRowModel(IconName: "newspaper", title: "Terms and Conditions", hasForwardArrow: true)
    let deleteAcountModel = IconLabelChevronRowModel(IconName: "person.crop.circle.badge.xmark", title: "Delete Account", hasForwardArrow: true)
    
    // MARK: - prareties
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentInset = .init(top: 10, left: 0, bottom: 0, right: 0)
        view.alwaysBounceVertical = true
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    lazy var language = IconLabelLabelRow(frame: .zero, model: languageModel)
    lazy var notifications = IconLabelChevronRow(frame: .zero, model: notificationsModel)
    lazy var currentVersion = IconLabelLabelRow(frame: .zero, model: currentVersionModel)
    lazy var faq = IconLabelChevronRow(frame: .zero, model: faqModel)
    lazy var aboutUs = IconLabelChevronRow(frame: .zero, model: aboutUsModel)
    lazy var privacyPolicy = IconLabelChevronRow(frame: .zero, model: privacyPolicyModel)
    lazy var termsAndConditions = IconLabelChevronRow(frame: .zero, model: termsAndConditionsModel)
    lazy var deleteAccount = IconLabelChevronRow(frame: .zero, model: deleteAcountModel)
    lazy var logout = UIView()
    lazy var deleteButton: DeleteButton = {
        let view = DeleteButton(title: "Log out")
        view.setImage(UIImage(systemName: "door.right.hand.open"), for: .normal)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        return view
    }()
    lazy var switchButton: UISwitch = {
        let view = UISwitch()
        view.onTintColor = UIColor(red: 157/255, green: 191/255, blue: 67/255, alpha: 1)
        return view
    }()
    
    override var navigationItem: UINavigationItem {
        // if this is in a tabbarcontroller, use tabbar navigationitem else use super
        super.navigationItem
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.alignAllEdgesWithSuperview(side: .allSides)
        
        scrollView.addSubview(stack)
        stack.setSize(width: 430)
        stack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 50, left: 0, bottom: 0, right: 0))
           
        createViews(stack: stack)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationItem.compactScrollEdgeAppearance = appearance
    }
}

extension SettingsView {
    
    func createViews(stack: UIStackView) {
        
        notifications.addSubview(switchButton)
        switchButton.alignAllEdgesWithSuperview(side: .allSides, .init(top: 26, left: 350, bottom: 0, right: 0))
        
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
}

