//
//  NetworkingHandler.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

import Foundation


class NetworkingHandler {
    static let instance = NetworkingHandler()
    func getDataFromAPi<T:Codable>(url:URL,resultType:T.Type,completion: @escaping Completion<T>) {
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
               return  completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            
            
            do {
                
                let encoder = JSONDecoder()
                encoder.keyDecodingStrategy = .convertFromSnakeCase
                let parse = try encoder.decode(T.self, from: data)
                
                completion(.success(parse))
            }
            catch  let error {
                
                completion(.failure(error))
                
            }
        }.resume()
        
    }
    
}
