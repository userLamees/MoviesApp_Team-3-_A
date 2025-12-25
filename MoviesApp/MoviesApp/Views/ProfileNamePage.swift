//
//  ProfileNamePage.swift
//  MoviesApp
//
//  Created by Aryam on 24/12/2025.
//
import SwiftUI

struct ProfileNamePage: View {

    @EnvironmentObject var vm: ProfileViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {

            // Avatar
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.35))
                    .frame(width: 90, height: 90)

                if let img = vm.profile.avatarImage {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)

            // Name Card
            VStack(spacing: 0) {

                HStack {
                    Text("First name")
                        .foregroundColor(.white)
                    Spacer()
                    Text(vm.profile.firstName)
                        .foregroundColor(.gray)
                }
                .padding()

                Divider()
                    .background(Color.gray.opacity(0.4))

                HStack {
                    Text("Last name")
                        .foregroundColor(.white)
                    Spacer()
                    Text(vm.profile.lastName)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.gray.opacity(0.25))
            .cornerRadius(14)
            .padding(.horizontal)

            Spacer()

            // ✅ Sign Out
            Button(action: {
                // TODO: sign out logic
            }) {
                Text("Sign Out")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Profile info")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {

            // Back (كلمة فقط)
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    dismiss()
                }
                .foregroundColor(.yellow)
            }

            // Edit
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ProfileEditView()
                        .environmentObject(vm)
                } label: {
                    Text("Edit")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileNamePage()
            .environmentObject(ProfileViewModel())
    }
}
