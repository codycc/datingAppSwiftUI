//
//  HoroscopeView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-03.
//

import SwiftUI

struct HoroscopeView: View {
    @ObservedObject var viewModel = HoroscopeViewModel()
    private let user: User
    
    init(user: User ) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            if viewModel.horoscopes.count == 1  {
                VStack(spacing:10) {
                    ZStack {
                        Color("Purple2")
                        VStack {
                            HStack {
                                Image(user.sign )
                                    .renderingMode(.template)
                                    
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width:60,height:60)
                                    
                                Text(user.sign )
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .semibold))
                                
                            }
                            .padding(.top,20)
                                                    Text(viewModel.horoscopes[0].current_date)
                                .font(.system(size: 30, weight: .light))
                                .foregroundColor(.white)
                            HStack {
                                Text("Color:")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Text(viewModel.horoscopes[0].color )
                                    
                                    .font(.system(size: 20, weight: .light))
                                        .foregroundColor(.white)
                                Text("Lucky Time:")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Text(viewModel.horoscopes[0].lucky_time )
                                   
                                        .font(.system(size: 20, weight: .light))
                                        .foregroundColor(.white)
                            }.padding(.top,10)
                            Group {
                             
                               
                                HStack {
                                Text("Compatibility:")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Text(viewModel.horoscopes[0].compatibility )
                                    
                                    .font(.system(size: 20, weight: .light))
                                        .foregroundColor(.white)
                                }
                                .padding(.top,5)
                                HStack {
                                Text("Lucky Number:")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Text(viewModel.horoscopes[0].lucky_number )
                                    
                                    .font(.system(size: 20, weight: .light))
                                        .foregroundColor(.white)
                                }.padding(.top,5)
                            }
                        }
                        
                    }.edgesIgnoringSafeArea(.all)
                    .frame(width:UIScreen.main.bounds.width, height:250)
                    Group {
                           
                        Text("Horoscope:")
                            .font(.system(size: 25, weight: .semibold))
                        Text(viewModel.horoscopes[0].description )
                            .padding(.horizontal)
                            
                            .font(.system(size: 20, weight: .light))
                        
                    }
                    
                    
                    Spacer()
                    Image("astronaut")
                        .resizable()
                        .scaledToFit()
                }
                
            } else {
                VStack {
                    Image("stars")
                        .resizable()
                        .scaledToFit()
                        .frame(width:500)
                    
                    Button(action: {
                        viewModel.getHoroscope()
                    }, label: {
                        Text("Get Today's Horoscope")
                    }).padding(10)
                    .background(Color("Purple2"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Spacer()
                    Image("astronaut")
                        .resizable()
                        .scaledToFit()
                }
                
            }
            
            
        }.navigationBarHidden(true)
    }
}

struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView(user: User(id: "0", sign: "Gemini", fullname: "cody", email: "cody@gmail.com", imageURLS: ["https://picsum.photos/200","https://picsum.photos/201"]))
    }
}
