//
//  ProductDetailViewController.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

class ProductDetailViewController: UIViewController {

    weak var meLiCoordinator: MeLiCoordinator?
    private let factory: MeLiFactory
    private var product: Result
    
    private lazy var productDetailUIView: ProductDetailUIView = {
        let view = ProductDetailUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    required init(factory: MeLiFactory, movieCoordinator: MeLiCoordinator, product: Result) {
        self.factory = factory
        self.meLiCoordinator = movieCoordinator
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
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: GlobalConstants.Images.back), style: .plain, target: self, action: #selector(backPressed))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        initView()
    }
    
    private func addComponents() {
        view.addSubview(productDetailUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            productDetailUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productDetailUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productDetailUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productDetailUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func initView(){
        productDetailUIView.setProductDetail(product: product)
    }
    
    @objc private func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
