//
//  UserCell.swift
//  OTUSUIViewController
//
//  Created by Dmitry Chicherin on 16/5/2566 BE.
//

import UIKit


class UserCell: UITableViewCell {
    
    @IBOutlet weak var userSurnameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMiddleNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(withName: User) {
        userNameLabel.text = withName.name
        userSurnameLabel.text = withName.surname
        userMiddleNameLabel.text = withName.midname
    }
}


