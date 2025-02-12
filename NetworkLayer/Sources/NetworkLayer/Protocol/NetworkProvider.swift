//
//  NetworkProvider.swift
//  NetworkLayer
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import Moya

public protocol NetworkProvider {
    var baseURL: URL { get }
    func request<Request: APITarget>(_ requestEndPoint: Request) async throws -> Request.Response
}
