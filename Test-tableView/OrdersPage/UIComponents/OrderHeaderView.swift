//
//  OrderHeaderView.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-19.
//

import UIKit

class OrderHeaderView: UIView {
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var indicator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 149/255, green: 193/255, blue: 31/255, alpha: 1)
        return view
    }()
    
    lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.text = "My Order"
        view.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        view.textColor = .black
        return view
    }()
    
    lazy var segmentedControl = UISegmentedControl(items: ["All", "On Process", "Previous"])
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        view.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: -778, right: 0))
        
        addSubview(headerLabel)
        headerLabel.alignAllEdgesWithSuperview(side: .allSides, .init(top: 44, left: 30, bottom: -820, right: -100))
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.tintColor = .black
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(named: "segmentedBackground"), for: .normal, barMetrics: .default)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.setSize(width: 430, height: 40)
        segmentedControl.alignAllEdgesWithSuperview(side: .bottom, .init(top: 0, left: 0, bottom: 0, right: 0))
        
        segmentedControl.addSubview(indicator)
        
        segmentedControlValueChanged(segmentedControl)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        updateIndicator()
        switch sender.selectedSegmentIndex {
        case 0:
            print("All")
        case 1:
            print("On Process")
        case 2:
            print("Previous")
        default:
            break
        }
    }
    
    func updateIndicator() {
        let segmentWidth = CGFloat(143)
        let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        let indicatorX = CGFloat(selectedSegmentIndex) * segmentWidth
        let indicatorY = (40.0) - 3
        
        UIView.animate(withDuration: (indicator.frame.maxY == 0) ? 0.0 : 0.3) {
            self.indicator.frame = CGRect(x: indicatorX, y: indicatorY, width: segmentWidth, height: 3)
        }
    }
}
