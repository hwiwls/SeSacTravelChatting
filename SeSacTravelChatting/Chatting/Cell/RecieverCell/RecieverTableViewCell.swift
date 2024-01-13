//
//  RecieverTableViewCell.swift
//  SeSacTravelChatting
//
//  Created by hwijinjeong on 1/14/24.
//

import UIKit

class RecieverTableViewCell: UITableViewCell {

    @IBOutlet weak var recieverMessageLabel: UILabel!
    @IBOutlet weak var receiverTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
