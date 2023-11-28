//
//  CustomImage.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-20.
//

import UIKit

class CustomImage: UIView {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        view.setSize(width: 80, height: 80)
        return view
    }()
    
    lazy var countOfProduct: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        view.textColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        view.text = String(Int.random(in: 0...9)) + "X"
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1).cgColor
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.setSize(width: 20, height: 20)
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, imageName: String, count: String) {
        super.init(frame: frame)
        
        imageView.image = UIImage(named: imageName)
        addSubview(imageView)
        imageView.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        imageView.setCenterAnchorToCenterOfSuperview(axis: .vertical)
        
        countOfProduct.text = "+" + count
        addSubview(countOfProduct)
        countOfProduct.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        countOfProduct.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
    }
}
