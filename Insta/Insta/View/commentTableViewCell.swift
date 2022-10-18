//
//  commentTableViewCell.swift
//  Insta
//
//  Created by Angel Zambrano on 10/14/22.
//

import UIKit

class commentTableViewCell: UITableViewCell {
    static let identifier = "commentTableViewCell"
    
    // username
    
    let usernamelbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "@ahaha"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    let commentLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Hi!"
        return lbl
    }()
    
    
    // setting properties
    // if they are nil, then show error text
    func settingProperties(username: String?, comment: String?) {
        
        usernamelbl.text  = username ?? "error"
        commentLbl.text = comment ?? "error"
        
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addToContentView()
        addConstraints()
    }
    
    
    private func addToContentView() {
        contentView.addSubview(usernamelbl)
        contentView.addSubview(commentLbl)
        
    }
    private func addConstraints() {
        NSLayoutConstraint.activate([
            usernamelbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            usernamelbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            commentLbl.centerYAnchor.constraint(equalTo: usernamelbl.centerYAnchor),
            commentLbl.leadingAnchor.constraint(equalTo: usernamelbl.trailingAnchor, constant: 10)
        ])
   
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
