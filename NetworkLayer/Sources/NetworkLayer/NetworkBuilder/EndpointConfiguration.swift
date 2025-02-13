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
    public var task: Task = .requestPlain
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
    
    public func headers(_ headers: [String : String]?) -> EndpointConfiguration {
        var config = self
        config.headers = headers
        return config
    }
    
    public func queryParameters(_ parameters: [String: Any]) -> EndpointConfiguration {
        var config = self
        let validParameters = validateQueryParameters(for: parameters)
        
        config.task = .requestParameters(parameters: validParameters, encoding: URLEncoding.queryString)
        return config
    }
    
    private func validateQueryParameters(for parameters: [String: Any]) -> [String : String] {
        parameters.compactMapValues { value in
            if let stringValue = value as? String, !stringValue.isEmpty {
                return stringValue
            } else if let numberValue = value as? NSNumber {
                return numberValue.stringValue
            } else if let boolValue = value as? Bool {
                return boolValue ? "true" : "false"
            }
            return nil
        }
    }
}
