//
//  GiveawayDTO.swift
//  Data
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import Domain

public struct GiveawayDTO: Decodable, Sendable {
    // MARK: - Properties
    public let id: Int
    public let title: String?
    
    // MARK: - Method Convert to `Domain`
    func toDomain() -> Giveaway {
        return .init(id: id, title: title ?? "")
    }
}
