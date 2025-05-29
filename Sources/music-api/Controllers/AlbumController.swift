import Vapor
import Fluent

struct AlbumController : RouteCollection {

    func boot(routes: any RoutesBuilder) throws {
        let albums = routes.grouped("albums")

        albums.get(use: self.getAlbums)
        albums.post(use: self.createAlbum)
    }


    func getAlbums(req: Request) async throws -> [AlbumDTO] {
        var albumsMock : [AlbumDTO] = []
        let albumsDB = try await Album.query(on: req.db).all()
        albumsDB.forEach { album in
            var albumDTO = AlbumDTO(id: album.id, title: album.title, artist: album.artist, description: album.description, image: album.image)
            albumsMock.append(albumDTO)
        }
        return albumsMock
    }

    func createAlbum(req: Request) async throws -> AlbumDTO {
        let dto = try req.content.decode(AlbumDTO.self)
        let album = Album(id: UUID(), title: dto.title, description: dto.description, artist: dto.artist, image: dto.image ?? "https://example.com/default-image.jpg")
        try await album.save(on: req.db)
        return dto
    }
}
