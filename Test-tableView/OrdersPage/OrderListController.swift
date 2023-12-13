//
//  OrderListController.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-13.
//

import UIKit

class OrderListController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Property
    lazy var cellReuseIdentifier = "CustomCell"
    lazy var heightForRowAt = 330.0
    lazy var orderViewModel = OrderViewModel()
    lazy var orders = orderViewModel.orders
    lazy var navigationTitle = "My Order"
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)
        view.separatorStyle = .none
        view.allowsSelection = false
        return view
    }()
    lazy var segmentedView = OrderHeaderView()
    
    // MARK: -  view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        view.addSubview(tableView)
        tableView.alignAllEdgesWithSuperview(side: .allSides, .init(top: 136, left: 0, bottom: 0, right: 0))
        
        view.addSubview(segmentedView)
        segmentedView.setSize(height: 40)
        segmentedView.alignAllEdgesWithSuperview(side: .top, .init(top: 96, left: 0, bottom: 0, right: 0))
        segmentedView.alignAllEdgesWithSuperview(side: .leadingAndTrailing, .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBarController = self.tabBarController {
            tabBarController.title = navigationTitle
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderViewModel.orders.count
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
