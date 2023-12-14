//
//  SettingsRepository.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-11.
//

import UIKit

class SettingsRepository: ApplicationRepositoryProtocol {
    
    let resourceName = "SettingsUIViewModelData"
    
    func fetchData() -> [SettingModel] {
        return decodedData(resourceName: resourceName)
    }
}
