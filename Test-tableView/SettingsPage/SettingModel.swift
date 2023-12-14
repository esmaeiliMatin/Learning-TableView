//
//  SettingModel.swift
//  Test-tableView
//
//  Created by Matin on 2023-12-11.
//

import UIKit

enum SettingModelTypeAndValueEnum: Decodable {
    case keyValue(_ value: String), `switch`(_ value: Bool), onlyKey, unknown
}

struct SettingModel: Decodable {
    enum CodingKeys: CodingKey {
        case type, iconName, title, value, switchButton
    }
    
    let typeAndValue: SettingModelTypeAndValueEnum
    let iconName: String
    let title: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        iconName = try container.decode(String.self, forKey: .iconName)
        title = try container.decode(String.self, forKey: .title)
        
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "KeyValue":
            let value = try container.decode(String.self, forKey: .value)
            self.typeAndValue = .keyValue(value)
        case "Switch":
            let value = try container.decode(Bool.self, forKey: .switchButton)
            self.typeAndValue = .`switch`(value)
        case "OnlyKey":
            self.typeAndValue = .onlyKey
        default:
            self.typeAndValue = .unknown
        }
    }
}
