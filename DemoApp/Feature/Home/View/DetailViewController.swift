//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Socheat YUONG on 25/11/24.
//


import UIKit

class ProductDetailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
  }
  
  func setupUI() {
    // Product Image
    let productImageView = UIImageView()
    productImageView.image = UIImage(named: "product5") // Replace with your image name
    productImageView.contentMode = .scaleAspectFit
    productImageView.translatesAutoresizingMaskIntoConstraints = false
    
    // Product Title
    let productTitleLabel = UILabel()
    productTitleLabel.text = "Sony WH-1000XM5"
    productTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    // Price Label
    let priceLabel = UILabel()
    priceLabel.text = "$90"
    priceLabel.textColor = .systemOrange
    priceLabel.font = UIFont.boldSystemFont(ofSize: 50)
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    
    // Tax Info Label
    let taxInfoLabel = UILabel()
    taxInfoLabel.text = "Including taxes and duties"
    taxInfoLabel.textColor = .gray
    taxInfoLabel.font = UIFont.systemFont(ofSize: 14    )
    taxInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    
    // Rating View
    let ratingLabel = UILabel()
    ratingLabel.text = "⭐ 4.8 (231)"
    ratingLabel.font = UIFont.systemFont(ofSize: 16)
    ratingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    // Color Options
    let colorOptionsStack = UIStackView()
    colorOptionsStack.axis = .horizontal
    colorOptionsStack.spacing = 10
    colorOptionsStack.translatesAutoresizingMaskIntoConstraints = false
    for color in [UIColor.black, UIColor.lightGray, UIColor.systemRed] {
    let colorCircle = UIView()
      colorCircle.backgroundColor = color
      colorCircle.layer.cornerRadius = 15
      colorCircle.layer.borderWidth = 1
      colorCircle.layer.borderColor = UIColor.gray.cgColor
      colorCircle.translatesAutoresizingMaskIntoConstraints = false
      colorCircle.heightAnchor.constraint(equalToConstant: 30).isActive = true
      colorCircle.widthAnchor.constraint(equalToConstant: 30).isActive = true
      colorOptionsStack.addArrangedSubview(colorCircle)
    }
    
    // Buttons
    let addToCartButton = UIButton()
    addToCartButton.setTitle("Add to cart", for: .normal)
    addToCartButton.backgroundColor = .black
    addToCartButton.setTitleColor(.white, for: .normal)
    addToCartButton.layer.cornerRadius = 10
    addToCartButton.translatesAutoresizingMaskIntoConstraints = false
    
    let buyNowButton = UIButton()
    buyNowButton.setTitle("Buy Now", for: .normal)
    buyNowButton.backgroundColor = .systemOrange
    buyNowButton.setTitleColor(.white, for: .normal)
    buyNowButton.layer.cornerRadius = 10
    buyNowButton.translatesAutoresizingMaskIntoConstraints = false
    
    // Stack View for Buttons
    let buttonStack = UIStackView(arrangedSubviews: [addToCartButton, buyNowButton])
    buttonStack.axis = .horizontal
    buttonStack.spacing = 10
    buttonStack.distribution = .fillEqually
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    
    // Adding Views
    view.addSubview(productImageView)
    view.addSubview(productTitleLabel)
    view.addSubview(priceLabel)
    view.addSubview(taxInfoLabel)
    view.addSubview(ratingLabel)
    view.addSubview(colorOptionsStack)
    view.addSubview(buttonStack)
    
    // Constraints
    NSLayoutConstraint.activate([
      // Product Image
      productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      productImageView.heightAnchor.constraint(equalToConstant: 200),
      productImageView.widthAnchor.constraint(equalToConstant: 200),
      
      // Product Title
      productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
      productTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // Price Label
      priceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 10),
      priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // Tax Info Label
      taxInfoLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
      taxInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // Rating Label
      ratingLabel.topAnchor.constraint(equalTo: taxInfoLabel.bottomAnchor, constant: 15),
      ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // Color Options
      colorOptionsStack.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20),
      colorOptionsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // Button Stack
      buttonStack.topAnchor.constraint(equalTo: colorOptionsStack.bottomAnchor, constant: 30),
      buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      buttonStack.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}


