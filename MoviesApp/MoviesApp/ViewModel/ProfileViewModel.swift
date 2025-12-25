//
//  ProfileViewModel.swift
//  MoviesApp
//
//  Created by Aryam on 25/12/2025.
//

import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {

    @Published private(set) var profile: UserProfile

    init() {
        self.profile = UserProfile(
            firstName: "Sarah",
            lastName: "Abdullah",
            avatarImage: nil
        )
    }

    var fullName: String {
        "\(profile.firstName) \(profile.lastName)"
    }

    func updateFirstName(_ name: String) {
        profile.firstName = name
    }

    func updateLastName(_ name: String) {
        profile.lastName = name
    }

    func updateAvatar(_ image: UIImage?) {
        profile.avatarImage = image
    }
}
