//
//  ChatVC.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation
import  UIKit

class ChatVc: UIViewController, Storyboarded {
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendMessageIcon: UIImageView!
    @IBOutlet weak var viewOfTxtView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var originalBottomConstraint: CGFloat = 0.0
    var friend: FriendModel?
    var messages = [MessageModel]()
    var response: MessageResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        if let user_id = friend?.id {
            fetchMessages(with: user_id, isFirstTime: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        originalBottomConstraint = bottomConstraint.constant
    }
    
    func initView() {
        chatTableView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(endEditingText)))
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        sendMessageIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(sendMessage)))
        textView.layer.cornerRadius = 10.0
        textView.layer.backgroundColor = UIColor.white.cgColor
        setupTableView()
        chatTableView.scrollToBottomRow()
    }
    
    func setupTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.registerCell(name: ReceivedMessageCell.className)
        chatTableView.registerCell(name: SendedMessageCell.className)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomConstraint.constant = keyboardSize.height - 25.0
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        bottomConstraint.constant = originalBottomConstraint
    }
    
    @objc func endEditingText(){
        self.view.endEditing(true)
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
    @objc func sendMessage(){
        self.view.endEditing(true)
        if let friend = friend, let user_id = friend.id, let message = textView.text, message.count > 0 {
            sendMessageTo(user_id: user_id, message: message)
        }
    }
    
}


extension ChatVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
            if message.isMine == true {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SendedMessageCell", for: indexPath) as? SendedMessageCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                cell.setupCell(message: message)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedMessageCell", for: indexPath) as? ReceivedMessageCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                cell.setupCell(message: message)
                return cell
            }
    }
    
    
    
}
