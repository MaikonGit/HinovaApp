//
//  OficinasTableViewCell.swift
//  HinovaApp
//
//  Created by Maikon Ferreira on 02/02/22.
//

import UIKit

class OficinasTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeOficina: UILabel!
    @IBOutlet weak var descricaoOficina: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

