Application "PLoopSite" (function(_ENV)

    -----------------------------------------------------------
    --               Web Application Settings                --
    -----------------------------------------------------------
    _Config 					= {
        PLoopSite              	= {
            Redis               = {
                host            = "127.0.0.1",
                port            = 6379,
            },
            MySQL               = {
                host            = "127.0.0.1",
                port            = 3306,
                database        = "PLoopSite",
                user            = "psadmin",
                password        = "Site12345",
                charset         = "utf8mb4",
                max_packet_size = 2 * 1024 * 1024,
            },
        },

        ErrorHandler            = function(err, stack, context)
            if context.ProcessPhase == System.Web.IHttpContextHandler.ProcessPhase.Final then
                error(err, stack)
            else
                context:ProcessInnerRequest("/error", { error = err })
                context.Response:Close()
            end
        end,

        File                    = {
            MaxSize             = 30 * 1024 * 1024, -- 30M
        },

        View                    = {
            Temporary           = "/temp",

            Default             = {
                export          = {
                    url         = function (path) return _ENV:Path2Url(path) end,
                    default     = function(val, default) return val and val ~= "" and val or default end,
                }
            }
        },
    }
end)