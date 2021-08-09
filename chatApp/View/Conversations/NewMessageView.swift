//
//  NewMessageView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack(alignment:.leading) {
                
                ForEach(viewModel.users) { user in
                    Button(action: {
                        
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCell(user: user)
                    })
                    
                }
            }
        }
    }
}


