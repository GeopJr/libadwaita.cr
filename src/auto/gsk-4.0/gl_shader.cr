require "../g_object-2.0/object"

module Gsk
  # A `GskGLShader` is a snippet of GLSL that is meant to run in the
  # fragment shader of the rendering pipeline.
  #
  # A fragment shader gets the coordinates being rendered as input and
  # produces the pixel values for that particular pixel. Additionally,
  # the shader can declare a set of other input arguments, called
  # uniforms (as they are uniform over all the calls to your shader in
  # each instance of use). A shader can also receive up to 4
  # textures that it can use as input when producing the pixel data.
  #
  # `GskGLShader` is usually used with gtk_snapshot_push_gl_shader()
  # to produce a [class@Gsk.GLShaderNode] in the rendering hierarchy,
  # and then its input textures are constructed by rendering the child
  # nodes to textures before rendering the shader node itself. (You can
  # pass texture nodes as children if you want to directly use a texture
  # as input).
  #
  # The actual shader code is GLSL code that gets combined with
  # some other code into the fragment shader. Since the exact
  # capabilities of the GPU driver differs between different OpenGL
  # drivers and hardware, GTK adds some defines that you can use
  # to ensure your GLSL code runs on as many drivers as it can.
  #
  # If the OpenGL driver is GLES, then the shader language version
  # is set to 100, and GSK_GLES will be defined in the shader.
  #
  # Otherwise, if the OpenGL driver does not support the 3.2 core profile,
  # then the shader will run with language version 110 for GL2 and 130 for GL3,
  # and GSK_LEGACY will be defined in the shader.
  #
  # If the OpenGL driver supports the 3.2 code profile, it will be used,
  # the shader language version is set to 150, and GSK_GL3 will be defined
  # in the shader.
  #
  # The main function the shader must implement is:
  #
  # ```glsl
  #  void mainImage(out vec4 fragColor,
  #                 in vec2 fragCoord,
  #                 in vec2 resolution,
  #                 in vec2 uv)
  # ```
  #
  # Where the input @fragCoord is the coordinate of the pixel we're
  # currently rendering, relative to the boundary rectangle that was
  # specified in the `GskGLShaderNode`, and @resolution is the width and
  # height of that rectangle. This is in the typical GTK coordinate
  # system with the origin in the top left. @uv contains the u and v
  # coordinates that can be used to index a texture at the
  # corresponding point. These coordinates are in the [0..1]x[0..1]
  # region, with 0, 0 being in the lower left corder (which is typical
  # for OpenGL).
  #
  # The output @fragColor should be a RGBA color (with
  # premultiplied alpha) that will be used as the output for the
  # specified pixel location. Note that this output will be
  # automatically clipped to the clip region of the glshader node.
  #
  # In addition to the function arguments the shader can define
  # up to 4 uniforms for textures which must be called u_textureN
  # (i.e. u_texture1 to u_texture4) as well as any custom uniforms
  # you want of types int, uint, bool, float, vec2, vec3 or vec4.
  #
  # All textures sources contain premultiplied alpha colors, but if some
  # there are outer sources of colors there is a gsk_premultiply() helper
  # to compute premultiplication when needed.
  #
  # Note that GTK parses the uniform declarations, so each uniform has to
  # be on a line by itself with no other code, like so:
  #
  # ```glsl
  # uniform float u_time;
  # uniform vec3 u_color;
  # uniform sampler2D u_texture1;
  # uniform sampler2D u_texture2;
  # ```
  #
  # GTK uses the the "gsk" namespace in the symbols it uses in the
  # shader, so your code should not use any symbols with the prefix gsk
  # or GSK. There are some helper functions declared that you can use:
  #
  # ```glsl
  # vec4 GskTexture(sampler2D sampler, vec2 texCoords);
  # ```
  #
  # This samples a texture (e.g. u_texture1) at the specified
  # coordinates, and containes some helper ifdefs to ensure that
  # it works on all OpenGL versions.
  #
  # You can compile the shader yourself using [method@Gsk.GLShader.compile],
  # otherwise the GSK renderer will do it when it handling the glshader
  # node. If errors occurs, the returned @error will include the glsl
  # sources, so you can see what GSK was passing to the compiler. You
  # can also set GSK_DEBUG=shaders in the environment to see the sources
  # and other relevant information about all shaders that GSK is handling.
  #
  # # An example shader
  #
  # ```glsl
  # uniform float position;
  # uniform sampler2D u_texture1;
  # uniform sampler2D u_texture2;
  #
  # void mainImage(out vec4 fragColor,
  #                in vec2 fragCoord,
  #                in vec2 resolution,
  #                in vec2 uv) {
  #   vec4 source1 = GskTexture(u_texture1, uv);
  #   vec4 source2 = GskTexture(u_texture2, uv);
  #
  #   fragColor = position * source1 + (1.0 - position) * source2;
  # }
  # ```
  class GLShader < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, resource : ::String? = nil, source : GLib::Bytes? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if resource
        (_names.to_unsafe + _n).value = "resource".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource)
        _n += 1
      end
      if source
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLShader.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_gl_shader_get_type
    end

    def resource=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "resource", unsafe_value, Pointer(Void).null)
      value
    end

    def resource : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "resource", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def source=(value : GLib::Bytes?) : GLib::Bytes?
      unsafe_value = value

      LibGObject.g_object_set(self, "source", unsafe_value, Pointer(Void).null)
      value
    end

    def source : GLib::Bytes?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "source", pointerof(value), Pointer(Void).null)
      GLib::Bytes.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_from_bytes(sourcecode : GLib::Bytes) : Gsk::GLShader
      # gsk_gl_shader_new_from_bytes: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_gl_shader_new_from_bytes(sourcecode)
      Gsk::GLShader.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : Gsk::GLShader
      # gsk_gl_shader_new_from_resource: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_gl_shader_new_from_resource(resource_path)
      Gsk::GLShader.new(_retval, GICrystal::Transfer::Full)
    end

    def compile(renderer : Gsk::Renderer) : Bool
      # gsk_gl_shader_compile: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_compile(self, renderer)
      GICrystal.to_bool(_retval)
    end

    def find_uniform_by_name(name : ::String) : Int32
      # gsk_gl_shader_find_uniform_by_name: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_find_uniform_by_name(self, name)
      _retval
    end

    def arg_bool(args : GLib::Bytes, idx : Int32) : Bool
      # gsk_gl_shader_get_arg_bool: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_arg_bool(self, args, idx)
      GICrystal.to_bool(_retval)
    end

    def arg_float(args : GLib::Bytes, idx : Int32) : Float32
      # gsk_gl_shader_get_arg_float: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_arg_float(self, args, idx)
      _retval
    end

    def arg_int(args : GLib::Bytes, idx : Int32) : Int32
      # gsk_gl_shader_get_arg_int: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_arg_int(self, args, idx)
      _retval
    end

    def arg_uint(args : GLib::Bytes, idx : Int32) : UInt32
      # gsk_gl_shader_get_arg_uint: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_arg_uint(self, args, idx)
      _retval
    end

    def arg_vec2(args : GLib::Bytes, idx : Int32, out_value : Graphene::Vec2) : Nil
      # gsk_gl_shader_get_arg_vec2: (Method)
      # Returns: (transfer none)

      LibGsk.gsk_gl_shader_get_arg_vec2(self, args, idx, out_value)
    end

    def arg_vec3(args : GLib::Bytes, idx : Int32, out_value : Graphene::Vec3) : Nil
      # gsk_gl_shader_get_arg_vec3: (Method)
      # Returns: (transfer none)

      LibGsk.gsk_gl_shader_get_arg_vec3(self, args, idx, out_value)
    end

    def arg_vec4(args : GLib::Bytes, idx : Int32, out_value : Graphene::Vec4) : Nil
      # gsk_gl_shader_get_arg_vec4: (Method)
      # Returns: (transfer none)

      LibGsk.gsk_gl_shader_get_arg_vec4(self, args, idx, out_value)
    end

    def args_size : UInt64
      # gsk_gl_shader_get_args_size: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_args_size(self)
      _retval
    end

    def n_textures : Int32
      # gsk_gl_shader_get_n_textures: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_n_textures(self)
      _retval
    end

    def n_uniforms : Int32
      # gsk_gl_shader_get_n_uniforms: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_n_uniforms(self)
      _retval
    end

    def resource : ::String?
      # gsk_gl_shader_get_resource: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_resource(self)
      ::String.new(_retval) unless _retval.null?
    end

    def source : GLib::Bytes
      # gsk_gl_shader_get_source: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_source(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end

    def uniform_name(idx : Int32) : ::String
      # gsk_gl_shader_get_uniform_name: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_uniform_name(self, idx)
      ::String.new(_retval)
    end

    def uniform_offset(idx : Int32) : Int32
      # gsk_gl_shader_get_uniform_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_uniform_offset(self, idx)
      _retval
    end

    def uniform_type(idx : Int32) : Gsk::GLUniformType
      # gsk_gl_shader_get_uniform_type: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_get_uniform_type(self, idx)
      Gsk::GLUniformType.from_value(_retval)
    end
  end
end
