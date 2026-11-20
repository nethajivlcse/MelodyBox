import SwiftUI

enum AppTab: Hashable { case home, songs, browse, playlists, settings }

@MainActor
final class AppCoordinator: ObservableObject {
    @Published var selectedTab: AppTab = .home
    @Published var hasCompletedOnboarding: Bool =
        UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")

    func finishOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        withAnimation(.easeInOut(duration: 0.4)) { hasCompletedOnboarding = true }
    }
}
