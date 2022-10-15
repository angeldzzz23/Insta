//
//  AddCommentTableViewCell.swift
//  Insta
//
//  Created by Angel Zambrano on 10/14/22.
//

import UIKit

class AddCommentTableViewCell: UITableViewCell {
     
    
        static let identifier = "AddCommentTableViewCell"
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        contentView.backgroundColor = .yellow
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
