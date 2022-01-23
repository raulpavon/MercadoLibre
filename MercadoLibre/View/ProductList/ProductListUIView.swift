//
//  ProductListUIView.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

protocol ProductListUIViewDelegate: AnyObject {
    func getProductDetail(product: Result)
}

class ProductListUIView: UIView {
    
    var products = Product()
    weak var delegate: ProductListUIViewDelegate?
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableViewProduct: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setUp()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(tableViewProduct)
    }
    
    private func setUp() {
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableViewProduct.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            tableViewProduct.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            tableViewProduct.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            tableViewProduct.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
        ])
    }
}

extension ProductListUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.fillProductInfo(product: products.results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.getProductDetail(product: products.results[indexPath.row])
    }
}
