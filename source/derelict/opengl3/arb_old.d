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

version(None):
private {
    import derelict.util.system;
    import derelict.opengl3.types;
    import derelict.opengl3.constants;
    import derelict.opengl3.internal;
}

enum : uint {

    // ARB_texture_cube_map_array
    GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009,
    GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A,
    GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B,
    GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C,
    GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D,
    GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E,
    GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F,

    // ARB_texture_gather
    GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
    GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,


    // ARB_texture_compression_bptc
    GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C,
    GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D,
    GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E,
    GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F,



    // ARB_texture_rgb10_a2ui
    GL_RGB10_A2UI                     = 0x906F,

    // ARB_texture_swizzle
    GL_TEXTURE_SWIZZLE_R              = 0x8E42,
    GL_TEXTURE_SWIZZLE_G              = 0x8E43,
    GL_TEXTURE_SWIZZLE_B              = 0x8E44,
    GL_TEXTURE_SWIZZLE_A              = 0x8E45,
    GL_TEXTURE_SWIZZLE_RGBA           = 0x8E46,

    // ARB_timer_query
    GL_TIME_ELAPSED                   = 0x88BF,
    GL_TIMESTAMP                      = 0x8E28,

    // ARB_vertex_type_2_10_10_10_rev
    GL_INT_2_10_10_10_REV             = 0x8D9F,


    // ARB_query_buffer_object
    GL_QUERY_BUFFER                   = 0x9192,
    GL_QUERY_BUFFER_BARRIER_BIT       = 0x00008000,
    GL_QUERY_BUFFER_BINDING           = 0x9193,
    GL_QUERY_RESULT_NO_WAIT           = 0x9194,

    // ARB_texture_mirror_clamp_to_edge
    GL_MIRROR_CLAMP_TO_EDGE           = 0x8743,

    // KHR_context_flush_control
    GL_CONTEXT_RELEASE_BEHAVIOR       = 0x82FB,
    GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x82FC,

}
private __gshared bool _ARB_vertex_array_bgra;
@nogc bool ARB_vertex_array_bgra() nothrow @property { return _ARB_vertex_array_bgra; }

private __gshared bool _ARB_texture_cube_map_array;
@nogc bool ARB_texture_cube_map_array() nothrow @property { return _ARB_texture_cube_map_array; }

private __gshared bool _ARB_texture_gather;
@nogc bool ARB_texture_gather() nothrow @property { return _ARB_texture_gather; }

private __gshared bool _ARB_texture_query_lod;
@nogc bool ARB_texture_query_lod() nothrow @property { return _ARB_texture_query_lod; }

private __gshared bool _ARB_texture_compression_bptc;
@nogc bool ARB_texture_compression_bptc() nothrow @property { return _ARB_texture_compression_bptc; }

private __gshared bool _ARB_texture_rgb10_a2ui;
@nogc bool ARB_texture_rgb10_a2ui() nothrow @property { return _ARB_texture_rgb10_a2ui; }

private __gshared bool _ARB_texture_swizzle;
@nogc bool ARB_texture_swizzle() nothrow @property { return _ARB_texture_swizzle; }

private __gshared bool _ARB_texture_buffer_object_rgb32;
@nogc bool ARB_texture_buffer_object_rgb32() nothrow @property { return _ARB_texture_buffer_object_rgb32; }

// ARB_timer_query
extern( System ) @nogc nothrow {
    alias da_glQueryCounter = void function( GLuint, GLenum );
    alias da_glGetQueryObjecti64v = void function( GLuint, GLenum, GLint64* );
    alias da_glGetQueryObjectui64v = void function( GLuint, GLenum, GLuint64* );
}

__gshared {
    da_glQueryCounter glQueryCounter;
    da_glGetQueryObjecti64v glGetQueryObjecti64v;
    da_glGetQueryObjectui64v glGetQueryObjectui64v;
}

private __gshared bool _ARB_timer_query;
@nogc bool ARB_timer_query() nothrow @property { return _ARB_timer_query; }
void load_ARB_timer_query( bool doThrow = false ) {
    try {
        bindGLFunc( cast( void** )&glQueryCounter, "glQueryCounter" );
        bindGLFunc( cast( void** )&glGetQueryObjecti64v, "glGetQueryObjecti64v" );
        bindGLFunc( cast( void** )&glGetQueryObjectui64v, "glGetQueryObjectui64v" );
        _ARB_timer_query = true;
    } catch( Exception e ) {
        _ARB_timer_query = false;
        if( doThrow ) throw e;
    }
}

