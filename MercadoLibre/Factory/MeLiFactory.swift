//
//  MeLiFactory.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation

protocol MeLiFactory {
    func makeProductSearchViewController(meLiCoordinator: MeLiCoordinator) -> ProductSearchViewController
    func makeProductListViewController(meLiCoordinator: MeLiCoordinator, product: Product) -> ProductListViewController
    func makeProductDetailViewController(meLiCoordinator: MeLiCoordinator, product: Result) -> ProductDetailViewController
    func makeProductViewModel(view: ProductView, repository: MeLiRepository) -> ProductViewModel
    func makeProductRepository() -> MeLiRepository
}

class MeLiFactoryImp: MeLiFactory {

    func makeProductSearchViewController(meLiCoordinator: MeLiCoordinator) -> ProductSearchViewController {
        let productSearchViewController = ProductSearchViewController(factory: self, meLiCoordinator: meLiCoordinator)
        return productSearchViewController
    }
    
    func makeProductListViewController(meLiCoordinator: MeLiCoordinator, product: Product) -> ProductListViewController {
        let productListViewController = ProductListViewController(factory: self, meLiCoordinator: meLiCoordinator, product: product)
        return productListViewController
    }
    
    func makeProductDetailViewController(meLiCoordinator: MeLiCoordinator, product: Result) -> ProductDetailViewController {
        let productDetailViewController = ProductDetailViewController(factory: self, movieCoordinator: meLiCoordinator, product: product)
        return productDetailViewController
    }
    
    func makeProductViewModel(view: ProductView, repository: MeLiRepository) -> ProductViewModel {
        let viewModel = ProductViewModelImp(view: view, meLiRepository: repository)
        return viewModel
    }
    
    func makeProductRepository() -> MeLiRepository  {
        let repository = MeLiRepository()
        return repository
    }
}
