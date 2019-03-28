//
//  ContactsTableViewCell.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/27/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgPhoto.layer.masksToBounds = true
        imgPhoto.layer.cornerRadius = imgPhoto.frame.width / 2
        imgPhoto.layer.borderWidth = 1.2
        imgPhoto.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
