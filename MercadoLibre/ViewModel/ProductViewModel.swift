//
//  ProductViewModel.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation
import UIKit

class ProductViewModelImp: ProductViewModel {

    weak var view: ProductView?
    let meLiRepository: MeLiRepository
    private var product = Product()
    
    
    required init(view: ProductView, meLiRepository: MeLiRepository) {
        self.view = view
        self.meLiRepository = meLiRepository
    }
    
    func getProductList(text: String) {
        meLiRepository.getProducts(text: text) {
            [weak self] response in
            self?.product = response
            self?.view?.goToProductList(product: self?.product ?? Product())
        }
    }
}
