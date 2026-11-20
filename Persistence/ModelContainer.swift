import Foundation
import SwiftData

enum Persistence {
    static let schema = Schema([
        Song.self, Artist.self, Album.self,
        Movie.self, Playlist.self, PlaybackHistory.self
    ])

    static func makeContainer(inMemory: Bool = false) -> ModelContainer {
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}

/// Managed folders inside Application Support.
enum AppDirectories {
    static func url(_ name: String) -> URL {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let dir = base.appendingPathComponent(name, isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir
    }
    static var music: URL { url("Music") }
    static var artwork: URL { url("Artwork") }
}
