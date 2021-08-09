//
//  CustomTextField.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-24.
//

import SwiftUI

struct CustomTextField: View {
    let  imageName: String
    let placeHolderText:String
    let isSecureField: Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing:21) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height:20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField {
                    SecureField(placeHolderText, text: $text)
                } else {
                    TextField(placeHolderText, text: $text)
                }
                
                
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}


