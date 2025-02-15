//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import Moya

public actor NetworkManager: NetworkProvider {
    // MARK: - Properties
    private let provider: MoyaProvider<MultiTarget>
    public let baseURL: URL
    
    // MARK: - Life cycle
    public init(
        provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>(),
        baseURL: URL
    ) {
        self.provider = provider
        self.baseURL = baseURL
    }
    
    // MARK: - Method
    public func request<Request: APITarget>(_ requestEndPoint: Request) async throws -> Request.Response {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(MultiTarget(requestEndPoint)) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(Request.Response.self, from: response.data)
                        continuation.resume(returning: data)
                    } catch {
                        continuation.resume(throwing: MoyaError.objectMapping(error, response))
                    }
                case .failure(let error):
                    guard let errorResponse = error.response else {
                        return continuation.resume(throwing: MoyaError.underlying(error, nil))
                    }
                    continuation.resume(throwing: MoyaError.statusCode(errorResponse))
                }
            }
        }
    }
}
