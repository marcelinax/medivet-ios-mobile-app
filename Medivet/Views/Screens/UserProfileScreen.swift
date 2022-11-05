//
//  UserProfileScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import SwiftUI

struct UserProfileScreen: View {
    @EnvironmentObject var currentUserStore: CurrentUserStore
    @StateObject private var userProfileScreenController = UserProfileScreenController()
    @State private var userName: String = ""
    @State private var userGender: Gender = Gender.male
    @State private var showImagePicker = false
    @State private var userImage: UIImage?
    
    var body: some View {
        ScrollView {
            VStack {
                if currentUserStore.user.profilePhotoUrl != "" {
                    AsyncImage(
                        url: URL(string: currentUserStore.user.profilePhotoUrl)!,
                        content: { phase in
                            switch phase {
                            case .empty:
                            ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(140/2)
                                    .padding(.bottom, 1)
                            case .failure:
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 140))
                                    .padding(.bottom, 1)
                            @unknown default:
                                ProgressView()
                            }
                        })
                }
                else {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 140))
                        .padding(.bottom, 1)
                }
                Button {
                    self.showImagePicker = true
                } label: {
                    Text(Translations.Screens.UserProfile.editProfilePhoto)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }.foregroundColor(Color.gray)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $userImage, source: Binding.constant(.photoLibrary))
                    }
            }.padding(.bottom, 16)
            MedivetTextInput(
                errors: [],
                isClearable: true,
                placeholder: Translations.Inputs.name,
                value: $userName
            ).padding(.bottom, 40)
            Picker("", selection: $userGender) {
                Text(EnumsTranslations.Gender.male).tag(Gender.male)
                Text(EnumsTranslations.Gender.female).tag(Gender.female)
            }.pickerStyle(.segmented)
                .padding(.bottom, 30)
                .simultaneousGesture(
                    TapGesture().onEnded({
                        userGender = userProfileScreenController.toggleGenderPickerValue(userGender)
                    })
                )
        }.padding()
            .onAppear(perform: ({
                UIScrollView.appearance().keyboardDismissMode = .onDrag
                userName = currentUserStore.user.name
                userGender = currentUserStore.user.gender
            }))
            .navigationTitle(Translations.Navigation.userProfile)
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                self.dismissKeyboard()
            }
            .onChange(of: userImage) { value in
                if userImage != nil {
                    userProfileScreenController.updateUserProfilePhoto(image: userImage!, currentUserStore: currentUserStore)
                }
            }
    }
}
