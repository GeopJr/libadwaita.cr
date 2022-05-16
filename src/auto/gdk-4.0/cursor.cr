require "../g_object-2.0/object"

module Gdk
  # `GdkCursor` is used to create and destroy cursors.
  #
  # Cursors are immutable objects, so once you created them, there is no way
  # to modify them later. You should create a new cursor when you want to change
  # something about it.
  #
  # Cursors by themselves are not very interesting: they must be bound to a
  # window for users to see them. This is done with `Gdk::Surface#cursor=`
  # or `Gdk::Surface#device_cursor=`. Applications will typically
  # use higher-level GTK functions such as `Gtk::Widget#cursor=` instead.
  #
  # Cursors are not bound to a given `Gdk#Display`, so they can be shared.
  # However, the appearance of cursors may vary when used on different
  # platforms.
  #
  # ## Named and texture cursors
  #
  # There are multiple ways to create cursors. The platform's own cursors
  # can be created with `Gdk::Cursor#new_from_name`. That function lists
  # the commonly available names that are shared with the CSS specification.
  # Other names may be available, depending on the platform in use. On some
  # platforms, what images are used for named cursors may be influenced by
  # the cursor theme.
  #
  # Another option to create a cursor is to use `Gdk::Cursor#new_from_texture`
  # and provide an image to use for the cursor.
  #
  # To ease work with unsupported cursors, a fallback cursor can be provided.
  # If a `Gdk#Surface` cannot use a cursor because of the reasons mentioned
  # above, it will try the fallback cursor. Fallback cursors can themselves have
  # fallback cursors again, so it is possible to provide a chain of progressively
  # easier to support cursors. If none of the provided cursors can be supported,
  # the default cursor will be the ultimate fallback.
  @[GObject::GeneratedWrapper]
  class Cursor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Cursor), instance_init, 0)
    end

    GICrystal.define_new_method(Cursor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Cursor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, fallback : Gdk::Cursor? = nil, hotspot_x : Int32? = nil, hotspot_y : Int32? = nil, name : ::String? = nil, texture : Gdk::Texture? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !fallback.nil?
        (_names.to_unsafe + _n).value = "fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fallback)
        _n += 1
      end
      if !hotspot_x.nil?
        (_names.to_unsafe + _n).value = "hotspot-x".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hotspot_x)
        _n += 1
      end
      if !hotspot_y.nil?
        (_names.to_unsafe + _n).value = "hotspot-y".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hotspot_y)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !texture.nil?
        (_names.to_unsafe + _n).value = "texture".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, texture)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Cursor.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new cursor by looking up @name in the current cursor
    # theme.
    #
    # A recommended set of cursor names that will work across different
    # platforms can be found in the CSS specification:
    #
    # | | | | |
    # | --- | --- | ---- | --- |
    # | "none" | ![](default_cursor.png) "default" | ![](help_cursor.png) "help" | ![](pointer_cursor.png) "pointer" |
    # | ![](context_menu_cursor.png) "context-menu" | ![](progress_cursor.png) "progress" | ![](wait_cursor.png) "wait" | ![](cell_cursor.png) "cell" |
    # | ![](crosshair_cursor.png) "crosshair" | ![](text_cursor.png) "text" | ![](vertical_text_cursor.png) "vertical-text" | ![](alias_cursor.png) "alias" |
    # | ![](copy_cursor.png) "copy" | ![](no_drop_cursor.png) "no-drop" | ![](move_cursor.png) "move" | ![](not_allowed_cursor.png) "not-allowed" |
    # | ![](grab_cursor.png) "grab" | ![](grabbing_cursor.png) "grabbing" | ![](all_scroll_cursor.png) "all-scroll" | ![](col_resize_cursor.png) "col-resize" |
    # | ![](row_resize_cursor.png) "row-resize" | ![](n_resize_cursor.png) "n-resize" | ![](e_resize_cursor.png) "e-resize" | ![](s_resize_cursor.png) "s-resize" |
    # | ![](w_resize_cursor.png) "w-resize" | ![](ne_resize_cursor.png) "ne-resize" | ![](nw_resize_cursor.png) "nw-resize" | ![](sw_resize_cursor.png) "sw-resize" |
    # | ![](se_resize_cursor.png) "se-resize" | ![](ew_resize_cursor.png) "ew-resize" | ![](ns_resize_cursor.png) "ns-resize" | ![](nesw_resize_cursor.png) "nesw-resize" |
    # | ![](nwse_resize_cursor.png) "nwse-resize" | ![](zoom_in_cursor.png) "zoom-in" | ![](zoom_out_cursor.png) "zoom-out" | |
    def self.new_from_name(name : ::String, fallback : Gdk::Cursor?) : self?
      # gdk_cursor_new_from_name: (Constructor)
      # @fallback: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
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

    # Creates a new cursor from a `GdkTexture`.
    def self.new_from_texture(texture : Gdk::Texture, hotspot_x : Int32, hotspot_y : Int32, fallback : Gdk::Cursor?) : self
      # gdk_cursor_new_from_texture: (Constructor)
      # @fallback: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
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

    # Returns the fallback for this @cursor.
    #
    # The fallback will be used if this cursor is not available on a given
    # `GdkDisplay`. For named cursors, this can happen when using nonstandard
    # names or when using an incomplete cursor theme. For textured cursors,
    # this can happen when the texture is too large or when the `GdkDisplay`
    # it is used on does not support textured cursors.
    def fallback : Gdk::Cursor?
      # gdk_cursor_get_fallback: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_cursor_get_fallback(@pointer)

      # Return value handling

      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the horizontal offset of the hotspot.
    #
    # The hotspot indicates the pixel that will be directly above the cursor.
    #
    # Note that named cursors may have a nonzero hotspot, but this function
    # will only return the hotspot position for cursors created with
    # `Gdk::Cursor#new_from_texture`.
    def hotspot_x : Int32
      # gdk_cursor_get_hotspot_x: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_cursor_get_hotspot_x(@pointer)

      # Return value handling

      _retval
    end

    # Returns the vertical offset of the hotspot.
    #
    # The hotspot indicates the pixel that will be directly above the cursor.
    #
    # Note that named cursors may have a nonzero hotspot, but this function
    # will only return the hotspot position for cursors created with
    # `Gdk::Cursor#new_from_texture`.
    def hotspot_y : Int32
      # gdk_cursor_get_hotspot_y: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_cursor_get_hotspot_y(@pointer)

      # Return value handling

      _retval
    end

    # Returns the name of the cursor.
    #
    # If the cursor is not a named cursor, %NULL will be returned.
    def name : ::String?
      # gdk_cursor_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_cursor_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the texture for the cursor.
    #
    # If the cursor is a named cursor, %NULL will be returned.
    def texture : Gdk::Texture?
      # gdk_cursor_get_texture: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_cursor_get_texture(@pointer)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
