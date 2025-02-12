//
//  APITarget.swift
//  NetworkLayer
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import Moya

public protocol APITarget: TargetType, Sendable {
    associatedtype Response: Decodable & Sendable
    
    var path: String { get }
    var method: Moya.Method { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

public extension APITarget {
    var methods: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return ["Content-Type" : "application/json"]
    }
}
