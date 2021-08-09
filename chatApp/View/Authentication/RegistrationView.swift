//
//  RegistrationView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-25.
//

import SwiftUI
import Combine 

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var lastSelectedIndex: Int?
    @State var value: CGFloat = 0
    var signs = ["Cancer", "Pieces", "Virgo"]
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {
                    
                })
            
            VStack(alignment:.leading) {
                HStack {
                    Spacer()
                }
            Text("Get started.")
                .font(.largeTitle)
                .bold()
            
            Text("Create your account.")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
            }
            .padding(.horizontal,20)
            
            VStack(spacing: 10){
                CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecureField: false, text: $email)
                    .padding(.bottom,0)
                

                CustomTextField(imageName: "person", placeHolderText: "Full Name", isSecureField: false, text: $fullname)
                    .padding(.top,16)
                    .padding(.bottom,0)
                
                HStack {
                    Image(systemName: "moon.stars")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20,height:20)
                        .foregroundColor(Color(.darkGray))
                        
                    PickerTextField(data: ["Aries","Taurus","Gemini", "Cancer","Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"], placeholder: "Select Zodiac Sign", lastSelectedIndex: self.$lastSelectedIndex).frame(height:50)
                }
               
                    
                Divider()
                    .background(Color(.darkGray))
                
                CustomTextField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                    .padding(.top,16)
                
            }.padding([.top,.horizontal],32)
            
            Button(action: {
               
                viewModel.register(withEmail: email, password: password, fullname: fullname, sign: lastSelectedIndex!)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding(.top,30)
            Spacer()
            
            
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign In").font(.system(size: 14, weight: .semibold))
                }
            }).padding(.bottom,30)
        }.offset(y: -self.value)
        .animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let value = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.value = 25
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
              
                
                self.value = 0
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
