//
//  TrendingCell.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 02/08/2022.
//

import UIKit
import SDWebImage

class TrendingCell: UITableViewCell {
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var detailSV: UIStackView!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    var identifier = "TrendingCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    var item :Item! {
        
        didSet {
            
            profileImg.sd_setImage(with: URL(string: item.owner.avatarUrl),placeholderImage:UIImage(named: "user"))
            nameLbl.text = item.defaultBranch
            titleLbl.text = item.fullName
            if let lang = item.language {
                detailSV.isHidden = false
                langLbl.text = lang
            }else {
                detailSV.isHidden = true
            }
            descriptionLbl.text = item.description
            descriptionLbl.numberOfLines = 10
            startLbl.text = item.stargazersCount.description
            
            
            
        }
    }
   
    
}
