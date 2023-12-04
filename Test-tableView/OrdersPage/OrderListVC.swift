//
//  OrderListController.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-14.
//

import UIKit

class OrderListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var orders: [Order] = []
    let date = Date()
    let cellReuseIdentifier = "CustomCell"
    let heightForRowAt = 336.0
    let statement = [PurchasesStatusEnum.waitForPayment, PurchasesStatusEnum.processing, PurchasesStatusEnum.cancel] //just for test - this line should be remove
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        view.separatorStyle = .none
        view.allowsSelection = false
        return view
    }()
    
    lazy var segmentedView = OrderHeaderView()
    
    var images: [OrderListImage] = [] //just for test - this line should be remove
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        orders = [Order(status: PurchasesStatusEnum.waitForPayment, price: 122.32, deliveryLocation: "Home", countOfItems: 4),
                  Order(status: PurchasesStatusEnum.processing, price: 23.74, deliveryLocation: "Office", countOfItems: 1),
                  Order(status: PurchasesStatusEnum.waitForPayment, price: 34.88, deliveryLocation: "Friend",countOfItems: 2),
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        view.addSubview(tableView)
        tableView.alignAllEdgesWithSuperview(side: .allSides, .init(top: 136, left: 0, bottom: 0, right: 0))
        view.addSubview(segmentedView)
        segmentedView.setSize(width: 430, height: 40)
        segmentedView.alignAllEdgesWithSuperview(side: .top, .init(top: 96, left: 0, bottom: 0, right: 0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        let titleFont = UIFont.boldSystemFont(ofSize: 27)
        appearance.titleTextAttributes = [.font: titleFont, .foregroundColor: UIColor.black]
        appearance.titlePositionAdjustment = UIOffset(horizontal: -130, vertical: 0)
        navigationController?.navigationBar.standardAppearance = appearance
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        tabBarController?.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        
        if let tabBarController = self.tabBarController {
            tabBarController.title = "My Order"
            tabBarController.tabBar.isTranslucent = false
        } else {
            // TODO: use VC navigation here instead of tabbarVC navigation
            print("2")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! OrderCell
        
        let order = orders[indexPath.row]
        cell.configurate(order: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRowAt
    }
}
