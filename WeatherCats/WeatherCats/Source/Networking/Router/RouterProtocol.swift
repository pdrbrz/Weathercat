//
//  RouterProtocol.swift
//  NetworkLayer
//
//  Created by Pedro Braz on 01/05/21.
//

import Foundation

protocol RouterProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
}
