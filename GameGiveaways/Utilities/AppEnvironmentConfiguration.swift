//
//  AppUtilities.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation

enum AppEnvironmentConfiguration {
    // MARK: - App Environment Cases
    case development
}

extension AppEnvironmentConfiguration {
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://www.gamerpower.com/api")!
        }
    }
}
