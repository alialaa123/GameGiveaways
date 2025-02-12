//
//  Giveaway.swift
//  Domain
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation

public struct Giveaway: Sendable, Equatable, Hashable {
    // MARK: - Properties
    public let id: Int
    public let title: String
    
    // MARK: - Life cycle
    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
