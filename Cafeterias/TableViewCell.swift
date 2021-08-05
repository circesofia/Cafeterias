//
//  TableViewCell.swift
//  Cafeterias
//
//  Created by erick eduardo on 31/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var cafeName: UILabel!
    
    @IBOutlet weak var cafeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