// ARB_vertex_type_2_10_10_10_rev
extern( System ) @nogc nothrow {
    alias da_glVertexP2ui = void function( GLenum, GLuint );
    alias da_glVertexP2uiv = void function( GLenum, const( GLuint )* );
    alias da_glVertexP3ui = void function( GLenum, GLuint );
    alias da_glVertexP3uiv = void function( GLenum, const( GLuint )* );
    alias da_glVertexP4ui = void function( GLenum, GLuint );
    alias da_glVertexP4uiv = void function( GLenum, const( GLuint )* );
    alias da_glTexCoordP1ui = void function( GLenum, GLuint );
    alias da_glTexCoordP1uiv = void function( GLenum, const( GLuint )* );
    alias da_glTexCoordP2ui = void function( GLenum, GLuint );
    alias da_glTexCoordP2uiv = void function( GLenum, const( GLuint )* );
    alias da_glTexCoordP3ui = void function( GLenum, GLuint );
    alias da_glTexCoordP3uiv = void function( GLenum, const( GLuint )* );
    alias da_glTexCoordP4ui = void function( GLenum, GLuint );
    alias da_glTexCoordP4uiv = void function( GLenum, const( GLuint )* );
    alias da_glMultiTexCoordP1ui = void function( GLenum, GLenum, GLuint );
    alias da_glMultiTexCoordP1uiv = void function( GLenum, GLenum, const( GLuint )* );
    alias da_glMultiTexCoordP2ui = void function( GLenum, GLenum, GLuint );
    alias da_glMultiTexCoordP2uiv = void function( GLenum, GLenum, const( GLuint )* );
    alias da_glMultiTexCoordP3ui = void function( GLenum, GLenum, GLuint );
    alias da_glMultiTexCoordP3uiv = void function( GLenum, GLenum, const( GLuint )* );
    alias da_glMultiTexCoordP4ui = void function( GLenum, GLenum, GLuint );
    alias da_glMultiTexCoordP4uiv = void function( GLenum, GLenum, const( GLuint )* );
    alias da_glNormalP3ui = void function( GLenum, GLuint );
    alias da_glNormalP3uiv = void function( GLenum, const( GLuint )* );
    alias da_glColorP3ui = void function( GLenum, GLuint );
    alias da_glColorP3uiv = void function( GLenum, const( GLuint )* );
    alias da_glColorP4ui = void function( GLenum, GLuint );
    alias da_glColorP4uiv = void function( GLenum, const( GLuint )* );
    alias da_glSecondaryColorP3ui = void function( GLenum, GLuint );
    alias da_glSecondaryColorP3uiv = void function( GLenum, const( GLuint )* );
    alias da_glVertexAttribP1ui = void function( GLuint, GLenum, GLboolean, GLuint );
    alias da_glVertexAttribP1uiv = void function( GLuint, GLenum, GLboolean, const( GLuint )* );
    alias da_glVertexAttribP2ui = void function( GLuint, GLenum, GLboolean, GLuint );
    alias da_glVertexAttribP2uiv = void function( GLuint, GLenum, GLboolean, const( GLuint )* );
    alias da_glVertexAttribP3ui = void function( GLuint, GLenum, GLboolean, GLuint );
    alias da_glVertexAttribP3uiv = void function( GLuint, GLenum, GLboolean, const( GLuint )* );
    alias da_glVertexAttribP4ui = void function( GLuint, GLenum, GLboolean, GLuint );
    alias da_glVertexAttribP4uiv = void function( GLuint, GLenum, GLboolean, const( GLuint )* );
}

