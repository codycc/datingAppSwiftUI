//
//  MainTabView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel :AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    
                    ChannelView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "moon.stars.fill")
                        }
                        .tag(0)
                    HoroscopeView(user: user)
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "wand.and.stars.inverse")
                        }
                        .tag(1)
                    ConversationsView()
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "bubble.left")
                        }
                        .tag(2)
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "gear")
                        }
                        .tag(3)
                        
                }.accentColor(Color("Purple2"))
                
            }
        } else {
            Text("Hello World ")
        }
    }
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Match"
        case 1: return "Horoscope"
        case 2: return "Chats"
        case 3: return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
