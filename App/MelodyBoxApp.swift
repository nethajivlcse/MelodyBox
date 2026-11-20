import SwiftUI
import SwiftData

@main
struct MelodyBoxApp: App {
    @StateObject private var coordinator = AppCoordinator()
    @AppStorage("appTheme") private var themeRaw = AppTheme.dark.rawValue
    private let container = Persistence.makeContainer()

    var body: some Scene {
        WindowGroup {
            Group {
                if coordinator.hasCompletedOnboarding {
                    RootTabView()
                } else {
                    WelcomeView()
                }
            }
            .environmentObject(coordinator)
            .tint(MB.accent)
            .preferredColorScheme((AppTheme(rawValue: themeRaw) ?? .dark).colorScheme)
        }
        .modelContainer(container)
    }
}
