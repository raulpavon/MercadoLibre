//
//  MeLiCoordinator.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation
import UIKit

class MeLiCoordinator {
    
    var navigationController: UINavigationController
    private let factory =  MeLiFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productSearchViewController = factory.makeProductSearchViewController(meLiCoordinator: self)
        navigationController.setViewControllers([productSearchViewController], animated: false)
    }
    
    func openProductList(product: Product) {
        let productListViewController = factory.makeProductListViewController(meLiCoordinator: self, product: product)
        navigationController.pushViewController(productListViewController, animated: true)
    }
    
    func openProductDetail(product: Result) {
        let productListViewController = factory.makeProductDetailViewController(meLiCoordinator: self, product: product)
        navigationController.pushViewController(productListViewController, animated: true)
    }
}
