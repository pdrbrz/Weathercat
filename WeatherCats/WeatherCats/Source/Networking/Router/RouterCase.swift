//
//  RouterCase.swift
//  NetworkLayer
//
//  Created by Pedro Braz on 01/05/21.
//

import Foundation

enum Router: RouterProtocol {
    case getSourcers
    case getProductIds
    case getProductInfo
    
    var scheme: String {
        switch self {
        case .getSourcers, .getProductIds, .getProductInfo:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getSourcers, .getProductIds, .getProductInfo:
            return "shopicuit.myshopify.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSourcers:
            return "/admin/custom_collections.json"
        case .getProductIds:
            return "/admin/collects.json"
        case .getProductInfo:
            return "/admin/products.json"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getSourcers: return nil
        case .getProductIds: return nil
        case .getProductInfo: return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSourcers, .getProductIds, .getProductInfo:
            return .get
        }
    }
}
