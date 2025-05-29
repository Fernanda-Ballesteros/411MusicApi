import Fluent

struct CreateAlbum : AsyncMigration {
    func prepare(on database: any Database) async throws {
       try await database.schema("albums")
            .id()
            .field("title", .string, .required)
            .field("image", .custom("VARCHAR(500)"), .required)
            .field("description", .date, .required)
            .field("artist", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("albums").delete()
    }
}