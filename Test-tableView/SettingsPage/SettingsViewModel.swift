//
//  SettingsViewModel.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-13.
//

import Foundation

class SettingsViewModel {
    
    // MARK: - Properties
    private let repository: SettingsRepository
    public private(set) var dataset: [SettingModel] = []
    
    init(repository: SettingsRepository) {
        self.repository = repository
        
        dataset = repository.fetchData()
    }
}
