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
module derelict.opengl.gl;

import std.array;
import derelict.util.loader,
       derelict.util.system;

import derelict.opengl.glloader,
       derelict.opengl.types : GLVersion;

version(DerelictGL3_Contexts) {}
else version = DerelictGL3_NoContexts;

final class DerelictGL3Loader : SharedLibLoader
{
    this() { super(libNames); }

    version(DerelictGL3_NoContexts) {
        GLLoader glLoader;
        alias glLoader this;

        GLVersion reload() { return glLoader.loadExtra(); }
    }

protected:
    override void loadSymbols()
    {
        version(DerelictGL3_NoContexts) glLoader.loadBase();
    }
}

__gshared DerelictGL3Loader DerelictGL3;

shared static this() {
    DerelictGL3 = new DerelictGL3Loader;
}

private:
    static if(Derelict_OS_Android || Derelict_OS_iOS) {
        // Android and iOS do not support OpenGL3; use DerelictOpenGLES.
        static assert(false, "OpenGL is not supported on Android or iOS; use OpenGLES (DerelictGLES) instead");
    } else static if(Derelict_OS_Windows) {
        private enum libNames = "opengl32.dll";
    } else static if(Derelict_OS_Mac) {
        private enum libNames = "../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL";
    } else static if(Derelict_OS_Posix) {
        private enum libNames = "libGL.so.1,libGL.so";
    } else
        static assert(0, "Need to implement OpenGL libNames for this operating system.");
