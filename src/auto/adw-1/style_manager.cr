require "../g_object-2.0/object"

module Adw
  # A class for managing application-wide styling.
  #
  # `AdwStyleManager` provides a way to query and influence the application
  # styles, such as whether to use dark or high contrast appearance.
  #
  # It allows to set the color scheme via the
  # [property@Adw.StyleManager:color-scheme] property, and to query the current
  # appearance, as well as whether a system-wide color scheme preference exists.
  class StyleManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, color_scheme : Adw::ColorScheme? = nil, dark : Bool? = nil, display : Gdk::Display? = nil, high_contrast : Bool? = nil, system_supports_color_schemes : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if color_scheme
        (_names.to_unsafe + _n).value = "color-scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, color_scheme)
        _n += 1
      end
      if dark
        (_names.to_unsafe + _n).value = "dark".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, dark)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if high_contrast
        (_names.to_unsafe + _n).value = "high-contrast".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, high_contrast)
        _n += 1
      end
      if system_supports_color_schemes
        (_names.to_unsafe + _n).value = "system-supports-color-schemes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, system_supports_color_schemes)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StyleManager.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_style_manager_get_type
    end

    def color_scheme=(value : Adw::ColorScheme) : Adw::ColorScheme
      unsafe_value = value

      LibGObject.g_object_set(self, "color-scheme", unsafe_value, Pointer(Void).null)
      value
    end

    def color_scheme : Adw::ColorScheme
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "color-scheme", pointerof(value), Pointer(Void).null)
      Adw::ColorScheme.from_value(value)
    end

    def dark? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "dark", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def high_contrast? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "high-contrast", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def system_supports_color_schemes? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "system-supports-color-schemes", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def self.default : Adw::StyleManager
      # adw_style_manager_get_default: (None)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_default
      Adw::StyleManager.new(_retval, GICrystal::Transfer::None)
    end

    def self.for_display(display : Gdk::Display) : Adw::StyleManager
      # adw_style_manager_get_for_display: (None)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_for_display(display)
      Adw::StyleManager.new(_retval, GICrystal::Transfer::None)
    end

    def color_scheme : Adw::ColorScheme
      # adw_style_manager_get_color_scheme: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_color_scheme(self)
      Adw::ColorScheme.from_value(_retval)
    end

    def dark : Bool
      # adw_style_manager_get_dark: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_dark(self)
      GICrystal.to_bool(_retval)
    end

    def display : Gdk::Display
      # adw_style_manager_get_display: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def high_contrast : Bool
      # adw_style_manager_get_high_contrast: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_high_contrast(self)
      GICrystal.to_bool(_retval)
    end

    def system_supports_color_schemes : Bool
      # adw_style_manager_get_system_supports_color_schemes: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_style_manager_get_system_supports_color_schemes(self)
      GICrystal.to_bool(_retval)
    end

    def color_scheme=(color_scheme : Adw::ColorScheme) : Nil
      # adw_style_manager_set_color_scheme: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_style_manager_set_color_scheme(self, color_scheme)
    end
  end
end
