Application "PLoopSite" (function(_ENV)

    local function parseUrl(url)
        local root              = PLoop

        for k in url:gmatch("[_%w]+") do
            local v             = root[k]
            if not Namespace.Validate(v) then return false end
            root                = v
        end

        return root
    end

    __Route__ "/error"
    __Text__() function route_error(context)
        return context.Request.QueryString["error"] or "The server encountered an unexpected error"
    end

    -- /api/topic/1
    -- /api/topic/1/edit
    -- /api/topic/edit/1
    -- /api/topic/1/reply  /topic/reply/1
    __Route__ "/api/{controller?|%a*}/{id?|%d*}/{action?|%a*}/{sid?|%d*}/{saction?|%a*}/{tid?|%d*}"
    function route_api(request, controller, id, action, sid, saction, tid)
        controller              = controller ~= "" and controller or "topic"
        action                  = action     ~= "" and action     or "index"
        saction                 = saction    ~= "" and saction    or nil

        id                      = tonumber(id)
        sid                     = tonumber(sid)
        tid                     = tonumber(tid)

        if not id then
            id, sid, tid        = sid, tid, nil
        end

        sid                     = sid or tid

        if not saction and sid then
            saction             = "index"
        end

        return ("/controller/%scontroller.lua"):format(controller), { Action = saction and (action .. "/" .. saction) or action, ID = id, SID = sid }
    end

    -- /PLoop.System.Collections.List
    __Route__ ".*" __View__()
    function route_view(context)
        local ret               = parseUrl(context.Request.Url)
        if not ret then return context.Response:Redirect("/") end

        if Enum.Validate(ret) then
            return "/view/enum.view", { Type = ret }
        elseif Struct.Validate(ret) then
            return "/view/struct.view", { Type = ret }
        elseif Interface.Validate(ret) then
            return "/view/interface.view", { Type = ret }
        elseif Class.Validate(ret) then
            return "/view/class.view", { Type = ret }
        elseif getmetatable(ret) == ret then
            return "/view/prototype.view", { Type = ret }
        else
            return "/view/namespace.view", { Type = ret }
        end
    end
end)