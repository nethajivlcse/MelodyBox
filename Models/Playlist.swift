import Foundation
import SwiftData

@Model
final class Playlist {
    @Attribute(.unique) var id: UUID
    var playlistName: String
    var coverReference: String?
    var createdAt: Date
    /// Ordered song IDs; array order is playback order.
    var songIDs: [UUID]

    init(id: UUID = UUID(), playlistName: String, coverReference: String? = nil,
         createdAt: Date = .now, songIDs: [UUID] = []) {
        self.id = id
        self.playlistName = playlistName
        self.coverReference = coverReference
        self.createdAt = createdAt
        self.songIDs = songIDs
    }
}
