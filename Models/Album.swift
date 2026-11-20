import Foundation
import SwiftData

@Model
final class Album {
    @Attribute(.unique) var id: UUID
    var albumName: String
    var artist: Artist?
    var artworkReference: String?
    var releaseYear: Int?
    var songs: [Song] = []

    init(id: UUID = UUID(), albumName: String, artist: Artist? = nil,
         artworkReference: String? = nil, releaseYear: Int? = nil) {
        self.id = id
        self.albumName = albumName
        self.artist = artist
        self.artworkReference = artworkReference
        self.releaseYear = releaseYear
    }
}
