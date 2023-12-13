//
//  SettingsViewModel.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-13.
//

import Foundation

class SettingsViewModel {
    // MARK: - Praperties
    lazy var settingsRepository = SettingsRepository()
    lazy var settingsRowData: [SettingsRowDataModel] = []
    
    init() {
        settingsRowData = settingsRepository.decodedData()
    }
}
