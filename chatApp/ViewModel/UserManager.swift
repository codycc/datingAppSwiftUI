//
//  UserManager.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-07.
//

import Foundation
import Firebase 


class UserManager: ObservableObject {
    @Published var matches: [User] = []
    @Published var cardPeople: [User] = []
    
   
    init() {
        loadMatches()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
       // self.cardPeople = User.examples
        
            COLLECTION_USERS.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                self.cardPeople = documents.compactMap({try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid})
            }
        
    }
    
    private func loadMatches() {
        self.matches = User.examples
    }
    
    
    public func swipe(_ user: User, _ direction: SwipeDirection) {
        cardPeople.removeLast()
    }
}

enum SwipeDirection {
    case like
    case nope
}
