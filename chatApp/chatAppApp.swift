//
//  chatAppApp.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-24.
//

import SwiftUI
import Firebase

@main
struct chatAppApp: App {
    
    init()  {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
            //ProfilePhotoSelectorView()
        }
    }
}
