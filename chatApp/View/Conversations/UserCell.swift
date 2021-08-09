//
//  UserCell.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        VStack {
            HStack {
                
                KFImage(URL(string: user.imageURLS[0]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipped()
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing:4) {
//                    Text(user.username)
//                        .font(.system(size: 14, weight: .semibold))
                    Text(user.fullname)
                        .font(.system(size: 15))
                }.foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
           
        }
        .padding(.top)
    }
}

