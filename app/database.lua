Application "PLoopSite" (function(_ENV)
    __Sealed__()
    class "Redis" (function(_ENV)
        inherit (NgxLua.Redis)

        -----------------------------------------------------------
        --                   static property                     --
        -----------------------------------------------------------
        __Static__() property "ConnectionOption" { type = NgxLua.Redis.ConnectionOption }

        -----------------------------------------------------------
        --                      constructor                      --
        -----------------------------------------------------------
        function __ctor(self)
            self.Option         = Redis.ConnectionOption
        end
    end)

    __Sealed__() __DataContext__()
    class "DataContext" (function(_ENV)
        export { NgxLua.MySQL.MySQLConnection, DataContext }

        local DATABASE_INITED   = false

        --------------------------------------------------
        --               static property                --
        --------------------------------------------------
        __Static__() property "ConnectionOption" { type = NgxLua.MySQL.ConnectionOption }

        --------------------------------------------------
        --                    method                    --
        --------------------------------------------------
        function Open(self)
            super.Open(self)

            -- Create Non existed data table based on the data contexts declare in the namespace
            if not DATABASE_INITED then
                DATABASE_INITED = true
                self.Connection:CreateNonExistTables(PLoopSite)
            end
        end

        --------------------------------------------------
        --                 constructor                  --
        --------------------------------------------------
        __Arguments__{}
        function __ctor(self)
            self.Connection     = MySQLConnection (DataContext.ConnectionOption)
            self.Connection.TimeOut = 5000
        end
    end)

    __ConfigSection__(Application.ConfigSection.PLoopSite, "Redis", NgxLua.Redis.ConnectionOption)
    function applyRedisSetting(field, value, app)
        Redis.ConnectionOption  = value
    end

    __ConfigSection__(Application.ConfigSection.PLoopSite, "MySQL", NgxLua.MySQL.ConnectionOption)
    function applyMySqlSetting(field, value, app)
        DataContext.ConnectionOption = value
    end
end)