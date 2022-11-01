//
//  SepetHucreTableViewCell.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 26.10.2022.
//

import UIKit

class SepetHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetImageView: UIImageView!
    @IBOutlet weak var sepetYemekIsım: UILabel!
    @IBOutlet weak var sepetYemekFiyat: UILabel!
    @IBOutlet weak var sepetYemekYildiz: UILabel!
    @IBOutlet weak var yemekAdet: UILabel!
    @IBOutlet weak var sepetArkaPlan: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sepetYemekSil(_ sender: Any) {
    }
}
