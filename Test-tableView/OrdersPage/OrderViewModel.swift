//
//  OrderViewModel.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-13.
//

import Foundation

class OrderViewModel {
    
    // MARK: - Properties
    lazy var orderRepository = OrderRepository()
    lazy var orders: [Order] = []
    
    init() {
        orders = orderRepository.decodedData()
    }
}
