//
//  MessageViewModel.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-27.
//

import Foundation


struct MessageViewModel{
    
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.imageURLS[0] else { return nil }
        return URL(string: profileImageUrl)
    }
    
   
    
    
}
