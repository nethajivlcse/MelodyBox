import Foundation
import SwiftData

@Model
final class PlaybackHistory {
    @Attribute(.unique) var id: UUID
    var songID: UUID
    var playedAt: Date
    var playCount: Int

    init(id: UUID = UUID(), songID: UUID, playedAt: Date = .now, playCount: Int = 1) {
        self.id = id
        self.songID = songID
        self.playedAt = playedAt
        self.playCount = playCount
    }
}
