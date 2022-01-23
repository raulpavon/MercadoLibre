//
//  ProductDetailUIView.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

class ProductDetailUIView: UIView {
    
    enum ProductDetailUIViewConstraints {
        enum lbProductName {
            static let fontSize: CGFloat = 22
            static let leading: CGFloat = 10
            static let trailing: CGFloat = -10
        }
        enum lbPrice {
            static let fontSize: CGFloat = 36
            static let top: CGFloat = 10
        }
        enum lbAttribute {
            static let fontSize: CGFloat = 14
            static let top: CGFloat = 30
            static let leading: CGFloat = 10
            static let trailing: CGFloat = 10
            static let bottom: CGFloat = -15
        }
        enum imgProduct {
            static let top: CGFloat = 15
            static let leading: CGFloat = 10
            static let width: CGFloat = 200
            static let height: CGFloat = 200
        }
        enum separatorView {
            static let height: CGFloat = 2
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let top: CGFloat = 30
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.grayMeLi)
        return view
    }()
    
    private lazy var lbProductName: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: GlobalConstants.Font.proximaNovaBold, size: ProductDetailUIViewConstraints.lbProductName.fontSize)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let imgProduct: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lbPrice: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: GlobalConstants.Font.proximaNova, size: ProductDetailUIViewConstraints.lbProductName.fontSize)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var lbAttribute: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: GlobalConstants.Font.proximaNovaBold, size: ProductDetailUIViewConstraints.lbAttribute.fontSize)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.delaysContentTouches = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
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
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(lbProductName)
        containerView.addSubview(imgProduct)
        containerView.addSubview(lbPrice)
        containerView.addSubview(separatorView)
        containerView.addSubview(lbAttribute)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            imgProduct.topAnchor.constraint(equalTo: containerView.topAnchor, constant: ProductDetailUIViewConstraints.imgProduct.top),
            imgProduct.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ProductDetailUIViewConstraints.imgProduct.leading),
            imgProduct.widthAnchor.constraint(equalToConstant: ProductDetailUIViewConstraints.imgProduct.width),
            
            lbProductName.leadingAnchor.constraint(equalTo: imgProduct.trailingAnchor, constant: ProductDetailUIViewConstraints.lbProductName.leading),
            lbProductName.topAnchor.constraint(equalTo: imgProduct.topAnchor),
            lbProductName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: ProductDetailUIViewConstraints.lbProductName.trailing),
            
            lbPrice.topAnchor.constraint(equalTo: lbProductName.bottomAnchor, constant: ProductDetailUIViewConstraints.lbPrice.top),
            lbPrice.leadingAnchor.constraint(equalTo: lbProductName.leadingAnchor),
            
            separatorView.topAnchor.constraint(equalTo: imgProduct.bottomAnchor, constant: ProductDetailUIViewConstraints.separatorView.top),
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ProductDetailUIViewConstraints.separatorView.leading),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: ProductDetailUIViewConstraints.separatorView.trailing),
            separatorView.heightAnchor.constraint(equalToConstant: ProductDetailUIViewConstraints.separatorView.height),

            lbAttribute.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: ProductDetailUIViewConstraints.lbAttribute.top),
            lbAttribute.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ProductDetailUIViewConstraints.lbAttribute.leading),
            lbAttribute.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: ProductDetailUIViewConstraints.lbAttribute.trailing),
            lbAttribute.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: ProductDetailUIViewConstraints.lbAttribute.bottom)
            
        ])
    }
    
    func setProductDetail(product: Result) {
        imgProduct.image = UIImage.getImageFromURL(imageString: product.thumbnail)?.scalePreservingAspectRatio(targetSize: CGSize(width: ProductDetailUIViewConstraints.imgProduct.width, height: ProductDetailUIViewConstraints.imgProduct.height))
        lbProductName.text = "\(product.title)"
        lbPrice.text = "$ \(product.priceFormatted)"
        setAttribute(attributes: product.attributes)
    }
    
    private func setAttribute(attributes: [Attribute]) {
        var label = GlobalConstants.MeLiApp.labelDetail
        for item in attributes {
            label += "\(GlobalConstants.MeLiApp.bullet) \(item.name): \(item.valueName ?? "")\n"
        }
        lbAttribute.text = "\(label)"
    }
}
