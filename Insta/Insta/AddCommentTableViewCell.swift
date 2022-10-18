//
//  AddCommentTableViewCell.swift
//  Insta
//
//  Created by Angel Zambrano on 10/14/22.
//

import UIKit

class AddCommentTableViewCell: UITableViewCell {
     
    
    static let identifier = "AddCommentTableViewCell"
    
    private let lbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Add Comment"
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        addViews()
        addConstraints()
    }
    
    
    private func addViews() {
        contentView.addSubview(lbl)
    }
    private func addConstraints() {
        NSLayoutConstraint.activate([
            lbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
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
