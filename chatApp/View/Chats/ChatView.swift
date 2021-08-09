//
//  ChatView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user:user)
    }
    var body: some View {
        VStack {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            CustomInputView(text: $messageText, action: sendMessage)
            //input view 
        }.navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = "" 
    }
}


