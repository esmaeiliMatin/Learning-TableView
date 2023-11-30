//
//  Order.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-22.
//

import Foundation

struct Order {
    
    var status: PurchasesStatusEnum
    var deliveryLocation: String
    var price: Double
    var countOfItems: Int // It's just testing UI
    let date: Date
    let id: String
    
    init(status: PurchasesStatusEnum, price: Double, deliveryLocation: String, countOfItems: Int) {
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
