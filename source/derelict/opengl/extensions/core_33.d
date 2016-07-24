/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.core_33;

import derelict.opengl.types,
       derelict.opengl.extensions.internal;

// ARB_blend_func_extended
enum ARB_blend_func_extended = "GL_ARB_blend_func_extended";
enum arbBlendFuncExtendedDecls =
q{
enum : uint
{
    GL_SRC1_COLOR                     = 0x88F9,
    GL_ONE_MINUS_SRC1_COLOR           = 0x88FA,
    GL_ONE_MINUS_SRC1_ALPHA           = 0x88FB,
    GL_MAX_DUAL_SOURCE_DRAW_BUFFERS   = 0x88FC,
}
extern(System) @nogc nothrow {
    alias da_glBindFragDataLocationIndexed = void function( GLuint, GLuint, GLuint, const( GLchar )* );
    alias da_glGetFragDataIndex = GLint function( GLuint, const( GLchar )* );
}};

enum arbBlendFuncExtendedFuncs =
q{
    da_glBindFragDataLocationIndexed glBindFragDataLocationIndexed;
    da_glGetFragDataIndex glGetFragDataIndex;
};

enum arbBlendFuncExtendedLoaderImpl =
q{
    bindGLFunc( cast( void** )&glBindFragDataLocationIndexed, "glBindFragDataLocationIndexed" );
    bindGLFunc( cast( void** )&glGetFragDataIndex, "glGetFragDataIndex" );
};

enum arbBlendFuncExtendedLoader = makeLoader(ARB_blend_func_extended, arbBlendFuncExtendedLoaderImpl, "gl33");
enum arbBlendFuncExtended = arbBlendFuncExtendedDecls ~ arbBlendFuncExtendedFuncs.makeGShared() ~ arbBlendFuncExtendedLoader;

// ARB_sampler_objects
enum ARB_sampler_objects = "GL_ARB_sampler_objects";
enum arbSamplerObjectsDecls =
q{
enum uint GL_SAMPLER_BINDING = 0x8919;
extern(System) @nogc nothrow {
    alias da_glGenSamplers = void function( GLsizei, GLuint* );
    alias da_glDeleteSamplers = void function( GLsizei, const( GLuint )* );
    alias da_glIsSampler = GLboolean function( GLuint );
    alias da_glBindSampler = void function( GLuint, GLuint );
    alias da_glSamplerParameteri = void function( GLuint, GLenum, GLint );
    alias da_glSamplerParameteriv = void function( GLuint, GLenum, const( GLint )* );
    alias da_glSamplerParameterf = void function( GLuint, GLenum, GLfloat );
    alias da_glSamplerParameterfv = void function( GLuint, GLenum, const( GLfloat )* );
    alias da_glSamplerParameterIiv = void function( GLuint, GLenum, const( GLint )* );
    alias da_glSamplerParameterIuiv = void function( GLuint, GLenum, const( GLuint )* );
    alias da_glGetSamplerParameteriv = void function( GLuint, GLenum, GLint* );
    alias da_glGetSamplerParameterIiv = void function( GLuint, GLenum, GLint* );
    alias da_glGetSamplerParameterfv = void function( GLuint, GLenum, GLfloat* );
    alias da_glGetSamplerParameterIuiv = void function( GLuint, GLenum, GLuint* );
}};

enum arbSamplerObjectsFuncs =
q{
    da_glGenSamplers glGenSamplers;
    da_glDeleteSamplers glDeleteSamplers;
    da_glIsSampler glIsSampler;
    da_glBindSampler glBindSampler;
    da_glSamplerParameteri glSamplerParameteri;
    da_glSamplerParameteriv glSamplerParameteriv;
    da_glSamplerParameterf glSamplerParameterf;
    da_glSamplerParameterfv glSamplerParameterfv;
    da_glSamplerParameterIiv glSamplerParameterIiv;
    da_glSamplerParameterIuiv glSamplerParameterIuiv;
    da_glGetSamplerParameteriv glGetSamplerParameteriv;
    da_glGetSamplerParameterIiv glGetSamplerParameterIiv;
    da_glGetSamplerParameterfv glGetSamplerParameterfv;
    da_glGetSamplerParameterIuiv glGetSamplerParameterIuiv;
};

enum arbSamplerObjectsLoaderImpl =
q{
    bindGLFunc( cast( void** )&glGenSamplers, "glGenSamplers" );
    bindGLFunc( cast( void** )&glDeleteSamplers, "glDeleteSamplers" );
    bindGLFunc( cast( void** )&glIsSampler, "glIsSampler" );
    bindGLFunc( cast( void** )&glBindSampler, "glBindSampler" );
    bindGLFunc( cast( void** )&glSamplerParameteri, "glSamplerParameteri" );
    bindGLFunc( cast( void** )&glSamplerParameteriv, "glSamplerParameteriv" );
    bindGLFunc( cast( void** )&glSamplerParameterf, "glSamplerParameterf" );
    bindGLFunc( cast( void** )&glSamplerParameterfv, "glSamplerParameterfv" );
    bindGLFunc( cast( void** )&glSamplerParameterIiv, "glSamplerParameterIiv" );
    bindGLFunc( cast( void** )&glSamplerParameterIuiv, "glSamplerParameterIuiv" );
    bindGLFunc( cast( void** )&glGetSamplerParameteriv, "glGetSamplerParameteriv" );
    bindGLFunc( cast( void** )&glGetSamplerParameterIiv, "glGetSamplerParameterIiv" );
    bindGLFunc( cast( void** )&glGetSamplerParameterfv, "glGetSamplerParameterfv" );
    bindGLFunc( cast( void** )&glGetSamplerParameterIuiv, "glGetSamplerParameterIuiv" );
};

enum arbSamplerObjectsLoader = makeLoader(ARB_sampler_objects, arbSamplerObjectsLoaderImpl, "gl33");
enum arbSamplerObjects = arbSamplerObjectsDecls ~ arbSamplerObjectsFuncs.makeGShared() ~ arbSamplerObjectsLoader;

enum corearb33 = arbBlendFuncExtended ~ arbSamplerObjects;
enum corearb33Decls = arbBlendFuncExtendedDecls ~ arbSamplerObjectsDecls;
enum corearb33Funcs = arbBlendFuncExtendedFuncs ~ arbSamplerObjectsFuncs;
enum corearb33Loader = arbBlendFuncExtendedLoaderImpl ~ arbSamplerObjectsLoaderImpl;