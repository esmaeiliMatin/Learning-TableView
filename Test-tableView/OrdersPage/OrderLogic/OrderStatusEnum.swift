//
//  OrderStatusEnum.swift
//  Test-tableView
//
//  Created by Matin on 2023-11-15.
//

import Foundation

enum OrderStatusEnum: String {
    case delivered = "Delivered"
    case waitForPayment = "Wait for payment"
    case processing = "Processing"
    case cancel = "Cancel"
    case noInfo = "NO INFO"
}
