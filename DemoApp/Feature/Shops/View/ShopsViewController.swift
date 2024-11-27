//
//  ShopsViewController.swift
//  DemoApp
//
//  Created by Socheat YUONG on 13/11/24.
//


import UIKit

class ShopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let checkoutButton = UIButton()
    let totalPriceLabel = UILabel()
    let deleteButton = UIButton()
  
    // Dummy data for cart items
    let cartItems = [
        ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
        ("Gaming PC Desktop", "Price $2000", "($2000)", UIImage(named: "product2")),
        ("Keyboard and Mouse Combo", "Price $80", "($80)", UIImage(named: "product3")),
        ("Gaming Controller", "Price $50", "($50)", UIImage(named: "product4")),
        ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
        ("Gaming PC Desktop", "Price $2000", "($2000)", UIImage(named: "product2")),
        ("Keyboard and Mouse Combo", "Price $80", "($80)", UIImage(named: "product3")),
        ("Gaming Controller", "Price $50", "($50)", UIImage(named: "product4")),
        
    ]

  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "May Cart"
        view.backgroundColor = .white
              
        // Set up TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartItemCell.self, forCellReuseIdentifier: "CartItemCell")
        tableView.separatorStyle = .none
        
        // Add subviews
        view.addSubview(tableView)
        view.addSubview(checkoutButton)
        view.addSubview(totalPriceLabel)
        
        setupLayout()
        setupCheckoutButton()
    }
    
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for TableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -10)
        ])
        
        // Constraints for Checkout Button
        NSLayoutConstraint.activate([
            checkoutButton.heightAnchor.constraint(equalToConstant: 50),
            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        // Constraints for Total Price Label
        NSLayoutConstraint.activate([
            totalPriceLabel.trailingAnchor.constraint(equalTo: checkoutButton.trailingAnchor),
            totalPriceLabel.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -10)
        ])
    }
    
    func setupCheckoutButton() {
        checkoutButton.backgroundColor = .systemBlue
        checkoutButton.layer.cornerRadius = 8
        checkoutButton.setTitle("Go to Checkout", for: .normal)
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        totalPriceLabel.text = "Total = $6000"
        totalPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        totalPriceLabel.textColor = .black
    }
    
    // MARK: - UITableView DataSource and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = cartItems[indexPath.row]
        cell.configure(with: item.0, details: item.1, price: item.2, image: item.3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class CartItemCell: UITableViewCell {
    
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let detailsLabel = UILabel()
    let priceLabel = UILabel()
    
    let quantityControl = UIStepper()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailsLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(quantityControl)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for Image View
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            itemImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Constraints for Title Label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8)
        ])
        
        // Constraints for Details Label
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            detailsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        // Constraints for Price Label
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        // Constraints for Quantity Control
        NSLayoutConstraint.activate([
            quantityControl.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 8),
            quantityControl.leadingAnchor.constraint(equalTo: detailsLabel.leadingAnchor),
            quantityControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with title: String, details: String, price: String, image: UIImage?) {
        titleLabel.text = title
        detailsLabel.text = details
        priceLabel.text = price
        itemImageView.image = image
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        detailsLabel.font = UIFont.systemFont(ofSize: 14)
        detailsLabel.textColor = .gray
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .black
        itemImageView.contentMode = .scaleAspectFit
    }
}


