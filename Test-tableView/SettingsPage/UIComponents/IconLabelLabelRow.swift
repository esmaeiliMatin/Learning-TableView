//
//  IconLabelLabelRow.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-12.
//

import UIKit

class IconLabelLabelRow: UIView {
    
    // MARK: - Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    private var icon = UIImageView()
    private let viewHeight = 82.0
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(frame: CGRect, model: IconLabelLabelRowModel) {
        super.init(frame: frame)
        commonInit()
        configure(model: model)
    }
    
    private func commonInit() {
        backgroundColor = .white
        label2.textColor = .gray
        icon.tintColor = .systemGray
        
        addSubview(icon)
        addSubview(label)
        addSubview(label2)
        
        setSize(height: viewHeight)
        label.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 80, bottom: 0, right: 0))
        label2.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: 0, right: -30))
        icon.alignAllEdgesWithSuperview(side: .top, .init(top: 30, left: 0, bottom: 0, right: 0))
        icon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 30, bottom: 0, right: 0))
        icon.setSize(width: 24, height: 24)
    }
    
    // MARK: - Configuration
    
    func configure(model: IconLabelLabelRowModel) {
        label.text = model.title1
        label2.text = model.title2
        icon.image = UIImage(systemName: model.iconName)
    }
}
