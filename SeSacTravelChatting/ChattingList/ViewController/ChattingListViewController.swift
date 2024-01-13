//
//  ChattingListViewController.swift
//  SeSacTravelChatting
//
//  Created by hwijinjeong on 1/13/24.
//

import UIKit

class ChattingListViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chatTableView.backgroundColor = .white
        configView()
        configTableView()
    }
}

extension ChattingListViewController {
    func configView() {
        navigationItem.title = "TRAVEL TALK"
        
        searchTextField.backgroundColor = .lightGray
        searchTextField.placeholder = "친구 이름을 검색해보세요"
    }
}

extension ChattingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingListTableViewCell", for: indexPath) as! ChattingListTableViewCell
        
        cell.chatroomImageView.image = UIImage(named: mockChatList[indexPath.row].chatroomImage.last ?? "star.fill")
        cell.chatroomImageView.contentMode = .scaleAspectFit
        
        cell.chatroomNameLabel.text = mockChatList[indexPath.row].chatroomName
        cell.chatroomNameLabel.textColor = .black
        cell.chatroomNameLabel.font = .boldSystemFont(ofSize: 15)
        
        cell.chatroomMessageLabel.text = mockChatList[indexPath.row].chatList.last?.message
        cell.chatroomMessageLabel.textColor = .darkGray
        cell.chatroomMessageLabel.font = .systemFont(ofSize: 14)
        
        cell.chatroomDateLabel.text = convertDateFormat(inputDate: mockChatList[indexPath.row].chatList.last?.date ?? "")
        cell.chatroomDateLabel.textColor = .lightGray
        cell.chatroomDateLabel.font = .systemFont(ofSize: 13)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func configTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let xib = UINib(nibName: "ChattingListTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "ChattingListTableViewCell")
    }
    
    // 날짜 포맷팅
    func convertDateFormat(inputDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: inputDate) else { return inputDate }
        
        dateFormatter.dateFormat = "yy.MM.dd"
        let outputDate = dateFormatter.string(from: date)
        return outputDate
    }
}
