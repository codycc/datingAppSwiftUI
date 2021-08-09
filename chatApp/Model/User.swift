//
//  User.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-27.
//

import FirebaseFirestoreSwift
import SwiftUI



struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let sign: String
    let fullname: String
    let email: String

    let imageURLS: [String]
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension User {
    static let example = User(id: "9", sign: "Gemini", fullname: "Ally Brooke", email: "ally@gmail.com", imageURLS: ["https://picsum.photos/200","https://picsum.photos/201"])
    
    static let examples = [User(id: "19", sign: "Gemini", fullname: "Allie Brooke", email: "ally@gmail.com", imageURLS: ["https://picsum.photos/200","https://picsum.photos/201"]), User(id: "103", sign: "Gemini", fullname: "James", email: "ally@gmail.com", imageURLS: ["https://picsum.photos/203","https://picsum.photos/204"]), User(id: "141", sign: "Gemini", fullname: "Sam", email: "ally@gmail.com", imageURLS: ["https://picsum.photos/205","https://picsum.photos/206"])]
}


