Application "SEMSDE" (function(_ENV)

    -----------------------------------------------------------------------
    --                           Global Config                           --
    -----------------------------------------------------------------------
    Web.Config                  = {
        Debug                   = true,
        LogLevel                = System.Logger.LogLevel.Debug,
    }

    REDIS_CONNECTION_OPTIONS    = { host = "127.0.0.1", port = 6379 }

    MYSQL_CONNECTION_OPTIONS    = {
        host                    = "127.0.0.1",
        port                    = 3306,
        database                = "SEMSDE",
        user                    = "admin",
        password                = "Shdk*2018",
        charset                 = "utf8mb4",
        max_packet_size         = 2 * 1024 * 1024,
    }
end)