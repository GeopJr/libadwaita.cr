require "../g_object-2.0/object"

module Adw
  # A class for managing application-wide styling.
  #
  # `AdwStyleManager` provides a way to query and influence the application
  # styles, such as whether to use dark or high contrast appearance.
  #
  # It allows to set the color scheme via the
  # [property@StyleManager:color-scheme] property, and to query the current
  # appearance, as well as whether a system-wide color scheme preference exists.
  @[GObject::GeneratedWrapper]
  class StyleManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::StyleManagerClass), class_init,
        sizeof(LibAdw::StyleManager), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, color_scheme : Adw::ColorScheme? = nil, dark : Bool? = nil, display : Gdk::Display? = nil, high_contrast : Bool? = nil, system_supports_color_schemes : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !color_scheme.nil?
        (_names.to_unsafe + _n).value = "color-scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, color_scheme)
        _n += 1
      end
      if !dark.nil?
        (_names.to_unsafe + _n).value = "dark".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, dark)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !high_contrast.nil?
        (_names.to_unsafe + _n).value = "high-contrast".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, high_contrast)
        _n += 1
      end
      if !system_supports_color_schemes.nil?
        (_names.to_unsafe + _n).value = "system-supports-color-schemes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, system_supports_color_schemes)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StyleManager.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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
      Adw::ColorScheme.new(value)
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

    # Gets the default `AdwStyleManager` instance.
    #
    # It manages all `Gdk#Display` instances unless the style manager for
    # that display has an override.
    #
    # See `StyleManager#for_display`.
    def self.default : Adw::StyleManager
      # adw_style_manager_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_default

      # Return value handling

      Adw::StyleManager.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `AdwStyleManager` instance managing @display.
    #
    # It can be used to override styles for that specific display instead of the
    # whole application.
    #
    # Most applications should use `StyleManager#default` instead.
    def self.for_display(display : Gdk::Display) : Adw::StyleManager
      # adw_style_manager_get_for_display: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_for_display(display)

      # Return value handling

      Adw::StyleManager.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the requested application color scheme.
    def color_scheme : Adw::ColorScheme
      # adw_style_manager_get_color_scheme: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_color_scheme(self)

      # Return value handling

      Adw::ColorScheme.new(_retval)
    end

    # Gets whether the application is using dark appearance.
    def dark : Bool
      # adw_style_manager_get_dark: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_dark(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the display the style manager is associated with.
    #
    # The display will be `NULL` for the style manager returned by
    # `StyleManager#default`.
    def display : Gdk::Display
      # adw_style_manager_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether the application is using high contrast appearance.
    def high_contrast : Bool
      # adw_style_manager_get_high_contrast: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_high_contrast(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the system supports color schemes.
    def system_supports_color_schemes : Bool
      # adw_style_manager_get_system_supports_color_schemes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_style_manager_get_system_supports_color_schemes(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the requested application color scheme.
    #
    # The effective appearance will be decided based on the application color
    # scheme and the system preferred color scheme. The
    # `StyleManager#dark` property can be used to query the current
    # effective appearance.
    def color_scheme=(color_scheme : Adw::ColorScheme) : Nil
      # adw_style_manager_set_color_scheme: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_style_manager_set_color_scheme(self, color_scheme)

      # Return value handling
    end
  end
end
