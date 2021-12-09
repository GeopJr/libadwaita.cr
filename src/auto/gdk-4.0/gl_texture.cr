require "./texture"
require "./paintable"

require "../gio-2.0/icon"

require "../gio-2.0/loadable_icon"

module Gdk
  # A GdkTexture representing a GL texture object.
  class GLTexture < Texture
    include Paintable
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, height : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLTexture.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_gl_texture_get_type
    end

    def initialize(context : Gdk::GLContext, id : UInt32, width : Int32, height : Int32, destroy : Pointer(Void), data : Pointer(Nil)?)
      # gdk_gl_texture_new: (Constructor)
      # @data: (nullable)
      # Returns: (transfer full)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      _retval = LibGdk.gdk_gl_texture_new(context, id, width, height, destroy, data)
      @pointer = _retval
    end

    def release : Nil
      # gdk_gl_texture_release: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_gl_texture_release(self)
    end
  end
end
