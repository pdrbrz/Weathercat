//
//  ServiceLayer.swift
//  NetworkLayer
//
//  Created by Pedro Braz on 01/05/21.
//

import Foundation

class ServiceLayer {
    class func request<T: Codable>(networkRouter: RouterProtocol, completion: @escaping(Result<[String: [T]], Error>) -> ()) {
        var components = URLComponents()
        components.scheme = networkRouter.scheme
        components.host = networkRouter.host
        components.path = networkRouter.path
        components.queryItems = networkRouter.parameters
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = networkRouter.method.rawValue
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let errorData = error {
                completion(.failure(errorData))
                print(errorData.localizedDescription)
                return
            }
            
            guard response != nil, let data = data else {
                return
            }
            
            let responseObject = try! JSONDecoder().decode([String: [T]].self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
