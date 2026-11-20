import Foundation
import SwiftData

@Model
final class Artist {
    @Attribute(.unique) var id: UUID
    var artistName: String
    var artistImageReference: String?
    var songs: [Song] = []

    init(id: UUID = UUID(), artistName: String, artistImageReference: String? = nil) {
        self.id = id
        self.artistName = artistName
        self.artistImageReference = artistImageReference
    }
}
