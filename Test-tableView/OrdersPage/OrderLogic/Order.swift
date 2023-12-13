//
//  Order.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-22.
//

import UIKit

struct Order: Decodable {
    
    let status: String
    let deliveryPlace: String
    let price: Double
    let media: [String]
    let date: String
    let id: String
    
    init(status: String, price: Double, deliveryPlace: String, media: [String], date: String, id: String) {
        self.status = status
        self.price = price
        self.deliveryPlace = deliveryPlace
        self.date = date
        self.id = id
        self.media = media
    }
}
