//
//  HoroscopeViewModel.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-05.
//

import Foundation
import SwiftyJSON
import SwiftUI
import Firebase


class HoroscopeViewModel: NSObject, ObservableObject {
    @Published var result: String?
    @Published var horoscopes = [Horoscope]()
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?

    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
      
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user
            
        }
    }
    
    
    func getHoroscope() {
        let headers = [
            "x-rapidapi-key": "xxxxxxxxxxxxxxxxx",
            "x-rapidapi-host": "sameer-kumar-aztro-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=\(self.currentUser!.sign)&day=today")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
               
                let json = try! JSON(data: data!)

                print(json)
                print(json["current_date"])
                DispatchQueue.main.async {
                    self.horoscopes.append(Horoscope(current_date: json["current_date"].stringValue, color: json["color"].stringValue, description: json["description"].stringValue, lucky_time: json["lucky_time"].stringValue, mood: json["mood"].stringValue, compatibility: json["compatibility"].stringValue, lucky_number: json["lucky_number"].stringValue))
                    
                }
            }
        })

        dataTask.resume()
    }
}

