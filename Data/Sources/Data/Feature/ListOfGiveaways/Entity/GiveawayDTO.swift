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
    public let image: String?
    public let description: String?
    public let platforms: String?
    public let users: Int?
    public let type: String?
    public let endDate: String?
    public let worth: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, platforms, users, type, worth
        case endDate = "end_date"
    }
    
    // MARK: - Method Convert to `Domain`
    func toDomain() -> Giveaway {
        Giveaway(
            id: id,
            title: title ?? "",
            description: description ?? "",
            platforms: platforms ?? "",
            image: image ?? "",
            users: users ?? 0,
            type: type ?? "",
            endDate: endDate ?? "",
            worth: worth ?? ""
        )
    }
}
