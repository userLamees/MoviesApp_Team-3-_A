//
//  ProfileEditView.swift
//  MoviesApp
//
//  Created by Aryam on 25/12/2025.
//
import SwiftUI
import PhotosUI

struct ProfileEditView: View {

    @EnvironmentObject var vm: ProfileViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack(spacing: 24) {

            // Avatar picker
            PhotosPicker(selection: $selectedItem, matching: .images) {
                if let img = selectedImage ?? vm.profile.avatarImage {
                    Image(uiImage: img)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)
                }
            }

            // Fields
            VStack(spacing: 0) {
                TextField("First name", text: $firstName)
                    .padding()
                    .foregroundColor(.white)

                Divider()

                TextField("Last name", text: $lastName)
                    .padding()
                    .foregroundColor(.white)
            }
            .background(Color.gray.opacity(0.25))
            .cornerRadius(14)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Profile info")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {

            // Back كلمة فقط
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") { dismiss() }
                    .foregroundColor(.yellow)
            }

            // Save كلمة فقط
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    vm.updateFirstName(firstName)
                    vm.updateLastName(lastName)
                    if let img = selectedImage {
                        vm.updateAvatar(img)
                    }
                    dismiss()
                }
                .foregroundColor(.yellow)
            }
        }
        .onAppear {
            firstName = vm.profile.firstName
            lastName = vm.profile.lastName
        }
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let img = UIImage(data: data) {
                    selectedImage = img
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileEditView()
            .environmentObject(ProfileViewModel())
    }
}
