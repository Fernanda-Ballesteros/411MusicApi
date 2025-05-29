import Vapor
struct AlbumDTO : Content {
    var id: UUID?
    var title: String
    var artist: String
    var description: String
    var image: String?
    
    init(id: UUID? = nil, title: String, artist: String, description: String, image: String? = nil) {
        self.id = id
        self.title = title
        self.artist = artist
        self.description = description
        self.image = image
    }
}