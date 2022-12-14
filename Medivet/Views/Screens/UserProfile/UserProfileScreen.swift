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
    @State private var showImagePicker = false
    @State private var userImage: UIImage?
    @State private var showEditUserProfilePhotoAlert = false
    @State private var showBirthDatePicker = false
    let dateFormatter = DateFormatter()
    private let formatAddressController = FormatAddressController()
    private let formatPhoneNumberController = FormatPhoneNumberController()
    
    var body: some View {
        Form {
            VStack(alignment: .center) {
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
                    self.showEditUserProfilePhotoAlert = true
                } label: {
                    Text(Translations.Screens.UserProfile.editProfilePhoto)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }.foregroundColor(Color.gray)
                    .buttonStyle(.borderless)
                    .confirmationDialog("", isPresented: $showEditUserProfilePhotoAlert) {
                        Button(Translations.Screens.UserProfile.chooseProfilePhoto) {
                            self.showImagePicker = true
                        }
                        if currentUserStore.user.profilePhotoUrl != "" {
                            Button(Translations.Screens.UserProfile.removeProfilePhoto, role: .destructive) {
                                userProfileScreenController.removeUserProfilePhoto(currentUserStore: currentUserStore)
                            }
                        }
                        Button(Translations.Common.cancel, role: .cancel) {}
                    }
            }
                .frame(maxWidth: .infinity)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $userImage, source: Binding.constant(.photoLibrary))
                }.background(Color.gray.opacity(0.1))
                .listRowInsets(EdgeInsets())
            Section {
                FormNavigationLinkWithLabel(
                    label: Translations.Inputs.name,
                    value: currentUserStore.user.name,
                    destination: UserProfileNameScreen()
                )
                FormNavigationLinkWithLabel(
                    label: Translations.Inputs.address,
                    value: formatAddressController.getAddress(
                        street: currentUserStore.user.address.street,
                        buildingNumber: currentUserStore.user.address.buildingNumber,
                        flatNumber: currentUserStore.user.address.flatNumber,
                        zipCode: currentUserStore.user.address.zipCode,
                        city: currentUserStore.user.address.city),
                    destination: UserProfileAddressScreen()
                )
                Picker(selection: $currentUserStore.user.gender, label: Text(Translations.Inputs.gender)) {
                    Text(EnumsTranslations.Gender.male ).tag(Gender.male)
                    Text(EnumsTranslations.Gender.female ).tag(Gender.female)
                }
                FormButtonWithLabelAndValue(
                    label: Translations.Inputs.birthDate,
                    action: ({
                        showBirthDatePicker = true
                    }),
                    value: dateFormatter.getShortFormat(currentUserStore.user.birthDate)
                )
                if showBirthDatePicker {
                    DatePicker(Translations.Inputs.birthDate, selection: $currentUserStore.user.birthDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                }
                FormNavigationLinkWithLabel(
                    label: Translations.Inputs.phoneNumber,
                    value: formatPhoneNumberController.formatPhoneNumber(value: currentUserStore.user.phoneNumber),
                    destination: UserProfilePhoneNumberScreen()
                )
            }
        }
        .onAppear(perform: ({
            UIScrollView.appearance().keyboardDismissMode = .onDrag
            UIApplication.shared.handleKeyboard()
        }))
        .navigationTitle(Translations.Navigation.userProfile)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: userImage) { value in
            if userImage != nil {
                userProfileScreenController.updateUserProfilePhoto(image: userImage!, currentUserStore: currentUserStore)
            }
        }
    }
}
