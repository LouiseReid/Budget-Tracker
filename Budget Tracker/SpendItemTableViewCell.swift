//
//  SpendItemTableViewCell.swift
//  Budget Tracker
//
//  Created by Louise Reid on 18/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import UIKit

class SpendItemTableViewCell: UITableViewCell {

  @IBOutlet weak var spendValueText: UILabel!
  @IBOutlet weak var spendDescriptionText: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
