//
//  OrderRepository.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-10.
//

import UIKit

class OrderRepository {
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("Error reading JSON file: \(error)")
        }
        return nil
    }
    
    func decodedData() -> [Order] {
        if let productsData = readLocalJSONFile(forName: "OrderUIViewModelData") {
            do {
                let decoder = JSONDecoder()
                let decodedOrders = try decoder.decode([Order].self, from: productsData)
                let decodedOrdersArray: [Order] = decodedOrders
                return decodedOrdersArray
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return []
    }
}
