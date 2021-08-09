//
//  SettingsView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-25.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing: 32) {
                NavigationLink(
                    destination: EditProfileView(),
                    label: {
                        SettingsHeaderView(user: user)
                            .padding(.top,20)
                    })
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
            
                
                Button(action: {
                    AuthViewModel.shared.signout()
                }, label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height:50)
                        .background(Color.white)
                })
                
                
                Spacer()
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}




