//
//  FieldModel.swift
//  
//
//  Created by Alejandro Bacelis on 25/11/21.
//

import Foundation
import SwiftUI

public struct TVField: Identifiable {
    public var id: String = UUID().uuidString
    public var name: String
    public var icon: String
    public var type: FieldItemTypeProtocol
    
    public var typeConfigurationData: Data?
    
    public var configuration: TVFieldConfiguration
}

extension TVField {
    public var tableTitleLabel: Label<Text, Image> {
        Label(name, systemImage: icon)
    }
    
    public func makeCell(with data: Data?) -> some View {
        var text: String
        if let data = data {
            text = String(data: data, encoding: .utf8)!
        } else { text = "" }
        
        return Text(text)
    }
}

public let textField = TVField(name: "Text", icon: "a", type: TVField.Types.Text.shortText, typeConfigurationData: nil, configuration: .defaultConfiguration)
public let pickerField = TVField(name: "Picker", icon: "cirlce", type: TVField.Types.Text.picker, typeConfigurationData: "PC,Tablet,Phone".data(using: .utf8), configuration: .defaultConfiguration)

extension TVField {
    public struct Types {
        static var allCases: [FieldItemTypeProtocol]    = Number.allCases
                                                + File.allCases
                                                + Text.allCases
                                                + Date.allCases
                                                + Others.allCases
        
        enum Number: String, CaseIterable, FieldItemTypeProtocol {
            case phone
            case rating
            case auto
        }
        enum File: String, CaseIterable, FieldItemTypeProtocol {
            case any
            case image
            case audio
            case video
        }
        enum Text: String, CaseIterable, FieldItemTypeProtocol {
            case shortText
            case longText
            case email
            case address
            case picker
        }
        enum Date: String, CaseIterable, FieldItemTypeProtocol {
            case day
            case time
            case fullDate
            case duration
        }
        enum Others: String, CaseIterable, FieldItemTypeProtocol {
            case relation
            case toggle
            case barCode
        }
    }
}

public protocol FieldItemTypeProtocol {
    var rawValue: String { get }
}

extension FieldItemTypeProtocol {
    
}
