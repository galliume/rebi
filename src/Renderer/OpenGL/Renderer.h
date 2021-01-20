#pragma once

#include <glad/glad.h>
#include <GLFW/glfw3.h>

class Renderer
{
public:
	Renderer(bool drawAsPolygon = false);
	static void Clear();
	static void DrawArrays(GLsizei count, GLenum mode = GL_TRIANGLES);
	static void DrawElements(GLsizei count, GLenum mode = GL_TRIANGLES);
};