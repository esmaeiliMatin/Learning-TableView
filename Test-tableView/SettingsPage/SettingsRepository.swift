//
//  SettingsRepository.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-11.
//

import UIKit

class SettingsRepository {
    
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
    
    func decodedData() -> [SettingsRowDataModel] {
        if let productsData = readLocalJSONFile(forName: "SettingsUIViewModelData") {
            do {
                let decoder = JSONDecoder()
                let decodedOrders = try decoder.decode([SettingsRowDataModel].self, from: productsData)
                let decodedOrdersArray: [SettingsRowDataModel] = decodedOrders
                return decodedOrdersArray
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return []
    }
}
