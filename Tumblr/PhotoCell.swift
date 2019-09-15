//
//  PhotoCell.swift
//  Tumblr
//
//  Created by Brett Stevenson on 9/11/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if (selected) {
            photoImageView.layer.backgroundColor = UIColor.black.cgColor
            photoImageView.layer.opacity = 0.9
        } else {
            photoImageView.layer.opacity = 1.0
        }
    }

}
