
//  ViewController.swift
//  DemoApp
//
//  Created by Socheat YUONG on 10/11/24.
//

import UIKit

// MARK: - UISearchResultsUpdating
extension ProductListViewController: UISearchResultsUpdating{
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
      isSearchActive = false
      filteredProducts = products
      collectionView.reloadData()
      return
    }
    isSearchActive = true
    filteredProducts = products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDataSource
extension ProductListViewController: UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return isSearchActive ? filteredProducts.count : products.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
    let product = isSearchActive ? filteredProducts[indexPath.item] : products[indexPath.item]
    cell.configure(with: product.name, price: product.price, rating: product.rating, image: product.image)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 15) / 2//items per row
    return CGSize(width: width, height: 200)
  }
  
}


// MARK: -UIViewController & UICollectionViewDelegateFlowLayout
class ProductListViewController: UIViewController, UICollectionViewDelegateFlowLayout{
  
  private var products = [Product]() // Array to hold all products
  private var filteredProducts = [Product]() // Array to hold filtered products for search
  private var isSearchActive = false // Track if search is active
  

  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 15
    layout.minimumLineSpacing = 15
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  private let searchController: UISearchController = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchBar.placeholder = "Search Products"
    searchController.obscuresBackgroundDuringPresentation = false
    return searchController
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupSearchController()
    collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    collectionView.delegate = self
    collectionView.dataSource = self
    
    // Sample product data
    products = [
      Product(name: "HONOR MacBook Art14", price: "$1500", rating: 4.7, image: UIImage(named: "Product1")),
      Product(name: "Gaming PC Desktop", price: "$2000", rating: 4.8, image: UIImage(named: "product2")),
      Product(name: "Keyboard and Mouse Combo", price: "$80", rating: 4.6, image: UIImage(named: "product3")),
      Product(name: "Gaming Controller", price: "$50", rating: 4.7, image: UIImage(named: "product4")),
      Product(name: "Sony WH-1000XM5", price: "$90", rating: 4.7, image: UIImage(named: "product5")),
      Product(name: "Microphone", price: "$500", rating: 4.7, image: UIImage(named: "product6")),
      Product(name: "HONOR Earbuds X6 ", price: "$50", rating: 4.7, image: UIImage(named: "product7")),
      Product(name: "Iphone 16Pro ", price: "$500", rating: 4.7, image: UIImage(named: "product8")),
      Product(name: "HONOR MacBook Art14", price: "$1500", rating: 4.7, image: UIImage(named: "Product1")),
      Product(name: "Gaming PC Desktop", price: "$2000", rating: 4.8, image: UIImage(named: "product2")),
      Product(name: "Keyboard and Mouse Combo", price: "$80", rating: 4.6, image: UIImage(named: "product3")),
      Product(name: "Gaming Controller", price: "$50", rating: 4.7, image: UIImage(named: "product4")),
      Product(name: "Sony WH-1000XM5", price: "$90", rating: 4.7, image: UIImage(named: "product5")),
      Product(name: "Microphone", price: "$500", rating: 4.7, image: UIImage(named: "product6")),
      Product(name: "HONOR Earbuds X6 ", price: "$50", rating: 4.7, image: UIImage(named: "product7")),
      Product(name: "Iphone 16Pro ", price: "$500", rating: 4.7, image: UIImage(named: "product8")),
    ]
    
    filteredProducts = products // Initial display is all products
    
  }

  struct Productex {
    let name: String
    let price: String
    let rating: Double
    let image: UIImage?
    let description: String
    let category: String
    let stock: Int
  }
  
  static let dataProduct: [Productex] = [
    
    Productex(
      name: "HONOR MacBook Art14",
      price: "$1500",
      rating: 4.7,
      image: UIImage(named: "Product1"),
      description: "A lightweight laptop with advanced performance for creators and professionals.",
      category: "Laptops",
      stock: 12
    ),
    Productex(
      name: "Gaming PC Desktop",
      price: "$2000",
      rating: 4.8,
      image: UIImage(named: "product2"),
      description: "High-performance gaming desktop for immersive gaming experiences.",
      category: "Computers",
      stock: 8
    ),
    Productex(
      name: "Keyboard and Mouse Combo",
      price: "$80",
      rating: 4.6,
      image: UIImage(named: "product3"),
      description: "Ergonomic keyboard and precision mouse combo for efficient productivity.",
      category: "Accessories",
      stock: 25
    ),
    Productex(
      name: "Gaming Controller",
      price: "$50",
      rating: 4.7,
      image: UIImage(named: "product4"),
      description: "Wireless controller with customizable buttons for pro gamers.",
      category: "Gaming Accessories",
      stock: 30
    ),
    Productex(
      name: "Sony WH-1000XM5",
      price: "$90",
      rating: 4.7,
      image: UIImage(named: "product5"),
      description: "Noise-cancelling headphones with exceptional sound quality.",
      category: "Audio",
      stock: 15
    ),
    Productex(
      name: "Microphone",
      price: "$500",
      rating: 4.7,
      image: UIImage(named: "product6"),
      description: "Professional studio microphone for podcasting and recording.",
      category: "Audio Equipment",
      stock: 10
    ),
    Productex(
      name: "HONOR Earbuds X6",
      price: "$50",
      rating: 4.7,
      image: UIImage(named: "product7"),
      description: "Compact earbuds with long battery life and rich sound quality.",
      category: "Audio",
      stock: 40
    ),
    Productex(
      name: "iPhone 16 Pro",
      price: "$500",
      rating: 4.7,
      image: UIImage(named: "product8"),
      description: "The latest iPhone with cutting-edge features and performance.",
      category: "Mobile Phones",
      stock: 20
    )
  ]

  
  private func setupUI() {
    title = "KILOTESE-Shop"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .bold)
    ]
    
    view.backgroundColor = .white
    // Add collectionView to the view
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func setupSearchController() {
    searchController.searchResultsUpdater = self
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
}


// Model to represent a Product
struct Product {
  let name: String
  let price: String
  let rating: Double
  let image: UIImage?
}



class ProductCell: UICollectionViewCell {
  static let identifier = "ProductCell"
  
  private let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 8
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    label.numberOfLines = 1
    return label
  }()
  
  private let priceLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .bold)
    label.textColor = .systemBlue
    return label
  }()
  
  private let ratingLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .systemGray
    return label
  }()
  
  private let addButton: UIButton = {
    let button = UIButton()
    button.setTitle("Add", for: .normal)
    button.backgroundColor = .systemYellow
    button.layer.cornerRadius = 12
    button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  //
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.layer.cornerRadius = 8
    contentView.layer.borderWidth = 0.5
    contentView.layer.borderColor = UIColor.lightGray.cgColor
    contentView.backgroundColor = .white
    
    contentView.addSubview(productImageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(ratingLabel)
    contentView.addSubview(addButton)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupConstraints() {
    productImageView.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    ratingLabel.translatesAutoresizingMaskIntoConstraints = false
    addButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      productImageView.widthAnchor.constraint(equalToConstant: 100),
      productImageView.heightAnchor.constraint(equalToConstant: 80),
      
      titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      
      priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
      priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      
      ratingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 2),
      ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      
      addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      addButton.widthAnchor.constraint(equalToConstant: 50),
      addButton.heightAnchor.constraint(equalToConstant: 25)
    ])
  }
  
  func configure(with title: String, price: String, rating: Double, image: UIImage?) {
    titleLabel.text = title
    priceLabel.text = price
    ratingLabel.text = "⭐ \(rating)"
    productImageView.image = image
  }
}
