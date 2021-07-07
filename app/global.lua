Application "PLoopSite" (function(_ENV)
    namespace "PLoopSite"

    import "System.Serialization"
    import "System.Configuration"
    import "System.Data"

    -----------------------------------------------------------
    --                 PLoopSite HttpContext                 --
    -----------------------------------------------------------
    __Sealed__() class "HttpContext" { NgxLua.HttpContext,
        __ctor                  = function(self)
            self.Application    = _ENV
            ngx.ctx[HttpContext]= self
        end
    }

    __Static__() function HttpContext.GetCurrentContext()
        return ngx.ctx[HttpContext]
    end
end)