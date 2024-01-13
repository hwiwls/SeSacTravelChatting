//
//  ChatTableViewCell.swift
//  SeSacTravelChatting
//
//  Created by hwijinjeong on 1/14/24.
//

import UIKit

class SenderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var senderProfileImageView: UIImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var senderMessageLabel: UILabel!
    @IBOutlet weak var senderTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
