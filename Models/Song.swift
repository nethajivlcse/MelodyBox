import Foundation
import SwiftData

@Model
final class Song {
    @Attribute(.unique) var id: UUID
    var title: String
    /// Many-to-many: a track can have several singers.
    @Relationship(inverse: \Artist.songs) var artists: [Artist] = []
    @Relationship(inverse: \Album.songs) var album: Album?
    @Relationship(inverse: \Movie.songs) var movie: Movie?
    /// File name inside the managed Music directory (absolute URLs break across reinstalls).
    var fileName: String
    var duration: TimeInterval
    var artworkReference: String?
    var dateAdded: Date
    var playCount: Int
    var isFavorite: Bool
    var isExcluded: Bool
    /// SHA-256 of file contents, used to avoid duplicate imports.
    var contentHash: String?

    init(id: UUID = UUID(), title: String, fileName: String, duration: TimeInterval = 0,
         artworkReference: String? = nil, dateAdded: Date = .now, playCount: Int = 0,
         isFavorite: Bool = false, isExcluded: Bool = false, contentHash: String? = nil) {
        self.id = id
        self.title = title
        self.fileName = fileName
        self.duration = duration
        self.artworkReference = artworkReference
        self.dateAdded = dateAdded
        self.playCount = playCount
        self.isFavorite = isFavorite
        self.isExcluded = isExcluded
        self.contentHash = contentHash
    }

    var artistDisplayName: String {
        artists.isEmpty ? "Unknown Artist" : artists.map(\.artistName).joined(separator: ", ")
    }
}
