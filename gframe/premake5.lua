include "lzma/."

project "ygopro"
    kind "ConsoleApp"
	
    defines { "YGOPRO_SERVER_MODE" }

    files { "gframe.cpp", "config.h",
            "game.cpp", "game.h", "myfilesystem.h",
            "deck_manager.cpp", "deck_manager.h",
            "data_manager.cpp", "data_manager.h",
            "replay.cpp", "replay.h",
            "netserver.cpp", "netserver.h",
            "single_duel.cpp", "single_duel.h",
            "tag_duel.cpp", "tag_duel.h" }
    includedirs { "../ocgcore" }
    links { "ocgcore", "clzma", "lua", "sqlite", "event"}

    if BUILD_EVENT then
    	includedirs { "../event/include" }
    end

    if BUILD_SQLITE then
        includedirs { "../sqlite" }
    end

    filter "system:windows"
        defines { "_IRR_WCHAR_FILESYSTEM" }
        files "ygopro.rc"
        links { "ws2_32" }
    filter "not action:vs*"
        buildoptions { "-std=c++14", "-fno-rtti" }
    filter "not system:windows"
        links { "event_pthreads", "dl", "pthread" }
