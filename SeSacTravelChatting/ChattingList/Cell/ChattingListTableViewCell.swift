//
//  ChattingListTableViewCell.swift
//  SeSacTravelChatting
//
//  Created by hwijinjeong on 1/13/24.
//

import UIKit

class ChattingListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatroomImageView: UIImageView!
    @IBOutlet weak var chatroomNameLabel: UILabel!
    @IBOutlet weak var chatroomMessageLabel: UILabel!
    @IBOutlet weak var chatroomDateLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        chatroomImageView.layer.cornerRadius = chatroomImageView.frame.width / 2
        chatroomImageView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .clear
    }
    
}
