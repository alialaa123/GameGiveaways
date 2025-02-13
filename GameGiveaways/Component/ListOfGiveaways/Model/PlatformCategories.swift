//
//  PlatformCategories.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation

enum PlatformCategories: String, CaseIterable {
    case all
    case pc
    case steam
    case ios
    case android
    
    // MARK: - For URL
    var RequestPlatformForURL: String? {
        switch self {
        case .all:
            return nil
        default:
            return self.rawValue
        }
    }
}
