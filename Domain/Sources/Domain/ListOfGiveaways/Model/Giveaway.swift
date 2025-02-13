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
    public var isFavorite: Bool = false
    public let detailInformation: GiveawayDetailInformation
    private let image: String
    
    // MARK: - Life cycle
    public init(
        id: Int,
        title: String,
        description: String,
        platforms: String,
        image: String,
        users: Int,
        type: String,
        endDate: String,
        worth: String
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.detailInformation = .init(
            description: description,
            users: users,
            type: type,
            endDate: endDate,
            worth: worth,
            platforms: platforms
        )
    }
    
    // MARK: - Properties For View
    public var imageURL: URL {
        return URL(string: image) ?? URL(string: "www.placeholder.com")!
    }
}
