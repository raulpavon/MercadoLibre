//
//  ProductSearchViewController.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

class ProductSearchViewController: UIViewController {
    
    weak var meLiCoordinator: MeLiCoordinator?
    private let factory: MeLiFactory
    
    private lazy var productSearchUIView: ProductSearchUIView = {
        let view = ProductSearchUIView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewModel: ProductViewModel = {
        factory.makeProductViewModel(view: self, repository: factory.makeProductRepository())
    }()
    
    required init(factory: MeLiFactory, meLiCoordinator: MeLiCoordinator) {
        self.factory = factory
        self.meLiCoordinator = meLiCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        productSearchUIView.searchBar.text = ""
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        view.addSubview(productSearchUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            productSearchUIView.topAnchor.constraint(equalTo: view.topAnchor),
            productSearchUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productSearchUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productSearchUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProductSearchViewController: ProductSearchUIViewDelegate {
    func getProductList(text: String) {
        viewModel.getProductList(text: text)
    }
}

extension ProductSearchViewController: ProductView {
    func goToProductList(product: Product) {
        DispatchQueue.main.async {
            self.meLiCoordinator?.openProductList(product: product)
        }
    }
}
