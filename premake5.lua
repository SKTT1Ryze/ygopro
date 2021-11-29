if os.ishost("windows") then
	BUILD_LUA = true
	BUILD_EVENT = true
	BUILD_SQLITE = true
else
	BUILD_LUA = true
	BUILD_EVENT = false --not implemented on linux
	BUILD_SQLITE = false
end

workspace "YGOPro"
    location "build"
    language "C++"
    objdir "obj"

    configurations { "Release", "Debug" }

    filter "system:windows"
        defines { "WIN32", "_WIN32" }
        systemversion "latest"

    filter "configurations:Release"
        targetdir "bin/release"

    filter "configurations:Debug"
        symbols "On"
        defines "_DEBUG"
        targetdir "bin/debug"

    filter { "configurations:Release", "action:vs*" }
        optimize "Speed"
        flags { "LinkTimeOptimization" }
        staticruntime "On"
        disablewarnings { "4244", "4267", "4838", "4577", "4819", "4018", "4996", "4477", "4091", "4828", "4800" }

    filter { "configurations:Release", "not action:vs*" }
        symbols "On"
        defines "NDEBUG"
        buildoptions "-march=native"

    filter { "configurations:Debug", "action:vs*" }
        defines { "_ITERATOR_DEBUG_LEVEL=0" }

    filter "action:vs*"
        vectorextensions "SSE2"
        buildoptions { "/utf-8" }
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "not action:vs*"
        buildoptions { "-fno-strict-aliasing", "-Wno-multichar" }

    filter {"not action:vs*", "system:windows"}
        buildoptions { "-static-libgcc" }

    filter {}

    startproject "ygopro"

    include "ocgcore"
    include "gframe"
    if BUILD_LUA then
		include "lua"
	end
	if BUILD_EVENT then
		include "event"
	end
    if BUILD_SQLITE then
		include "sqlite"
    end
