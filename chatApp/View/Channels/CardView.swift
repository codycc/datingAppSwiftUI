//
//  CardView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-07.
//

import SwiftUI

struct CardView: View {
    @State var user: User
    @Binding var fullscreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    var body: some View {
        GeometryReader { geo in
            if fullscreenMode {
                FullScreenCardView(user: user, fullscreenMode: $fullscreenMode)
            } else {
                CardImageScroller(user: user, fullscreenMode: $fullscreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .padding(.leading,10)
                    .offset(x: user.x, y: user.y)
                    .rotationEffect(.degrees(user.degree))
                    .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.default) {
                                user.x = value.translation.width
                                user.y = value.translation.height
                                withAnimation {
                                    user.degree = Double((value.translation.width / 25) * -1)
                                }
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                let width = value.translation.width
                                if width >= 0 && width <= screenCutoff {
                                    user.x = 0
                                    user.y = 0
                                    user.degree = 0
                                } else if width <= -1 && width >= -screenCutoff {
                                    user.x = 0
                                    user.y = 0
                                    user.degree = 0
                                } else if width > screenCutoff {
                                    //swipe right
                                    user.x = 500
                                    user.degree = 12
                                } else if width < -screenCutoff {
                                    //swipe left
                                    user.x = -500
                                    user.degree = -12
                                }
                                
                            }
                        })
                )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: User.example, fullscreenMode: .constant(false))
        CardView(user: User.example, fullscreenMode: .constant(true))
    }
}
