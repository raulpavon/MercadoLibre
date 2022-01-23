//
//  MeLiRepository.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation
import UIKit

class MeLiRepository {
    
    enum MeLiRepositoryURL {
        static let meLiURL = "https://api.mercadolibre.com/sites/MLA/search?q="
    }
    
    enum HttpMethod {
        static let get = "GET"
    }
    
    func getProducts(text: String, _ completionHandler: @escaping (Product) -> Void) {
        if let requestURL = URL(string: "\(MeLiRepositoryURL.meLiURL)\(text)") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = HttpMethod.get
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching products: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(Product.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error decoding products: \(error)")
                    return
                }
            }.resume()
        }
    }
}
