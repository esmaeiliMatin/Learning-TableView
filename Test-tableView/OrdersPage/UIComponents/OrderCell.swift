//
//  OrderCell.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-14.
//

import UIKit

class OrderCell: UITableViewCell {
    
    lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
        let view = PurchasesInfoLabels()
        return view
    }()
    
    lazy var midInfoLabel: PurchasesInfoLabels = {
        let view = PurchasesInfoLabels()
        return view
    }()
    
    lazy var rightInfoLabel: PurchasesInfoLabels = {
        let view = PurchasesInfoLabels()
        return view
    }()
    
    lazy var statusIcon = PurchasesStatusIcon(frame: .zero)
    
    private lazy var allInfoStack: UIStackView = {
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
    
    static let AllImages: [OrderListImage] = [
        OrderListImage(frame: .zero, imageName: "image-1", count: "4"),
        OrderListImage(frame: .zero, imageName: "image-2", count: "1"),
        OrderListImage(frame: .zero, imageName: "image-3", count: "2"),
        OrderListImage(frame: .zero, imageName: "image-4", count: "7"),
        OrderListImage(frame: .zero, imageName: "image-5", count: "2"),
        OrderListImage(frame: .zero, imageName: "image-6", count: "9")
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        view.backgroundColor = .white
        contentView.addSubview(view)
        view.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: -16, right: 0))
        
        statusLabel.backgroundColor = .white
        view.addSubview(statusLabel)
        statusLabel.setSize(width: 150, height: 40)
        statusLabel.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 70, bottom: 0, right: 0))
        statusLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 40, left: 0, bottom: 0, right: 0))
        
        view.addSubview(statusIcon)
        statusIcon.setSize(width: 34, height: 34)
        statusIcon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 20, bottom: 0, right: 0))
        statusIcon.alignAllEdgesWithSuperview(side: .top, .init(top: 42, left: 0, bottom: 0, right: 0))
        
        view.addSubview(dateLabel)
        dateLabel.setSize(width: 120, height: 40)
        dateLabel.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -24))
        dateLabel.alignAllEdgesWithSuperview(side: .top, .init(top: 40, left: 0, bottom: 0, right: 0))

        allInfoStack.addArrangedSubview(leftInfoLabel)
        allInfoStack.addArrangedSubview(midInfoLabel)
        allInfoStack.addArrangedSubview(rightInfoLabel)
        view.addSubview(allInfoStack)
        allInfoStack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 100, left: 20, bottom: -154, right: -20))
        
        imageStack.addArrangedSubview(OrderListImage(frame: .zero, imageName: "image-1", count: "2"))
        imageStack.addArrangedSubview(OrderListImage(frame: .zero, imageName: "image-2", count: "2"))
        imageStack.addArrangedSubview(OrderListImage(frame: .zero, imageName: "image-3", count: "2"))
        imageStack.addArrangedSubview(OrderListImage(frame: .zero, imageName: "image-4", count: "2"))
        view.addSubview(imageStack)
        imageStack.alignAllEdgesWithSuperview(side: .allSides, .init(top: 200, left: 24, bottom: -16, right: -24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurate(order: Order) {
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        let imageName: IconNamesEnum
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        dateLabel.text = dateFormatter.string(from: order.date)
        statusLabel.text = order.status.rawValue
        leftInfoLabel.canfigure(staticText: "Order ID", dynamicText: order.id)
        midInfoLabel.canfigure(staticText: "Deliver To", dynamicText: order.deliveryLocation)
        rightInfoLabel.canfigure(staticText: "Total Payment", dynamicText: String(order.price))
        
        switch order.status {
        case .delivered:
            imageName = IconNamesEnum.delivered
        case .processing:
            imageName = IconNamesEnum.processing
        case .cancel:
            imageName = IconNamesEnum.cancel
        case .noInfo:
            imageName = IconNamesEnum.noInfo
        case .waitForPayment:
            imageName = IconNamesEnum.waitForPayment
        }
        
        statusIcon.setImage(imageName: imageName)
    }
}
