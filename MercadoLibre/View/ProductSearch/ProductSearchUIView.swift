//
//  ProductSearchUIView.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

protocol ProductSearchUIViewDelegate: AnyObject {
    func getProductList(text: String)
}

class ProductSearchUIView: UIView {
    
    enum ProductSearchUIViewConstraints {
        enum searcBar {
            static let fonSize: CGFloat = 14
            static let cornerRadius: CGFloat = 20
            static let width: CGFloat = 200
            static let height: CGFloat = 40
            
        }
        enum imgLogo {
            static let width: CGFloat = 150
            static let centerY: CGFloat = -100
        }
    }
    
    weak var delegate: ProductSearchUIViewDelegate?
    var product: Product?
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.yellowMeLi)
        return view
    }()
    
    private let imgLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.meLiLogo))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        let textFieldInsideUISearchbar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchbar?.textColor = UIColor(hex: GlobalConstants.Colors.grayMeLi)
        textFieldInsideUISearchbar?.backgroundColor = .white
        textFieldInsideUISearchbar?.font = UIFont(name: GlobalConstants.Font.proximaNova, size: ProductSearchUIViewConstraints.searcBar.fonSize)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = GlobalConstants.MeLiApp.searchBarPlaceholder
        searchBar.layer.cornerRadius = ProductSearchUIViewConstraints.searcBar.cornerRadius
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        searchBar.keyboardType = .alphabet
        return searchBar
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
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(backgroundView)
        backgroundView.addSubview(imgLogo)
        backgroundView.addSubview(searchBar)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            
            imgLogo.widthAnchor.constraint(equalToConstant: ProductSearchUIViewConstraints.imgLogo.width),
            imgLogo.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor, constant: ProductSearchUIViewConstraints.imgLogo.centerY),
            imgLogo.centerXAnchor.constraint(equalTo: searchBar.centerXAnchor),
            
            searchBar.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            searchBar.widthAnchor.constraint(equalToConstant: ProductSearchUIViewConstraints.searcBar.width),
            searchBar.heightAnchor.constraint(equalToConstant: ProductSearchUIViewConstraints.searcBar.height),
        ])
    }
}

extension ProductSearchUIView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.getProductList(text: searchBar.text ?? "")
    }
}
