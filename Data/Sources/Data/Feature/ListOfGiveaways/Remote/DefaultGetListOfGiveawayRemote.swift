//
//  DefaultGetListOfGiveawayRemote.swift
//  Data
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import NetworkLayer
import Moya
import Domain

public final class DefaultGetListOfGiveawayRemote: ListOfGiveawayRepository {
    // MARK: - Properties
    private let networkClient: NetworkProvider
    
    // MARK: - Life cycle
    public init(networkClient: NetworkProvider) {
        self.networkClient = networkClient
    }
    
    // MARK: - Methods
    public func getListOfGiveaways(with platform: String?) async throws -> [Giveaway] {
        let requestBuilder = EndpointConfiguration<[GiveawayDTO]>(baseURL: networkClient.baseURL)
            .path("/giveaways")
            .method(.get)
            .task(
                .requestParameters(
                    parameters: ["platform": (platform ?? "")],
                    encoding: URLEncoding.default
                )
            )
        let response = try await networkClient.request(requestBuilder)
        return response.map { $0.toDomain() }
    }
}

