//
//  YemeklerHucre.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 19.10.2022.
//

import UIKit

class YemeklerHucre: UITableViewCell {
    
    
    @IBOutlet weak var yemeklerImageView: UIImageView!
    @IBOutlet weak var yemekIsımLabel: UILabel!
    @IBOutlet weak var yemeklerArkaPlan: UIView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekYildizLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
