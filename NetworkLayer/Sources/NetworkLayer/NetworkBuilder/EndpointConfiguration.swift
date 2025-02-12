//
//  File.swift
//  NetworkLayer
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
@preconcurrency import Moya

public struct EndpointConfiguration<Response: Decodable & Sendable>: APITarget, Sendable {
    // MARK: - Properties
    public typealias Response = Response
    
    public var baseURL: URL
    public var path: String = ""
    public var method: Moya.Method = .get
    public var task: Task? = nil
    public var headers: [String: String]? = [:]
    
    // MARK: - Life cycle
    public init(
        baseURL: URL
    ) {
        self.baseURL = baseURL
    }
    
    // MARK: - Builder Methods
    public func baseURL(_ baseURL: URL) -> EndpointConfiguration {
        var config = self
        config.baseURL = baseURL
        return config
    }
    
    public func path(_ path: String) -> EndpointConfiguration {
        var config = self
        config.path = path
        return config
    }
    
    public func method(_ method: Moya.Method) -> EndpointConfiguration {
        var config = self
        config.method = method
        return config
    }
    
    public func task(_ task: Task) -> EndpointConfiguration {
        var config = self
        config.task = task
        return config
    }
    
    public func headers(_ headers: [String : String]?) -> EndpointConfiguration {
        var config = self
        config.headers = headers
        return config
    }
}
