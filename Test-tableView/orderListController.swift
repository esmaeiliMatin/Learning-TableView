//
//  UIViewController.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-14.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var orders: [Order] = []
    let statement = [statusOfPurchases.waitForPayment, statusOfPurchases.processing, statusOfPurchases.cancel]
    let cellReuseIdentifier = "CustomCell"
    let date = Date()
    var tableView: UITableView!
    let header = HeaderView(frame: .zero, s: "s")
    var images: [CustomImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orders = [Order(status: statusOfPurchases.waitForPayment, price: 122.32, deliveryLocation: "Home", countOfItems: 4),
                  Order(status: statusOfPurchases.processing, price: 23.74, deliveryLocation: "Office", countOfItems: 1),
                  Order(status: statusOfPurchases.waitForPayment, price: 34.88, deliveryLocation: "Friend",countOfItems: 2),
        ]
        
        print(orders)
        
        view.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        header.alignAllEdgesWithSuperview(side: .allSides, .init(top: 0, left: 0, bottom: 0, right: 150))

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        tableView.alignAllEdgesWithSuperview(side: .allSides, .init(top: 166, left: 0, bottom: -84, right: 0))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! OrderCell
        
        let order = orders[indexPath.row]
        cell.configurate(order: order)
        cell.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 336
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = statement[indexPath.row]
        print("Selected item: \(selectedItem)")
    }
}
