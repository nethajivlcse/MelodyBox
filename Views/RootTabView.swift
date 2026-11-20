import SwiftUI

struct RootTabView: View {
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(AppTab.home)
            PlaceholderTab(title: "Songs", icon: "music.note", phase: 4)
                .tabItem { Label("Songs", systemImage: "music.note") }
                .tag(AppTab.songs)
            PlaceholderTab(title: "Browse", icon: "square.grid.2x2", phase: 4)
                .tabItem { Label("Browse", systemImage: "square.grid.2x2") }
                .tag(AppTab.browse)
            PlaceholderTab(title: "Playlists", icon: "music.note.list", phase: 8)
                .tabItem { Label("Playlists", systemImage: "music.note.list") }
                .tag(AppTab.playlists)
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
                .tag(AppTab.settings)
        }
    }
}

/// Temporary screen, replaced in the phase noted.
private struct PlaceholderTab: View {
    let title: String, icon: String, phase: Int
    var body: some View {
        NavigationStack {
            ContentUnavailableView(title, systemImage: icon,
                                   description: Text("Built in Phase \(phase)."))
                .mbBackground()
                .navigationTitle(title)
        }
    }
}
