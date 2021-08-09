//
//  ChannelView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-25.
//

import SwiftUI

struct ChannelView: View {
    
    var body: some View {
       HomeView().environmentObject(UserManager())
       
            .navigationBarHidden(true)
            .navigationBarTitle("")
    }
    
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
