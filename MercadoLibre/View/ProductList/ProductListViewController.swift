//
//  ProductListViewController.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

class ProductListViewController: UIViewController {
    
    weak var meLiCoordinator: MeLiCoordinator?
    private let factory: MeLiFactory
    private var product: Product
    
    private lazy var productListUIView: ProductListUIView = {
        let view = ProductListUIView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: MeLiFactory, meLiCoordinator: MeLiCoordinator, product: Product) {
        self.factory = factory
        self.meLiCoordinator = meLiCoordinator
        self.product = product
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
        setNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setNavBar() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(hex: GlobalConstants.Colors.yellowMeLi)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor(hex: GlobalConstants.Colors.yellowMeLi)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
        self.title = GlobalConstants.MeLiApp.title
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: GlobalConstants.Images.back), style: .plain, target: self, action: #selector(backPressed))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        productListUIView.products = product
    }
    
    private func addComponents() {
        view.addSubview(productListUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            productListUIView.topAnchor.constraint(equalTo: view.topAnchor),
            productListUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productListUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productListUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func backPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ProductListViewController: ProductListUIViewDelegate {
    func getProductDetail(product: Result) {
        meLiCoordinator?.openProductDetail(product: product)
    }
}
