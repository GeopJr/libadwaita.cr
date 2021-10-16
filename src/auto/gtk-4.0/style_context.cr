require "../g_object-2.0/object"

module Gtk
  # `GtkStyleContext` stores styling information affecting a widget.
  #
  # In order to construct the final style information, `GtkStyleContext`
  # queries information from all attached `GtkStyleProviders`. Style
  # providers can be either attached explicitly to the context through
  # [method@Gtk.StyleContext.add_provider], or to the display through
  # [func@Gtk.StyleContext.add_provider_for_display]. The resulting
  # style is a combination of all providers’ information in priority order.
  #
  # For GTK widgets, any `GtkStyleContext` returned by
  # [method@Gtk.Widget.get_style_context] will already have a `GdkDisplay`
  # and RTL/LTR information set. The style context will also be updated
  # automatically if any of these settings change on the widget.
  #
  # # Style Classes
  #
  # Widgets can add style classes to their context, which can be used to associate
  # different styles by class. The documentation for individual widgets lists
  # which style classes it uses itself, and which style classes may be added by
  # applications to affect their appearance.
  #
  # # Custom styling in UI libraries and applications
  #
  # If you are developing a library with custom widgets that render differently
  # than standard components, you may need to add a `GtkStyleProvider` yourself
  # with the %GTK_STYLE_PROVIDER_PRIORITY_FALLBACK priority, either a
  # `GtkCssProvider` or a custom object implementing the `GtkStyleProvider`
  # interface. This way themes may still attempt to style your UI elements in
  # a different way if needed so.
  #
  # If you are using custom styling on an applications, you probably want then
  # to make your style information prevail to the theme’s, so you must use
  # a `GtkStyleProvider` with the %GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
  # priority, keep in mind that the user settings in
  # `XDG_CONFIG_HOME/gtk-4.0/gtk.css` will
  # still take precedence over your changes, as it uses the
  # %GTK_STYLE_PROVIDER_PRIORITY_USER priority.
  class StyleContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StyleContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_style_context_get_type
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

    def self.add_provider_for_display(display : Gdk::Display, provider : Gtk::StyleProvider, priority : UInt32) : Nil
      # gtk_style_context_add_provider_for_display: (None)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_add_provider_for_display(display, provider, priority)
    end

    def self.remove_provider_for_display(display : Gdk::Display, provider : Gtk::StyleProvider) : Nil
      # gtk_style_context_remove_provider_for_display: (None)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_remove_provider_for_display(display, provider)
    end

    def add_class(class_name : ::String) : Nil
      # gtk_style_context_add_class: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_add_class(self, class_name)
    end

    def add_provider(provider : Gtk::StyleProvider, priority : UInt32) : Nil
      # gtk_style_context_add_provider: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_add_provider(self, provider, priority)
    end

    def border : Gtk::Border
      # gtk_style_context_get_border: (Method)
      # @border: (out) (caller-allocates)
      # Returns: (transfer none)

      border = Gtk::Border.new

      LibGtk.gtk_style_context_get_border(self, border)
      border
    end

    def color : Gdk::RGBA
      # gtk_style_context_get_color: (Method)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      color = Gdk::RGBA.new

      LibGtk.gtk_style_context_get_color(self, color)
      color
    end

    def display : Gdk::Display
      # gtk_style_context_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_style_context_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def margin : Gtk::Border
      # gtk_style_context_get_margin: (Method)
      # @margin: (out) (caller-allocates)
      # Returns: (transfer none)

      margin = Gtk::Border.new

      LibGtk.gtk_style_context_get_margin(self, margin)
      margin
    end

    def padding : Gtk::Border
      # gtk_style_context_get_padding: (Method)
      # @padding: (out) (caller-allocates)
      # Returns: (transfer none)

      padding = Gtk::Border.new

      LibGtk.gtk_style_context_get_padding(self, padding)
      padding
    end

    def scale : Int32
      # gtk_style_context_get_scale: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_style_context_get_scale(self)
      _retval
    end

    def state : Gtk::StateFlags
      # gtk_style_context_get_state: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_style_context_get_state(self)
      Gtk::StateFlags.from_value(_retval)
    end

    def has_class(class_name : ::String) : Bool
      # gtk_style_context_has_class: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_style_context_has_class(self, class_name)
      GICrystal.to_bool(_retval)
    end

    def lookup_color(color_name : ::String) : Gdk::RGBA
      # gtk_style_context_lookup_color: (Method)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      color = Gdk::RGBA.new

      _retval = LibGtk.gtk_style_context_lookup_color(self, color_name, color)
      color
    end

    def remove_class(class_name : ::String) : Nil
      # gtk_style_context_remove_class: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_remove_class(self, class_name)
    end

    def remove_provider(provider : Gtk::StyleProvider) : Nil
      # gtk_style_context_remove_provider: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_remove_provider(self, provider)
    end

    def restore : Nil
      # gtk_style_context_restore: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_restore(self)
    end

    def save : Nil
      # gtk_style_context_save: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_save(self)
    end

    def display=(display : Gdk::Display) : Nil
      # gtk_style_context_set_display: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_set_display(self, display)
    end

    def scale=(scale : Int32) : Nil
      # gtk_style_context_set_scale: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_set_scale(self, scale)
    end

    def state=(flags : Gtk::StateFlags) : Nil
      # gtk_style_context_set_state: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_style_context_set_state(self, flags)
    end

    def to_string(flags : Gtk::StyleContextPrintFlags) : ::String
      # gtk_style_context_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_style_context_to_string(self, flags)
      GICrystal.transfer_full(_retval)
    end
  end
end
