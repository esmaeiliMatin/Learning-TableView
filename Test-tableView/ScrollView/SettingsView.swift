//
//  ViewController.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-08.
//

import UIKit

class SettingsView: UIViewController {
    
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
    
    lazy var language = ScrollViewRowWith2Labels()
    lazy var notifications = ScrollViewRowWith1Labels()
    lazy var currentVersion = ScrollViewRowWith2Labels()
    lazy var faq = ScrollViewRowWith1Labels()
    lazy var aboutUs = ScrollViewRowWith1Labels()
    lazy var privacyPolicy = ScrollViewRowWith1Labels()
    lazy var termsAndConditions = ScrollViewRowWith1Labels()
    lazy var deleteAccount = ScrollViewRowWith1Labels()
    lazy var logout = UIView()
    lazy var deleteButton = DeleteButton(title: "Log out")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.alignAllEdgesWithSuperview(side: .allSides)
        
        scrollView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 50, left: 0, bottom: 0, right: 0))
        stack.setSize(width: 430)

        createViews(stack: stack)
        
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .white
//        appearance.shadowColor = .clear
//        navigationItem.standardAppearance = appearance
//        navigationItem.scrollEdgeAppearance = appearance
//        navigationItem.compactAppearance = appearance
//        navigationItem.compactScrollEdgeAppearance = appearance
//        navigationItem.title = "Settings"
    }
}

extension SettingsView {
    
    func createViews(stack: UIStackView) {
        
        let viewHeight = 82.0
        
        language.configure(with: "Language", and: "English", color: #colorLiteral(red: 0.6392156863, green: 0.7450980392, blue: 0.431372549, alpha: 1), iconName: "globe")
        
        notifications.setSize(height: viewHeight)
        notifications.configure(with: "Notifications", iconName: "heart", hasForwardArrow: false)
        lazy var switchButton: UISwitch = {
            let view = UISwitch()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.onTintColor = UIColor(red: 157/255, green: 191/255, blue: 67/255, alpha: 1)
            return view
        }()
        notifications.addSubview(switchButton)
        switchButton.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: 0, right: 0))
        currentVersion.configure(with: "Current Version", and: "1.1.2", color: .systemGray, iconName: "magnifyingglass")
        faq.configure(with: "FAQ", iconName: "magnifyingglass", hasForwardArrow: true)
        aboutUs.configure(with: "About us", iconName: "questionmark.circle", hasForwardArrow: true)
        privacyPolicy.configure(with: "Privacy Policy", iconName: "checkmark.shield", hasForwardArrow: true)
        termsAndConditions.configure(with: "Terms and Conditions", iconName: "newspaper", hasForwardArrow: true)
        deleteAccount.configure(with: "Delete Account", iconName: "person.crop.circle.badge.xmark", hasForwardArrow: true)
        
        logout.setSize(height: 112)
        let buttonIcon = UIImage(systemName: "door.right.hand.open")
        deleteButton.setImage(buttonIcon, for: .normal)
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

