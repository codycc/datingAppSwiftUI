//
//  StatusSelectorView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-25.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment:.leading) {
                    Text("Currenttly set to")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // status cell
                   
                    StatusCell(status: viewModel.status)
                    
                    Text("Select your status")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({$0 != .notConfigured}), id: \.self) { status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {
                            StatusCell(status: status)
                        })
                    }
                    
                    // for loop with options
                    
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
            Spacer()
            
        }
        .foregroundColor(.black)
        .frame(height:56)
        .padding(.horizontal)
        .background(Color.white)
     
    }
}
