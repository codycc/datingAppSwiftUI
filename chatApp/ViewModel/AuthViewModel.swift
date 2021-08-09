//
//  AuthViewModel.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import Firebase
import UIKit


class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String ) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("failed to sign in \(error.localizedDescription)")
                return
            }
           
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, sign: Int) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("debug failed to register with error \(error.localizedDescription)")
                print("failed")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempCurrentUser = user
            
            var stringSign: String = ""
            switch sign {
            case 0:
                stringSign = "Aries"
            case 1:
                stringSign = "Taurus"
            case 2:
                stringSign = "Gemini"
            case 3:
                stringSign = "Cancer"
            case 4:
                stringSign = "Leo"
            case 5:
                stringSign = "Virgo"
            case 6:
                stringSign = "Libra"
            case 7:
                stringSign = "Scorpio"
            case 8:
                stringSign = "Sagittarius"
            case 9:
                stringSign = "Capricorn"
            case 10:
                stringSign = "Aquarius"
            case 11:
                stringSign = "Pisces"
            default:
                stringSign = ""
            }
            let data: [String: Any] = ["email": email,
                                       "sign" : stringSign,
                                       "fullname": fullname,
                                       "imageURLS": [],
                                       "x": 0.0,
                                       "y": 0.0,
                                       "degree": 0.0]
            print("\(email)\(sign)\(fullname)")
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                
                self.didAuthenticateUser = true 
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage? = nil, _ image2: UIImage? = nil, _ image3: UIImage? = nil, _ image4: UIImage? = nil) {
        guard let uid = tempCurrentUser?.uid else {return }
        if image != nil && image2 != nil && image3 != nil && image4 != nil {
            ImageUploader.uploadImage(image: image!) { imageUrl in
                ImageUploader.uploadImage(image: image2!) { imageUrl2 in
                    ImageUploader.uploadImage(image: image3!) { imageUrl3 in
                        ImageUploader.uploadImage(image: image4!) { imageUrl4 in
                            COLLECTION_USERS.document(uid).updateData(["imageURLS": [imageUrl, imageUrl2, imageUrl3, imageUrl4]]) { _ in
                                self.userSession = self.tempCurrentUser
                                self.fetchUser()
                        }
                        }
                    }
                }
            }
        } else if image != nil && image2 != nil && image3 != nil {
            ImageUploader.uploadImage(image: image!) { imageUrl in
                ImageUploader.uploadImage(image: image2!) { imageUrl2 in
                    ImageUploader.uploadImage(image: image3!) { imageUrl3 in
                       
                            COLLECTION_USERS.document(uid).updateData(["imageURLS": [imageUrl, imageUrl2, imageUrl3]]) { _ in
                                self.userSession = self.tempCurrentUser
                                self.fetchUser()
                        }
                    }
                }
            }
        } else if image != nil && image2 != nil {
            ImageUploader.uploadImage(image: image!) { imageUrl in
                ImageUploader.uploadImage(image: image2!) { imageUrl2 in
                    
                            COLLECTION_USERS.document(uid).updateData(["imageURLS": [imageUrl, imageUrl2]]) { _ in
                                self.userSession = self.tempCurrentUser
                                self.fetchUser()
                        }
                }
            }
        } else {
            ImageUploader.uploadImage(image: image!) { imageUrl in
              
                    COLLECTION_USERS.document(uid).updateData(["imageURLS": [imageUrl]]) { _ in
                        self.userSession = self.tempCurrentUser
                        self.fetchUser()
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user 
            
        }
    }
}
