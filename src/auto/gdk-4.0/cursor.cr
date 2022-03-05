require "../g_object-2.0/object"

module Gdk
  # `GdkCursor` is used to create and destroy cursors.
  #
  # Cursors are immutable objects, so once you created them, there is no way
  # to modify them later. You should create a new cursor when you want to change
  # something about it.
  #
  # Cursors by themselves are not very interesting: they must be bound to a
  # window for users to see them. This is done with [method@Gdk.Surface.set_cursor]
  # or [method@Gdk.Surface.set_device_cursor]. Applications will typically
  # use higher-level GTK functions such as [method@Gtk.Widget.set_cursor] instead.
  #
  # Cursors are not bound to a given [class@Gdk.Display], so they can be shared.
  # However, the appearance of cursors may vary when used on different
  # platforms.
  #
  # ## Named and texture cursors
  #
  # There are multiple ways to create cursors. The platform's own cursors
  # can be created with [ctor@Gdk.Cursor.new_from_name]. That function lists
  # the commonly available names that are shared with the CSS specification.
  # Other names may be available, depending on the platform in use. On some
  # platforms, what images are used for named cursors may be influenced by
  # the cursor theme.
  #
  # Another option to create a cursor is to use [ctor@Gdk.Cursor.new_from_texture]
  # and provide an image to use for the cursor.
  #
  # To ease work with unsupported cursors, a fallback cursor can be provided.
  # If a [class@Gdk.Surface] cannot use a cursor because of the reasons mentioned
  # above, it will try the fallback cursor. Fallback cursors can themselves have
  # fallback cursors again, so it is possible to provide a chain of progressively
  # easier to support cursors. If none of the provided cursors can be supported,
  # the default cursor will be the ultimate fallback.
  class Cursor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, fallback : Gdk::Cursor? = nil, hotspot_x : Int32? = nil, hotspot_y : Int32? = nil, name : ::String? = nil, texture : Gdk::Texture? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if fallback
        (_names.to_unsafe + _n).value = "fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fallback)
        _n += 1
      end
      if hotspot_x
        (_names.to_unsafe + _n).value = "hotspot-x".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hotspot_x)
        _n += 1
      end
      if hotspot_y
        (_names.to_unsafe + _n).value = "hotspot-y".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hotspot_y)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if texture
        (_names.to_unsafe + _n).value = "texture".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, texture)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Cursor.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_cursor_get_type
    end

    def fallback=(value : Gdk::Cursor?) : Gdk::Cursor?
      unsafe_value = value

      LibGObject.g_object_set(self, "fallback", unsafe_value, Pointer(Void).null)
      value
    end

    def fallback : Gdk::Cursor?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "fallback", pointerof(value), Pointer(Void).null)
      Gdk::Cursor.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def hotspot_x=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "hotspot-x", unsafe_value, Pointer(Void).null)
      value
    end

    def hotspot_x : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "hotspot-x", pointerof(value), Pointer(Void).null)
      value
    end

    def hotspot_y=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "hotspot-y", unsafe_value, Pointer(Void).null)
      value
    end

    def hotspot_y : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "hotspot-y", pointerof(value), Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def texture=(value : Gdk::Texture?) : Gdk::Texture?
      unsafe_value = value

      LibGObject.g_object_set(self, "texture", unsafe_value, Pointer(Void).null)
      value
    end

    def texture : Gdk::Texture?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "texture", pointerof(value), Pointer(Void).null)
      Gdk::Texture.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_from_name(name : ::String, fallback : Gdk::Cursor?) : self?
      # gdk_cursor_new_from_name: (Constructor)
      # @fallback: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      fallback = if fallback.nil?
                   Pointer(Void).null
                 else
                   fallback.to_unsafe
                 end

      # C call
      _retval = LibGdk.gdk_cursor_new_from_name(name, fallback)

      # Return value handling
      Gdk::Cursor.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_texture(texture : Gdk::Texture, hotspot_x : Int32, hotspot_y : Int32, fallback : Gdk::Cursor?) : self
      # gdk_cursor_new_from_texture: (Constructor)
      # @fallback: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      fallback = if fallback.nil?
                   Pointer(Void).null
                 else
                   fallback.to_unsafe
                 end

      # C call
      _retval = LibGdk.gdk_cursor_new_from_texture(texture, hotspot_x, hotspot_y, fallback)

      # Return value handling
      Gdk::Cursor.new(_retval, GICrystal::Transfer::Full)
    end

    def fallback : Gdk::Cursor?
      # gdk_cursor_get_fallback: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cursor_get_fallback(self)

      # Return value handling
      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def hotspot_x : Int32
      # gdk_cursor_get_hotspot_x: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cursor_get_hotspot_x(self)

      # Return value handling
      _retval
    end

    def hotspot_y : Int32
      # gdk_cursor_get_hotspot_y: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cursor_get_hotspot_y(self)

      # Return value handling
      _retval
    end

    def name : ::String?
      # gdk_cursor_get_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cursor_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def texture : Gdk::Texture?
      # gdk_cursor_get_texture: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cursor_get_texture(self)

      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
