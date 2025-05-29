import NIOSSL
import Fluent
import FluentMySQLDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

app.databases.use(DatabaseConfigurationFactory.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "db-mysql-nyc3-23192-do-user-22404199-0.h.db.ondigitalocean.com",
        //
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 25060,
        username: Environment.get("DATABASE_USERNAME") ?? "doadmin",
        password: Environment.get("DATABASE_PASSWORD") ?? "AVNS_v1bsHLob8zGhCgIRZfw",
        database: Environment.get("DATABASE_NAME") ?? "music_db",
        //
        tlsConfiguration: .forClient(certificateVerification: .none)
    ), as: .mysql)

//migracion es la creacion de la tabla
 app.migrations.add(CreateAlbum())
 
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
