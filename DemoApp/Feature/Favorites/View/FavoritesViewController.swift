//
//  FavoritesViewController.swift
//  DemoApp
//
//  Created by Socheat YUONG on 13/11/24.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   let itemImageView = UIImageView()
    // Sample Data
    let items = [
      ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
      ("HONOR Watch", "Price $500", "($500)", UIImage(named: "product2")),
      ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
      ("HONOR Watch", "Price $500", "($500)", UIImage(named: "product2")),
      ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
      ("HONOR Watch", "Price $500", "($500)", UIImage(named: "product2")),
      ("HONOR MacBook Art14", "Price $1500", "($1500)", UIImage(named: "Product1")),
      ("HONOR Watch", "Price $500", "($500)", UIImage(named: "product2")),
      
    ]
    
    // TableView
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // "Add All To Cart" Button
    let addAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add All To Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favourite"
        
      // Set up TableView
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(CartItemCell.self, forCellReuseIdentifier: "items")
      tableView.separatorStyle = .none
        
      // Add Subviews
        view.addSubview(tableView)
        view.addSubview(addAllButton)
        
        // Setup TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Layout Constraints
        setupConstraints()
    }
    
    func setupConstraints() {
        // TableView Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addAllButton.topAnchor, constant: -10)
        ])
        
        // AddAllButton Constraints
        NSLayoutConstraint.activate([
            addAllButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addAllButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addAllButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
      let item = items[indexPath.row]

      // Configure cell text and details
      cell.textLabel?.text = item.0
      cell.detailTextLabel?.text = item.1

      // Assign image dynamically from the array
      cell.imageView?.image = item.3 // item.3 contains the UIImage

      // Add accessory type
      cell.accessoryType = .disclosureIndicator

      return cell
  }


}
