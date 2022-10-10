//
//  CameraViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate {

    // adding imageview
    let instaLogoIMAGE: UIImageView = {
        let imageVIEW = UIImageView()
        imageVIEW.translatesAutoresizingMaskIntoConstraints = false
        imageVIEW.contentMode = .scaleAspectFill
        imageVIEW.clipsToBounds  = true
        imageVIEW.image = UIImage(named: "image_placeholder")
        imageVIEW.isUserInteractionEnabled = true
        return imageVIEW
    }()
    
    @objc func didTapImage() {
        
    }
    
    // textfield
    let captionTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.layer.borderWidth = 1.0
        txtfield.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 230/255, alpha: 1).cgColor
        txtfield.layer.cornerRadius  = 3
        return txtfield
    }()
    
    // button
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonWasPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        addConstraints()
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        instaLogoIMAGE.addGestureRecognizer(tapgesture)
    }
    
    private func addViews() {
        view.addSubview(instaLogoIMAGE)
        view.addSubview(captionTextField)
        view.addSubview(submitButton)
        
    }
    
    
    @objc private func submitButtonWasPressed() {
        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            instaLogoIMAGE.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            instaLogoIMAGE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            instaLogoIMAGE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
            
        ])
        
        NSLayoutConstraint.activate([
            captionTextField.topAnchor.constraint(equalTo: instaLogoIMAGE.bottomAnchor, constant: 10),
            captionTextField.leadingAnchor.constraint(equalTo: instaLogoIMAGE.leadingAnchor),
            captionTextField.trailingAnchor.constraint(equalTo: instaLogoIMAGE.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: captionTextField.bottomAnchor, constant: 10)
        ])
        
        
        
        
    }
    


}
