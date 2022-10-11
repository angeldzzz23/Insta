//
//  PostCellTableViewCell.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit
import Parse

class PostCellTableViewCell: UITableViewCell {
    
    static let identifier = "PostCellTableViewCell"

    
    // add post image
    let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    
    // \,  height of image 344
    
    // add post name
    
    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "@Angelzzz23"
        return lbl
    }()
    
    // add post caption
    let postCaptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "This is my first post!"
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addToContentView()
        setConstraints()
    }
    
    private func addToContentView() {
        contentView.addSubview(postImage)
        contentView.addSubview(lblName)
        contentView.addSubview(postCaptionLbl)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postImage.heightAnchor.constraint(equalToConstant: 344)
        ])
        
        NSLayoutConstraint.activate([
            lblName.leadingAnchor.constraint(equalTo: postImage.leadingAnchor),
            lblName.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            postCaptionLbl.centerYAnchor.constraint(equalTo: lblName.centerYAnchor),
            postCaptionLbl.leadingAnchor.constraint(equalTo: lblName.trailingAnchor, constant: 10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
