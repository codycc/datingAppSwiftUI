//
//  LoginView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack() {
                
                VStack(alignment:.leading) {
                    HStack {
                        Spacer()
                    }
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                }
                VStack(spacing: 40){
                    CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecureField: false, text: $email)
                    
                    CustomTextField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                    
                    
                    
                    
                }.padding([.top,.horizontal],32)
                
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: Text("reset password"),
                        label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold ))
                                .padding(.top)
                                .padding(.trailing,20)
                                .padding(.bottom,10)
                        })
                    
                }
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:340,height:50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                })
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView()
                        .navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                            Text("Sign Up").font(.system(size: 14, weight: .semibold))
                        }
                    }).padding(.bottom,32)
            }
            .padding()
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
