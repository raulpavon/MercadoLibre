//
//  ProductTableViewCell.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    enum ProductTableViewCellConstraints {
        enum lbProductName {
            static let fontSize: CGFloat = 20
            static let top: CGFloat = 15
            static let leading: CGFloat = 10
            static let trailing: CGFloat = -20
        }
        enum lbProductPrice {
            static let fontSize: CGFloat = 24
            static let top: CGFloat = 5
            static let leading: CGFloat = 10
            static let bottom: CGFloat = -15
            static let trailing: CGFloat = -20
        }
        enum imgProduct {
            static let top: CGFloat = 5
            static let leading: CGFloat = 20
            static let bottom: CGFloat = -5
            static let width: CGFloat = 80
            static let height: CGFloat = 80
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgProduct: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let lbProductName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: GlobalConstants.Font.proximaNova, size: ProductTableViewCellConstraints.lbProductName.fontSize)
        label.textColor = UIColor(hex: GlobalConstants.Colors.grayMeLi)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbProductPrice: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: GlobalConstants.Font.proximaNova, size: ProductTableViewCellConstraints.lbProductPrice.fontSize)
        label.textColor = UIColor(hex: GlobalConstants.Colors.grayMeLi)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgProduct)
        mainContainer.addSubview(lbProductName)
        mainContainer.addSubview(lbProductPrice)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgProduct.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor, constant: ProductTableViewCellConstraints.imgProduct.top),
            imgProduct.leadingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.leadingAnchor, constant: ProductTableViewCellConstraints.imgProduct.leading),
            imgProduct.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: ProductTableViewCellConstraints.imgProduct.bottom),
            imgProduct.widthAnchor.constraint(equalToConstant: ProductTableViewCellConstraints.imgProduct.width),
            
            lbProductName.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: ProductTableViewCellConstraints.lbProductName.top),
            lbProductName.leadingAnchor.constraint(equalTo: imgProduct.trailingAnchor, constant: ProductTableViewCellConstraints.lbProductName.leading),
            lbProductName.trailingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.trailingAnchor, constant: ProductTableViewCellConstraints.lbProductName.trailing),
            
            lbProductPrice.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: ProductTableViewCellConstraints.lbProductPrice.bottom),
            lbProductPrice.leadingAnchor.constraint(equalTo: imgProduct.trailingAnchor, constant: ProductTableViewCellConstraints.lbProductPrice.leading),
            lbProductPrice.topAnchor.constraint(equalTo: lbProductName.bottomAnchor, constant: ProductTableViewCellConstraints.lbProductPrice.top),
            lbProductPrice.trailingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.trailingAnchor, constant: ProductTableViewCellConstraints.lbProductPrice.trailing),
        ])
    }
    
    func fillProductInfo(product: Result) {
        imgProduct.image = UIImage.getImageFromURL(imageString: product.thumbnail)?.scalePreservingAspectRatio(targetSize: CGSize(width: ProductTableViewCellConstraints.imgProduct.width, height: ProductTableViewCellConstraints.imgProduct.height))
        lbProductName.text = product.title
        lbProductPrice.text = "$\(product.priceFormatted)"
    }
}
