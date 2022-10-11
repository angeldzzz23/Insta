//
//  PostCellTableViewCell.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {
    
    static let identifier = "PostCellTableViewCell"
    
    // add post image
    
    
    // \,  height of image 344
    
    // add post name
    
    // add post caption
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .green
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