__gshared {
    da_glVertexP2ui glVertexP2ui;
    da_glVertexP2uiv glVertexP2uiv;
    da_glVertexP3ui glVertexP3ui;
    da_glVertexP3uiv glVertexP3uiv;
    da_glVertexP4ui glVertexP4ui;
    da_glVertexP4uiv glVertexP4uiv;
    da_glTexCoordP1ui glTexCoordP1ui;
    da_glTexCoordP1uiv glTexCoordP1uiv;
    da_glTexCoordP2ui glTexCoordP2ui;
    da_glTexCoordP2uiv glTexCoordP2uiv;
    da_glTexCoordP3ui glTexCoordP3ui;
    da_glTexCoordP3uiv glTexCoordP3uiv;
    da_glTexCoordP4ui glTexCoordP4ui;
    da_glTexCoordP4uiv glTexCoordP4uiv;
    da_glMultiTexCoordP1ui glMultiTexCoordP1ui;
    da_glMultiTexCoordP1uiv glMultiTexCoordP1uiv;
    da_glMultiTexCoordP2ui glMultiTexCoordP2ui;
    da_glMultiTexCoordP2uiv glMultiTexCoordP2uiv;
    da_glMultiTexCoordP3ui glMultiTexCoordP3ui;
    da_glMultiTexCoordP3uiv glMultiTexCoordP3uiv;
    da_glMultiTexCoordP4ui glMultiTexCoordP4ui;
    da_glMultiTexCoordP4uiv glMultiTexCoordP4uiv;
    da_glNormalP3ui glNormalP3ui;
    da_glNormalP3uiv glNormalP3uiv;
    da_glColorP3ui glColorP3ui;
    da_glColorP3uiv glColorP3uiv;
    da_glColorP4ui glColorP4ui;
    da_glColorP4uiv glColorP4uiv;
    da_glSecondaryColorP3ui glSecondaryColorP3ui;
    da_glSecondaryColorP3uiv glSecondaryColorP3uiv;
    da_glVertexAttribP1ui glVertexAttribP1ui;
    da_glVertexAttribP1uiv glVertexAttribP1uiv;
    da_glVertexAttribP2ui glVertexAttribP2ui;
    da_glVertexAttribP2uiv glVertexAttribP2uiv;
    da_glVertexAttribP3ui glVertexAttribP3ui;
    da_glVertexAttribP3uiv glVertexAttribP3uiv;
    da_glVertexAttribP4ui glVertexAttribP4ui;
    da_glVertexAttribP4uiv glVertexAttribP4uiv;
}

private __gshared bool _ARB_vertex_type_2_10_10_10_rev;
@nogc bool ARB_vertex_type_2_10_10_10_rev() nothrow @property { return _ARB_vertex_type_2_10_10_10_rev; }
package void load_ARB_vertex_type_2_10_10_10_rev( bool doThrow = false ) {
    try {
        static if( !Derelict_OS_Mac ) {
            bindGLFunc( cast( void** )&glVertexP2ui, "glVertexP2ui" );
            bindGLFunc( cast( void** )&glVertexP2uiv, "glVertexP2uiv" );
            bindGLFunc( cast( void** )&glVertexP3ui, "glVertexP3ui" );
            bindGLFunc( cast( void** )&glVertexP3uiv, "glVertexP3uiv" );
            bindGLFunc( cast( void** )&glVertexP4ui, "glVertexP4ui" );
            bindGLFunc( cast( void** )&glVertexP4uiv, "glVertexP4uiv" );
            bindGLFunc( cast( void** )&glTexCoordP1ui, "glTexCoordP1ui" );
            bindGLFunc( cast( void** )&glTexCoordP1uiv, "glTexCoordP1uiv" );
            bindGLFunc( cast( void** )&glTexCoordP2ui, "glTexCoordP2ui" );
            bindGLFunc( cast( void** )&glTexCoordP2uiv, "glTexCoordP2uiv" );
            bindGLFunc( cast( void** )&glTexCoordP3ui, "glTexCoordP3ui" );
            bindGLFunc( cast( void** )&glTexCoordP3uiv, "glTexCoordP3uiv" );
            bindGLFunc( cast( void** )&glTexCoordP4ui, "glTexCoordP4ui" );
            bindGLFunc( cast( void** )&glTexCoordP4uiv, "glTexCoordP4uiv" );
            bindGLFunc( cast( void** )&glMultiTexCoordP1ui, "glMultiTexCoordP1ui" );
            bindGLFunc( cast( void** )&glMultiTexCoordP1uiv, "glMultiTexCoordP1uiv" );
            bindGLFunc( cast( void** )&glMultiTexCoordP2ui, "glMultiTexCoordP2ui" );
            bindGLFunc( cast( void** )&glMultiTexCoordP2uiv, "glMultiTexCoordP2uiv" );
            bindGLFunc( cast( void** )&glMultiTexCoordP3ui, "glMultiTexCoordP3ui" );
            bindGLFunc( cast( void** )&glMultiTexCoordP3uiv, "glMultiTexCoordP3uiv" );
            bindGLFunc( cast( void** )&glMultiTexCoordP4ui, "glMultiTexCoordP4ui" );
            bindGLFunc( cast( void** )&glMultiTexCoordP4uiv, "glMultiTexCoordP4uiv" );
            bindGLFunc( cast( void** )&glNormalP3ui, "glNormalP3ui" );
            bindGLFunc( cast( void** )&glNormalP3uiv, "glNormalP3uiv" );
            bindGLFunc( cast( void** )&glColorP3ui, "glColorP3ui" );
            bindGLFunc( cast( void** )&glColorP3uiv, "glColorP3uiv" );
            bindGLFunc( cast( void** )&glColorP4ui, "glColorP4ui" );
            bindGLFunc( cast( void** )&glColorP4uiv, "glColorP4uiv" );
            bindGLFunc( cast( void** )&glSecondaryColorP3ui, "glSecondaryColorP3ui" );
            bindGLFunc( cast( void** )&glSecondaryColorP3uiv, "glSecondaryColorP3uiv" );
        }
        bindGLFunc( cast( void** )&glVertexAttribP1ui, "glVertexAttribP1ui" );
        bindGLFunc( cast( void** )&glVertexAttribP1uiv, "glVertexAttribP1uiv" );
        bindGLFunc( cast( void** )&glVertexAttribP2ui, "glVertexAttribP2ui" );
        bindGLFunc( cast( void** )&glVertexAttribP2uiv, "glVertexAttribP2uiv" );
        bindGLFunc( cast( void** )&glVertexAttribP3ui, "glVertexAttribP3ui" );
        bindGLFunc( cast( void** )&glVertexAttribP3uiv, "glVertexAttribP3uiv" );
        bindGLFunc( cast( void** )&glVertexAttribP4ui, "glVertexAttribP4ui" );
        bindGLFunc( cast( void** )&glVertexAttribP4uiv, "glVertexAttribP4uiv" );
        _ARB_vertex_type_2_10_10_10_rev = true;
    } catch( Exception e ) {
        _ARB_vertex_type_2_10_10_10_rev = false;
        if( doThrow ) throw e;
    }
}

