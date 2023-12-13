//
//  SettingsRowDataModel.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-11.
//

import UIKit

struct SettingsRowDataModel: Codable {
    let type: String
    let iconName: String
    let title: String
    let title2: String?
    let switchButton: Bool?
}
