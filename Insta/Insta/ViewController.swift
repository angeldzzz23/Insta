//
//  ViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK:
    // image
    let instaLogoIMAGE: UIImageView = {
        let imageVIEW = UIImageView()
        imageVIEW.translatesAutoresizingMaskIntoConstraints = false
        imageVIEW.contentMode = .scaleAspectFill
        imageVIEW.image = UIImage(named: "instagram_logo")
        return imageVIEW
    }()
    
    // username
    // username label
    let usernameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "username"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    // username textfield
    
    let Usernametextfield: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.layer.borderWidth = 1.0
        txtfield.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 230/255, alpha: 1).cgColor
        txtfield.layer.cornerRadius  = 3
        return txtfield
    }()
    
    //password lbl
    let passWordLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "password"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    
    
    //password textfield
    let passWordtextfield: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.layer.borderWidth = 1.0
        txtfield.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 230/255, alpha: 1).cgColor
        txtfield.layer.cornerRadius  = 3
        return txtfield
    }()
    
    let LoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        return button
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addView()
        addConstraints()
    }
    
    
    // MARK: Helper functions
    private func addView() {
        view.addSubview(instaLogoIMAGE)
        view.addSubview(usernameLbl)
        view.addSubview(Usernametextfield)
        view.addSubview(passWordLbl)
        view.addSubview(passWordtextfield)
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            instaLogoIMAGE.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            instaLogoIMAGE.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            usernameLbl.topAnchor.constraint(equalTo: instaLogoIMAGE.bottomAnchor, constant: 10),
            usernameLbl.leadingAnchor.constraint(equalTo: instaLogoIMAGE.leadingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            Usernametextfield.leadingAnchor.constraint(equalTo: usernameLbl.leadingAnchor),
            Usernametextfield.trailingAnchor.constraint(equalTo: instaLogoIMAGE.trailingAnchor),
            Usernametextfield.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor, constant: 5),
            Usernametextfield.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate( [
            passWordLbl.topAnchor.constraint(equalTo: Usernametextfield.bottomAnchor, constant: 10),
            passWordLbl.leadingAnchor.constraint(equalTo: usernameLbl.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passWordtextfield.leadingAnchor.constraint(equalTo: passWordLbl.leadingAnchor),
            passWordtextfield.trailingAnchor.constraint(equalTo: Usernametextfield.trailingAnchor),
            passWordtextfield.topAnchor.constraint(equalTo: passWordLbl.bottomAnchor, constant: 5),
            passWordtextfield.heightAnchor.constraint(equalToConstant: 30)
        ])
 
    }
    
    // login in user
    private @objc func loginButtonWasPressed() {
        
    }


}

