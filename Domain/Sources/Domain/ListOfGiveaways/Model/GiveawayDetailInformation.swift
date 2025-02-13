//
//  GiveawayDetailInformation.swift
//  Domain
//
//  Created by ali alaa on 13/02/2025.
//

import Foundation

public struct GiveawayDetailInformation: Sendable, Equatable, Hashable {
    public let description: String
    public let users: Int
    public let type: String
    public let endDate: String
    public let worth: String
    public let platforms: String
}
