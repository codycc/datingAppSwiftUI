//
//  ChatViewModel.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import Foundation
import Firebase

class ChatViewModel: ObservableObject {
    
    
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        guard let chatPartnerId = user.id else  {return}
        
        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added}) else {return}
        
            var messages = changes.compactMap { try? $0.document.data(as: Message.self)}
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
            
            self.messages.append(contentsOf: messages)
            
        }
        
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        guard let chatPartnerId = user.id else  {return}
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).document()
        let chatParnterRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection("recent-messages").document(currentUid)
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read":false,
                                   "timestamp":Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatParnterRef.document(messageId).setData(data)
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
    }
}
