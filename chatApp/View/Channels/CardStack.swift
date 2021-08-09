//
//  CardStack.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-08.
//

import SwiftUI

struct CardStack: View {
    var people: [User]
    
    @State private var fullscreenMode: Bool = false
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            ForEach(people) { user in
                CardView(user: user, fullscreenMode: $fullscreenMode)
                
            }
        }.frame(width:screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: [User(id: "9", sign: "Gemini", fullname: "Allie Brooke", email: "ally@gmail.com",  imageURLS: ["https://picsum.photos/200","https://picsum.photos/201"]), User(id: "10", sign: "Gemini", fullname: "James", email: "ally@gmail.com",  imageURLS: ["https://picsum.photos/203","https://picsum.photos/204"]), User(id: "11", sign: "Gemini", fullname: "Sam", email: "ally@gmail.com",  imageURLS: ["https://picsum.photos/205","https://picsum.photos/206"])])
    }
}
