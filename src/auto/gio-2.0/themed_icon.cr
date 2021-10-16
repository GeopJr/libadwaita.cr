require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GThemedIcon is an implementation of #GIcon that supports icon themes.
  # #GThemedIcon contains a list of all of the icons present in an icon
  # theme, so that icons can be looked up quickly. #GThemedIcon does
  # not provide actual pixmaps for icons, just the icon names.
  # Ideally something like gtk_icon_theme_choose_icon() should be used to
  # resolve the list of names so that fallback icons work nicely with
  # themes that inherit other themes.
  class ThemedIcon < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, names : Enumerable(::String)? = nil, use_default_fallbacks : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if names
        (_names.to_unsafe + _n).value = "names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, names)
        _n += 1
      end
      if use_default_fallbacks
        (_names.to_unsafe + _n).value = "use-default-fallbacks".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_default_fallbacks)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ThemedIcon.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_themed_icon_get_type
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def names=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "names", unsafe_value, Pointer(Void).null)
      value
    end

    def names : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "names", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def use_default_fallbacks=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-default-fallbacks", unsafe_value, Pointer(Void).null)
      value
    end

    def use_default_fallbacks? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-default-fallbacks", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(iconname : ::String)
      # g_themed_icon_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_themed_icon_new(iconname)
      @pointer = _retval
    end

    def self.new_from_names(iconnames : Enumerable(::String)) : Gio::ThemedIcon
      # g_themed_icon_new_from_names: (Constructor)
      # @iconnames: (array length=len element-type Utf8)
      # Returns: (transfer full)

      len = iconnames.size
      iconnames = iconnames.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGio.g_themed_icon_new_from_names(iconnames, len)
      Gio::ThemedIcon.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_names(*iconnames : ::String)
      self.new_from_names(iconnames)
    end

    def self.new_with_default_fallbacks(iconname : ::String) : Gio::ThemedIcon
      # g_themed_icon_new_with_default_fallbacks: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_themed_icon_new_with_default_fallbacks(iconname)
      Gio::ThemedIcon.new(_retval, GICrystal::Transfer::Full)
    end

    def append_name(iconname : ::String) : Nil
      # g_themed_icon_append_name: (Method)
      # Returns: (transfer none)

      LibGio.g_themed_icon_append_name(self, iconname)
    end

    def names : Enumerable(::String)
      # g_themed_icon_get_names: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_themed_icon_get_names(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def prepend_name(iconname : ::String) : Nil
      # g_themed_icon_prepend_name: (Method)
      # Returns: (transfer none)

      LibGio.g_themed_icon_prepend_name(self, iconname)
    end
  end
end
