//
//  OrderCell.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-14.
//

import UIKit

class OrderCell: UITableViewCell {
    
    // MARK: - Property

    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.textColor = .systemGray
        view.textAlignment = .left
        return view
    }()
    
    lazy var leftInfoLabel: PurchasesInfoLabels = {
        let view = PurchasesInfoLabels(frame: .zero, staticText: "Order ID", dynamicText: "")
        return view
    }()
    
    lazy var midInfoLabel: PurchasesInfoLabels = {
        let view = PurchasesInfoLabels(frame: .zero, staticText: "Deliver To", dynamicText: "")
        return view
    }()
    
    lazy var rightInfoLabel: PurchasesInfoLabels = {
        let view = PurchasesInfoLabels(frame: .zero, staticText: "Total Payment", dynamicText: "")
        return view
    }()
    
    lazy var statusIcon = PurchasesStatusIcon(frame: .zero)
    
    private lazy var infoStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        return view
    }()
    
    private lazy var imageStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        return view
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        view.backgroundColor = .white
        contentView.addSubview(view)
        view.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: -12, right: 0))
        
        view.addSubview(statusLabel)
        statusLabel.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 70, bottom: 0, right: 0))
        statusLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(statusIcon)
        statusIcon.setSize(width: 34, height: 34)
        statusIcon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 22, bottom: 0, right: 0))
        statusIcon.alignAllEdgesWithSuperview(side: .top, .init(top: 22, left: 0, bottom: 0, right: 0))
        
        view.addSubview(dateLabel)
        dateLabel.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -24))
        dateLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 30, left: 0, bottom: 0, right: 0))
        
        infoStack.addArrangedSubview(leftInfoLabel)
        infoStack.addArrangedSubview(midInfoLabel)
        infoStack.addArrangedSubview(rightInfoLabel)
        view.addSubview(infoStack)
        infoStack.setSize(height: 80)
        infoStack.alignAllEdgesWithSuperview(side: .leadingAndTrailing, .init(top: 0, left: 30, bottom: 0, right: -30))
        infoStack.alignAllEdgesWithSuperview(side: .top, .init(top: 90, left: 0, bottom: 0, right: 0))
        
        view.addSubview(imageStack)
        imageStack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 230, left: 24, bottom: -80, right: -24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - functions
    
    func configurate(order: Order) {
        
        statusLabel.text = order.status
        dateLabel.text = order.date
        leftInfoLabel.dynamicLabel.text = order.id
        midInfoLabel.dynamicLabel.text = order.deliveryPlace
        rightInfoLabel.dynamicLabel.text = "$" + String(order.price)
        
        switch order.status {
        case "Processing":
            statusIcon.setImage(imageName: IconNamesEnum.processing)
        case "Waiting for Payment":
            statusIcon.setImage(imageName: IconNamesEnum.waitForPayment)
        case "Canceled":
            statusIcon.setImage(imageName: IconNamesEnum.cancel)
        case "Finished":
            statusIcon.setImage(imageName: IconNamesEnum.delivered)
        default:
            statusIcon.setImage(imageName: IconNamesEnum.cancel)
        }
        
        imageStack.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        
        for image in order.media {
            let picture = OrderListImage(frame: .zero, imageName: image, count: "2")
            imageStack.addArrangedSubview(picture)
        }
    }
}