// ARB_shader_image_size
private __gshared bool _ARB_shader_image_size;
@nogc bool ARB_shader_image_size() nothrow @property { return _ARB_shader_image_size; }

// ARB_shader_storage_buffer_object
extern( System )
__gshared
private __gshared bool _ARB_shader_storage_buffer_object;
@nogc bool ARB_shader_storage_buffer_object() nothrow @property { return _ARB_shader_storage_buffer_object; }
package void load_ARB_shader_storage_buffer_object( bool doThrow = false ) {
    try {

        _ARB_shader_storage_buffer_object = true;
    } catch( Exception e ) {
        _ARB_shader_storage_buffer_object = false;
        if( doThrow ) throw e;
    }
}

// ARB_texture_query_levels
private __gshared bool _ARB_texture_query_levels;
@nogc bool ARB_texture_query_levels() nothrow @property { return _ARB_texture_query_levels; }

// ARB_query_buffer_object
private __gshared bool _ARB_query_buffer_object;
@nogc bool ARB_query_buffer_object() nothrow @property { return _ARB_query_buffer_object; }

// ARB_texture_mirror_clamp_to_edge
private __gshared bool _ARB_texture_mirror_clamp_to_edge;
@nogc bool ARB_texture_mirror_clamp_to_edge() nothrow @property { return _ARB_texture_mirror_clamp_to_edge; }

// ARB_texture_stencil8
private __gshared bool _ARB_texture_stencil8;
@nogc bool ARB_texture_stencil8() nothrow @property { return _ARB_texture_stencil8; }

// ARB_vertex_type_10f_11f_11f_rev
private __gshared bool _ARB_vertex_type_10f_11f_11f_rev;
@nogc bool ARB_vertex_type_10f_11f_11f_rev() nothrow @property { return _ARB_vertex_type_10f_11f_11f_rev; }

// KHR_context_flush_control
private __gshared bool _KHR_context_flush_control;
@nogc bool KHR_context_flush_control() nothrow @property { return _KHR_context_flush_control; }

// ARB_derivative_control
private __gshared bool _ARB_derivative_control;
@nogc bool ARB_derivative_control() nothrow @property { return _ARB_derivative_control; }

// ARB_shader_texture_image_samples
private __gshared bool _ARB_shader_texture_image_samples;
@nogc bool ARB_shader_texture_image_samples() nothrow @property { return _ARB_shader_texture_image_samples; }
