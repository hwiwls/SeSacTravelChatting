//
//  ChattingViewController.swift
//  SeSacTravelChatting
//
//  Created by hwijinjeong on 1/14/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    var chat: ChatRoom = ChatRoom(chatroomId: 1 ,
                              chatroomImage: [User.simsim.profileImage],
                              chatroomName: User.simsim.rawValue, chatList: [
                                Chat(user: .user,
                                     date: "2024-01-11 09:30",
                                     message: "심심아 나 주말에도 개발해...")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chatTableView.backgroundColor = .white
        configView()
        configTableView()
    }
}

extension ChattingViewController {
    func configView() {
        navigationItem.title = "TRAVEL TALK"
        
        messageTextField.backgroundColor = .lightGray
        messageTextField.placeholder = "메세지를 입력하세요"
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if chat.chatList[indexPath.row].user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecieverTableViewCell", for: indexPath) as! RecieverTableViewCell
            
            cell.recieverMessageLabel.text = chat.chatList[indexPath.row].message
            cell.recieverMessageLabel.textColor = .black
            cell.recieverMessageLabel.font = .systemFont(ofSize: 15)
            cell.recieverMessageLabel.numberOfLines = 0
            
            cell.receiverTimeLabel.text = convertDateFormat(inputDate: chat.chatList[indexPath.row].date)
            cell.receiverTimeLabel.textColor = .darkGray
            cell.receiverTimeLabel.font = .systemFont(ofSize: 12)
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderTableViewCell", for: indexPath) as! SenderTableViewCell
            
            cell.senderProfileImageView.image = UIImage(named: chat.chatList[indexPath.row].user.profileImage)
            cell.senderProfileImageView.contentMode = .scaleAspectFit
            
            cell.senderNameLabel.text = chat.chatList[indexPath.row].user.rawValue
            cell.senderNameLabel.textColor = .black
            cell.senderNameLabel.font = .systemFont(ofSize: 13)
            
            cell.senderMessageLabel.text = chat.chatList[indexPath.row].message
            cell.senderMessageLabel.textColor = .black
            cell.senderMessageLabel.font = .systemFont(ofSize: 15)
            cell.senderMessageLabel.numberOfLines = 0
            
            cell.senderTimeLabel.text = convertDateFormat(inputDate: chat.chatList[indexPath.row].date)
            cell.senderTimeLabel.textColor = .darkGray
            cell.senderTimeLabel.font = .systemFont(ofSize: 12)
            
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func configTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: "SenderTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "SenderTableViewCell")
        
        let xib2 = UINib(nibName: "RecieverTableViewCell", bundle: nil)
        chatTableView.register(xib2, forCellReuseIdentifier: "RecieverTableViewCell")
    }
    
    // 시간 포맷팅
    func convertDateFormat(inputDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: inputDate) else { return inputDate }
        
        dateFormatter.dateFormat = "HH:mm a"
        let outputDate = dateFormatter.string(from: date)
        return outputDate
    }

}
