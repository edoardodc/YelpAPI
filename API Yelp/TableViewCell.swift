//
//  TableViewCell.swift
//  API Yelp
//
//  Created by Edoardo de Cal on 22/01/2019.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelRating: UILabel!
    
    @IBOutlet weak var imageResturant: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var imageRating: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageResturant.layer.borderWidth = 3
        imageResturant.layer.masksToBounds = false
        imageResturant.layer.borderColor = UIColor.white.cgColor
        imageResturant.layer.cornerRadius = imageResturant.frame.height/2
        imageResturant.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
