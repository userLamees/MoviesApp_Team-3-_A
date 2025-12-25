//
//  Profile.swift
//  MoviesApp
//
//  Created by Aryam on 24/12/2025.
//
import SwiftUI

struct ProfileView: View {

    @StateObject private var vm = ProfileViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {

                // Back
                HStack {
                    Button("Back") {
                        dismiss()
                    }
                    .foregroundColor(.yellow)

                    Spacer()
                }
                .padding(.horizontal)

                // Title
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                // Profile Card
                NavigationLink {
                    ProfileNamePage()
                        .environmentObject(vm)
                } label: {
                    HStack(spacing: 16) {

                        // Avatar
                        if let img = vm.profile.avatarImage {
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                                .foregroundColor(.gray)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(vm.fullName)
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("Xxxx234@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14)
                }
                .padding(.horizontal)

                // Saved Movies
                Text("Saved movies")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal)

                Spacer()

                // Empty State
                VStack(spacing: 14) {

                    Image("moviePlaceholder")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .opacity(0.6)

                    Text("No saved movies yet, start save\nyour favourites")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

                Spacer()
            }
            .padding(.top)
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview {
    ProfileView()
}
