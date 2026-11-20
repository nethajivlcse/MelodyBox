import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var songs: [Song]
    @Query private var artists: [Artist]
    @Query private var albums: [Album]
    @Query private var playlists: [Playlist]

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    LazyVGrid(columns: columns, spacing: 12) {
                        StatCard(value: songs.count, label: "Songs", icon: "music.note")
                        StatCard(value: artists.count, label: "Artists", icon: "person.2")
                        StatCard(value: albums.count, label: "Albums", icon: "square.stack")
                        StatCard(value: playlists.count, label: "Playlists", icon: "music.note.list")
                    }

                    if songs.isEmpty {
                        ContentUnavailableView(
                            "No music yet",
                            systemImage: "tray.and.arrow.down",
                            description: Text("Import audio files from the Files app to start listening. Import arrives in Phase 3.")
                        )
                        .padding(.top, 24)
                    }
                }
                .padding()
            }
            .mbBackground()
            .navigationTitle("MelodyBox")
        }
    }
}
