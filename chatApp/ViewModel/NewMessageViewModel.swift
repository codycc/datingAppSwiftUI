//
//  NewMessageViewModel.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-27.
//

import Foundation
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            self.users = documents.compactMap({try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid})
        }
    }
}
