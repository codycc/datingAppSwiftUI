//
//  ProfilePhotoSelectorView.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var imagePickerPresented = false
    @State private var imagePickerPresented2 = false
    @State private var imagePickerPresented3 = false
    @State private var imagePickerPresented4 = false
    @State private var selectedImage: UIImage?
    @State private var selectedImage2: UIImage?
    @State private var selectedImage3: UIImage?
    @State private var selectedImage4: UIImage?
    @State private var profileImage: Image?
    @State private var profileImage2: Image?
    @State private var profileImage3: Image?
    @State private var profileImage4: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            Text("Select Some Photos")
                .font(.system(size:25, weight: .semibold))
            HStack {
            Button(action: {
                imagePickerPresented.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width:130, height: 130)
                        .clipped()
                        
                        .foregroundColor(.black)
                }
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            Button(action: {
                imagePickerPresented2.toggle()
            }, label: {
                if let profileImage2 = profileImage2 {
                    profileImage2
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width:130, height: 130)
                        .clipped()
                        
                        .foregroundColor(.black)
                }
            })
            .sheet(isPresented: $imagePickerPresented2, onDismiss: loadImage2, content: {
                ImagePicker(image: $selectedImage2)
            })
            
            }
            HStack {
                Button(action: {
                    imagePickerPresented3.toggle()
                }, label: {
                    if let profileImage3 = profileImage3 {
                        profileImage3
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width:130, height: 130)
                            .clipped()
                            
                            .foregroundColor(.black)
                    }
                })
                .sheet(isPresented: $imagePickerPresented3, onDismiss: loadImage3, content: {
                    ImagePicker(image: $selectedImage3)
                })
                Button(action: {
                    imagePickerPresented4.toggle()
                }, label: {
                    if let profileImage4 = profileImage4 {
                        profileImage4
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width:130, height: 130)
                            .clipped()
                            
                            .foregroundColor(.black)
                    }
                })
                .sheet(isPresented: $imagePickerPresented4, onDismiss: loadImage4, content: {
                    ImagePicker(image: $selectedImage4)
                })
            }
            
            if let image = selectedImage  {
                Button(action: {
                    if selectedImage != nil && selectedImage2 != nil && selectedImage3 != nil && selectedImage4 != nil {
                        viewModel.uploadProfileImage(image, selectedImage2, selectedImage3, selectedImage4)
                    } else if selectedImage != nil && selectedImage2 != nil && selectedImage3 != nil  {
                        viewModel.uploadProfileImage(image, selectedImage2, selectedImage3)
                    } else if selectedImage != nil && selectedImage2 != nil {
                        viewModel.uploadProfileImage(image, selectedImage2)
                    } else {
                        viewModel.uploadProfileImage(image)
                    }
                    
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .padding(.top,24)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
    func loadImage2() {
        guard let selectedImage2 = selectedImage2 else {return}
        profileImage2 = Image(uiImage: selectedImage2)
    }
    func loadImage3() {
        guard let selectedImage3 = selectedImage3 else {return}
        profileImage3 = Image(uiImage: selectedImage3)
    }
    func loadImage4() {
        guard let selectedImage4 = selectedImage4 else {return}
        profileImage4 = Image(uiImage: selectedImage4)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
