import Foundation
import SwiftData

/// Movies are created only by manual tagging; nothing is invented automatically.
@Model
final class Movie {
    @Attribute(.unique) var id: UUID
    var movieName: String
    var musicDirector: String
    var posterReference: String?
    var songs: [Song] = []

    init(id: UUID = UUID(), movieName: String, musicDirector: String = "",
         posterReference: String? = nil) {
        self.id = id
        self.movieName = movieName
        self.musicDirector = musicDirector
        self.posterReference = posterReference
    }
}
