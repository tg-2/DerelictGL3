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
module derelict.opengl.extensions.arb_s;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_sample_shading
enum ARB_sample_shading = "GL_ARB_sample_shading";
enum arbSampleShadingDecls =
q{
enum : uint
{
    GL_SAMPLE_SHADING_ARB             = 0x8C36,
    GL_MIN_SAMPLE_SHADING_VALUE_ARB   = 0x8C37,
}
extern(System) @nogc nothrow alias da_glMinSampleShadingARB = void function(GLclampf);
};

enum arbSampleShadingFuncs = `da_glMinSampleShadingARB glMinSampleShadingARB;`;
enum arbSampleShadingLoaderImpl = `bindGLFunc(cast(void**)&glMinSampleShadingARB, "glMinSampleShadingARB");`;
enum arbSampleShadingLoader = makeExtLoader(ARB_sample_shading, arbSampleShadingLoaderImpl);
static if(!usingContexts) enum arbSampleShading = arbSampleShadingDecls ~ arbSampleShadingFuncs ~ arbSampleShadingLoader;

// ARB_shader_bit_encoding
enum ARB_shader_bit_encoding = "GL_ARB_shader_bit_encoding";
enum arbShaderBitEncodingLoader = makeExtLoader(ARB_shader_bit_encoding);
static if(!usingContexts) enum arbShaderBitEncoding = arbShaderBitEncodingLoader;

// ARB_shading_language_include
enum ARB_shading_language_include = "GL_ARB_shading_language_include";
enum arbShadingLanguageIncludeDecls =
q{
enum : uint
{
    GL_SHADER_INCLUDE_ARB             = 0x8DAE,
    GL_NAMED_STRING_LENGTH_ARB        = 0x8DE9,
    GL_NAMED_STRING_TYPE_ARB          = 0x8DEA,
}
extern(System) @nogc nothrow {
    alias da_glNamedStringARB = void function(GLenum, GLint, const(GLchar)*, GLint, const(GLchar)*);
    alias da_glDeleteNamedStringARB = void function(GLint, const(GLchar)*);
    alias da_glCompileShaderIncludeARB = void function(GLuint, GLsizei, const(GLchar)*, const(GLint)*);
    alias da_glIsNamedStringARB = GLboolean function(GLint, const(GLchar)*);
    alias da_glGetNamedStringARB = void function(GLint, const(GLchar)*, GLsizei, GLint*, GLchar*);
    alias da_glGetNamedStringivARB = void function(GLint, const(GLchar)*, GLenum, GLint*);
}};

enum arbShadingLanguageIncludeFuncs =
q{
    da_glNamedStringARB glNamedStringARB;
    da_glDeleteNamedStringARB glDeleteNamedStringARB;
    da_glCompileShaderIncludeARB glCompileShaderIncludeARB;
    da_glIsNamedStringARB glIsNamedStringARB;
    da_glGetNamedStringARB glGetNamedStringARB;
    da_glGetNamedStringivARB glGetNamedStringivARB;
};

enum arbShadingLanguageIncludeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glNamedStringARB, "glNamedStringARB");
    bindGLFunc(cast(void**)&glDeleteNamedStringARB, "glDeleteNamedStringARB");
    bindGLFunc(cast(void**)&glCompileShaderIncludeARB, "glCompileShaderIncludeARB");
    bindGLFunc(cast(void**)&glIsNamedStringARB, "glIsNamedStringARB");
    bindGLFunc(cast(void**)&glGetNamedStringARB, "glGetNamedStringARB");
    bindGLFunc(cast(void**)&glGetNamedStringivARB, "glGetNamedStringivARB");
};

enum arbShadingLanguageIncludeLoader = makeExtLoader(ARB_shading_language_include, arbShadingLanguageIncludeLoaderImpl);
static if(!usingContexts) enum arbShadingLanguageInclude = arbShadingLanguageIncludeDecls ~ arbShadingLanguageIncludeFuncs ~ arbShadingLanguageIncludeLoader;

// ARB_shading_language_packing
enum ARB_shading_language_packing = "GL_ARB_shading_language_packing";
enum arbShadingLanguagePackingLoader = makeExtLoader(ARB_shading_language_packing);
static if(!usingContexts) enum arbShadingLanguagePacking = arbShadingLanguagePackingLoader;

// ARB_shader_stencil_export
enum ARB_shader_stencil_export = "GL_ARB_shader_stencil_export";
enum arbShaderStencilExportLoader = makeExtLoader(ARB_shader_stencil_export);
static if(!usingContexts) enum arbShaderStencilExport = arbShaderStencilExportLoader;