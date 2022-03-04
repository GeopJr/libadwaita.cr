require "./texture"
require "./paintable"

module Gdk
  # A `GdkTexture` representing image data in memory.
  class MemoryTexture < Texture
    include Paintable

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

      @pointer = LibGObject.g_object_new_with_properties(MemoryTexture.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_memory_texture_get_type
    end

    def initialize(width : Int32, height : Int32, format : Gdk::MemoryFormat, bytes : GLib::Bytes, stride : UInt64)
      # gdk_memory_texture_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_memory_texture_new(width, height, format, bytes, stride)

      # Return value handling
      @pointer = _retval
    end
  end
end
