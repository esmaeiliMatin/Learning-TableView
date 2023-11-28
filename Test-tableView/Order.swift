//
//  Order.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-22.
//

import Foundation

struct Order {
    
    var status: statusOfPurchases
    var id: String
    var date: Date
    var price: Double
    var deliveryLocation: String
    var countOfItems: Int
    
    init(status: statusOfPurchases, price: Double, deliveryLocation: String, countOfItems: Int) {
        self.status = status
        self.price = price
        self.deliveryLocation = deliveryLocation
        self.countOfItems = countOfItems
        self.date = Date()
        self.id = Order.generateShortUUID()
    }
    
    private static func generateShortUUID() -> String {
        let uuid = UUID()
        let uuidString = uuid.uuidString
        let shortUUID = uuidString.replacingOccurrences(of: "-", with: "").prefix(8)
        return String(shortUUID)
    }
}
