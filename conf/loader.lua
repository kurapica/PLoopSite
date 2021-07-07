PLOOP_PLATFORM_SETTINGS = { CORE_LOG_LEVEL = 3, ENABLE_CONTEXT_FEATURES = true, TYPE_VALIDATION_DISABLED = false, NAMESPACE_NIL_VALUE_ACCESSIBLE = false, ENV_ALLOW_GLOBAL_VAR_BE_NIL = false, THREAD_SAFE_ITERATOR = true }

require "NgxLua"

PLoop(function(_ENV)

    -----------------------------------------------------------------------
    --                         Global Web Config                         --
    -----------------------------------------------------------------------
    Web.Config                  = {
        Debug                   = true,
        LogLevel                = System.Logger.LogLevel.Debug,
    }

    -----------------------------------------------------------------------
    --                            Global API                             --
    -----------------------------------------------------------------------
    string.trim 				= Toolset.trim
end)

-- Load Web Application
require "app"