//
//  FullScreenCardView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-07.
//

import SwiftUI

struct FullScreenCardView: View {
    
    var user: User
    @Binding var fullscreenMode: Bool
    
    let screen = UIScreen.main.bounds
    
    @EnvironmentObject var userMng: UserManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(spacing:0) {
                    CardImageScroller(user: user, fullscreenMode: $fullscreenMode)
                        .frame(width:screen.width, height: screen.height * 0.6)
                    
                    HStack {
                        VStack(alignment:.leading) {
                            HStack {
                                Text(user.fullname)
                                    .font(.system(size: 32,weight:.heavy))
                                Text("28")
                                    .font(.system(size: 28,weight:.light))
                                Spacer()
                            }
                            .opacity(0.75)
                            
                            Text("269 Miles Away")
                            
                                .font(.system(size:18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        Button(action: {
                            fullscreenMode = false 
                        }, label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size:42))
                                .background(Color.white)
                                .clipShape(Circle())
                            
                        })
                        .padding(.trailing,16)
                        .offset(y:-40)
                        .foregroundColor(Color("Purple2"))
                    }
                    Spacer().frame(height:26)
                    HStack {
                        Text("My name is cody i love dogs they are aweseom also cats and women they are awesome.")
                            .font(.system(size:18,weight:.medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal,16)
                        
                        Spacer()
                        
                        
                    }
                    Spacer().frame(height:32)
                    
                    VStack(spacing:24) {
                        Button(action: {}, label: {
                            VStack {
                                Text("REPORT \(user.fullname.uppercased())")
                                    .foregroundColor(Color.secondary)
                            }
                        })
                    }
                    Spacer().frame(height:200)
                }
            }
            HStack(spacing:20) {
                Spacer()
                CircleButtonView(type: .no) {
                    fullscreenMode = false
                    userMng.swipe(user, .nope)
                }.frame(height:50)
                
                CircleButtonView(type: .star) {
                    
                }
                .frame(height:45)
                CircleButtonView(type: .heart) {
                    fullscreenMode = false
                    userMng.swipe(user, .like)
                }
                .frame(height:50)
                
                Spacer()
            }
            .padding(.top,25)
            .padding(.bottom,100)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
            )
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top,30)
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(user: User.example, fullscreenMode: .constant(true))
    }
}
