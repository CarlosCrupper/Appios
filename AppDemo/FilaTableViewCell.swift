//
//  FilaTableViewCell.swift
//  AppDemo
//
//  Created by adminisitradorUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

class FilaTableViewCell: UITableViewCell {

    @IBOutlet weak var lbIzquierda: UILabel!
    @IBOutlet weak var lbDerecha: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
