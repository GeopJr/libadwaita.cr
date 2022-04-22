require "./texture"
require "./paintable"

require "../gio-2.0/icon"

require "../gio-2.0/loadable_icon"

module Gdk
  # A GdkTexture representing a GL texture object.
  @[GObject::GeneratedWrapper]
  class GLTexture < Texture
    include Paintable
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::GLTextureClass), class_init,
        sizeof(LibGdk::GLTexture), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, height : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLTexture.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_gl_texture_get_type
    end

    # Creates a new texture for an existing GL texture.
    #
    # Note that the GL texture must not be modified until @destroy is called,
    # which will happen when the GdkTexture object is finalized, or due to
    # an explicit call of `Gdk::GLTexture#release`.
    def initialize(context : Gdk::GLContext, id : UInt32, width : Int32, height : Int32, destroy : Pointer(Void), data : Pointer(Void)?)
      # gdk_gl_texture_new: (Constructor)
      # @data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibGdk.gdk_gl_texture_new(context, id, width, height, destroy, data)

      # Return value handling

      @pointer = _retval
    end

    # Releases the GL resources held by a `GdkGLTexture`.
    #
    # The texture contents are still available via the
    # `Gdk::Texture#download` function, after this
    # function has been called.
    def release : Nil
      # gdk_gl_texture_release: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_texture_release(self)

      # Return value handling
    end
  end
end
