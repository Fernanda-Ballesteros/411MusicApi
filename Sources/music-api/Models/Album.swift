import Foundation
import Fluent

final class Album : Model, @unchecked Sendable {
    static let schema = "albums"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

   @Field(key: "description")
    var description: String

    @Field(key: "artist")
    var artist: String

    @Field(key: "image")
    var image: String

    init(){}

    init(id:UUID, title: String, description: String, artist: String, image: String) {
        self.id = id
        self.title = title
        self.description = description
        self.artist = artist
        self.image = image
    }
}