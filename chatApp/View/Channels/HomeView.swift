//
//  HomeView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-08.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userMng: UserManager
    var body: some View {
        VStack {
            CardStack(people: userMng.cardPeople)
            Spacer()
            HStack {
                Spacer()
                CircleButtonView(type: .no) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, .nope)
                    }
                }
                Spacer()
                CircleButtonView(type: .heart) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, .like)
                    }
                }
                Spacer()
            }
            .frame(height:60)
            .padding(.horizontal)
            .padding(.bottom,20)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserManager())
    }
}
