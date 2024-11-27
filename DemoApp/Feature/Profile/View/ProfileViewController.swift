//
//  ProfileViewController.swift
//  DemoApp
//
//  Created by Socheat YUONG on 13/11/24.
//

import UIKit

class ProfileViewController: UIViewController {

    // UI Elements
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
      imageView.image = UIImage (named: "profile") // Replace with your default profile image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "I'm Cheatz"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "yuongsocheat@gmail.com"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First name?"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last name?"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
  
  private let phoneTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "Phone number"
      textField.borderStyle = .roundedRect
      textField.keyboardType = .phonePad
      textField.translatesAutoresizingMaskIntoConstraints = false
      
      // Add an icon to the left side of the text field
      let iconImageView = UIImageView(image: UIImage(named: "Cambodia"))
      iconImageView.tintColor = .gray
      iconImageView.contentMode = .scaleAspectFit
      iconImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
      
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
      paddingView.addSubview(iconImageView)
      iconImageView.center = paddingView.center
      
      textField.leftView = paddingView
      textField.leftViewMode = .always
      
      return textField
  }()

    
    private let genderPicker: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Male", "Female", "Other"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    private let dobDatePicker: UIDatePicker    = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update Profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(phoneTextField)
        view.addSubview(genderPicker)
        view.addSubview(dobDatePicker)
        view.addSubview(updateButton)
        
        // Setup constraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Profile Image
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Name Label
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Email Label
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // First Name TextField
            firstNameTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Last Name TextField
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 15),
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Phone TextField
            phoneTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 15),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Gender Picker
            genderPicker.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 15),
            genderPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Date Picker
            dobDatePicker.topAnchor.constraint(equalTo: genderPicker.bottomAnchor, constant: 15),
            dobDatePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dobDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Update Button
            updateButton.topAnchor.constraint(equalTo: dobDatePicker.bottomAnchor, constant: 30),
            updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            updateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
