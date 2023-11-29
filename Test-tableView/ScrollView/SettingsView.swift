//
//  ViewController.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-08.
//

import UIKit

class SettingsView: UIViewController {
    
    // MARK: - Models
    let languageModel = ScrollViewRowWith2LabelsModel(title: "Language", title2: "English", iconName: "globe")
    let currentVersionModel = ScrollViewRowWith2LabelsModel(title: "Current Version", title2: "1.1.2", iconName: "magnifyingglass")
    let notificationsModel = ScrollViewRowWith1LabelsModel(title: "Notifications", iconName: "heart", hasForwardArrow: false)
    let faqModel = ScrollViewRowWith1LabelsModel(title: "FAQ", iconName: "magnifyingglass", hasForwardArrow: true)
    let aboutUsModel = ScrollViewRowWith1LabelsModel(title: "About us", iconName: "questionmark.circle", hasForwardArrow: true)
    let privacyPolicyModel = ScrollViewRowWith1LabelsModel(title: "Privacy Policy", iconName: "checkmark.shield", hasForwardArrow: true)
    let termsAndConditionsModel = ScrollViewRowWith1LabelsModel(title: "Terms and Conditions", iconName: "newspaper", hasForwardArrow: true)
    let deleteAcountModel = ScrollViewRowWith1LabelsModel(title: "Delete Account", iconName: "person.crop.circle.badge.xmark", hasForwardArrow: true)
    
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
    
    private lazy var deleteButtonContainer: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var language = ScrollViewRowWith2Labels(frame: .zero, model: languageModel)
    lazy var notifications = ScrollViewRowWith1Labels(frame: .zero, model: notificationsModel)
    lazy var currentVersion = ScrollViewRowWith2Labels(frame: .zero, model: currentVersionModel)
    lazy var faq = ScrollViewRowWith1Labels(frame: .zero, model: faqModel)
    lazy var aboutUs = ScrollViewRowWith1Labels(frame: .zero, model: aboutUsModel)
    lazy var privacyPolicy = ScrollViewRowWith1Labels(frame: .zero, model: privacyPolicyModel)
    lazy var termsAndConditions = ScrollViewRowWith1Labels(frame: .zero, model: termsAndConditionsModel)
    lazy var deleteAccount = ScrollViewRowWith1Labels(frame: .zero, model: deleteAcountModel)
    lazy var logout = UIView()
    lazy var deleteButton = DeleteButton(title: "Log out")
    lazy var switchButton = UISwitch()

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
        
//        let viewHeight = 82.0
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = UIColor(red: 157/255, green: 191/255, blue: 67/255, alpha: 1)
        notifications.addSubview(switchButton)
        switchButton.alignAllEdgesWithSuperview(side: .allSides, .init(top: 26, left: 350, bottom: 0, right: 0))
        
        logout.setSize(height: 112)
        let deleteButtonIcon = UIImage(systemName: "door.right.hand.open")
        deleteButton.setImage(deleteButtonIcon, for: .normal)
        deleteButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
        deleteButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
//        deleteButton.isUserInteractionEnabled = true
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

