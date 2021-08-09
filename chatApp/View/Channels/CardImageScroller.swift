//
//  CardImageScroller.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-07.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    
    var user: User
    
    @State private var imageIndex = 0
    @Binding var fullscreenMode: Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), user.imageURLS.count - 1)
    }
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(URL(string: user.imageURLS[imageIndex]))
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                  
                    VStack {
                        HStack {
                            Image("like")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:150)
                                .opacity(Double(user.x / screenCutoff) - 1)
                            Spacer()
                            Image("nope")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:150)
                                .opacity(Double(user.x / screenCutoff * -1 - 1)  )
                            
                        }
                        Spacer()
                    }
                    HStack {
                        Rectangle()
                            .onTapGesture(perform: {
                                updateImageIndex(addition: false)
                            })
                        
                        Rectangle()
                            .onTapGesture(perform: {
                                updateImageIndex(addition: true)
                            })
                    }.foregroundColor(Color.white.opacity(0.01))
                }
                VStack {
                    HStack {
                        ForEach(0..<user.imageURLS.count) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height:4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top,6)
                    .padding(.horizontal, fullscreenMode ? 0 : 12)
                    Spacer()
                    
                    if !fullscreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(user.fullname)
                                        .font(.system(size: 32, weight: .heavy))
                                    Text("27")
                                        .font(.system(size: 28, weight: .light))
                                }
                                
                                Text("Biography of person my name is this and yadada")
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                            Button(action: {
                                fullscreenMode = true
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26))
                                    
                            })
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
            }
            .cornerRadius(6)
            .shadow(radius:5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(user: User(id: "9", sign: "gemini", fullname: "Stacey", email: "stavey@gmail.com",  imageURLS: ["https://picsum.photos/200","https://picsum.photos/201","https://picsum.photos/202"]), fullscreenMode: .constant(false))
    }
}
