workspace "Rebi"
	architecture "x64"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	startproject "Rebi"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "vendor/GLFW/include"
IncludeDir["Glad"] = "vendor/GLAD/include"
IncludeDir["stb_image"] = "vendor/stb_image"
IncludeDir["GLM"] = "vendor/GLM"

include "vendor/GLFW"
include "vendor/GLAD"

project "Rebi"
	location ""
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir  ("bin/" .. outputdir  .. "/%{prj.name}")
	objdir  ("bin-int/" .. outputdir  .. "/%{prj.name}")

	files 
	{
		"src/**.h",
		"src/**.cpp",
		"vendor/GLAD/src/glad.c",
		"vendor/stb_image/**.h",
		"vendor/stb_image/**.cpp",
		"vendor/GLM/glm/**.hpp",
		"vendor/GLM/glm/**.inl"		
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",	
		"GLFW_INCLUDE_NONE"
	}

	includedirs
	{
		"src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.stb_image}",
		"%{IncludeDir.GLM}",
		"shaders",
		"textures"
	}
	
	links
	{
		"GLFW",
		"Glad"
	}
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		symbols "on"

	filter "configurations:Dist"
		runtime "Release"
		symbols "on"

	filter { "system:windows" }
		links { "OpenGL32" }
		
	filter { "system:linux" }
		links { "GL", "GLU", "dl", "glfw", "X11", "pthread" }
