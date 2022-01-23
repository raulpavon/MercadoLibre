//
//  ProductProtocols.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation

protocol ProductView: AnyObject {
    func goToProductList(product: Product)
}

protocol ProductViewModel {
    func getProductList(text: String)
}
