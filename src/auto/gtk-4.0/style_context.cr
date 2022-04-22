require "../g_object-2.0/object"

module Gtk
  # `GtkStyleContext` stores styling information affecting a widget.
  #
  # In order to construct the final style information, `GtkStyleContext`
  # queries information from all attached `GtkStyleProviders`. Style
  # providers can be either attached explicitly to the context through
  # `Gtk::StyleContext#add_provider`, or to the display through
  # `Gtk::StyleContext#add_provider_for_display`. The resulting
  # style is a combination of all providers’ information in priority order.
  #
  # For GTK widgets, any `GtkStyleContext` returned by
  # `Gtk::Widget#style_context` will already have a `GdkDisplay`
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
  @[GObject::GeneratedWrapper]
  class StyleContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::StyleContextClass), class_init,
        sizeof(LibGtk::StyleContext), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StyleContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Adds a global style provider to @display, which will be used
    # in style construction for all `GtkStyleContexts` under @display.
    #
    # GTK uses this to make styling information from `GtkSettings`
    # available.
    #
    # Note: If both priorities are the same, A `GtkStyleProvider`
    # added through `Gtk::StyleContext#add_provider` takes
    # precedence over another added through this function.
    def self.add_provider_for_display(display : Gdk::Display, provider : Gtk::StyleProvider, priority : UInt32) : Nil
      # gtk_style_context_add_provider_for_display: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_add_provider_for_display(display, provider, priority)

      # Return value handling
    end

    # Removes @provider from the global style providers list in @display.
    def self.remove_provider_for_display(display : Gdk::Display, provider : Gtk::StyleProvider) : Nil
      # gtk_style_context_remove_provider_for_display: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_remove_provider_for_display(display, provider)

      # Return value handling
    end

    # Adds a style class to @context, so later uses of the
    # style context will make use of this new class for styling.
    #
    # In the CSS file format, a `GtkEntry` defining a “search”
    # class, would be matched by:
    #
    #
    #
    # WARNING: **⚠️ The following code is in css ⚠️**
    # ```css
    # entry.search { ... }
    # ```
    #
    # While any widget defining a “search” class would be
    # matched by:
    #
    #
    # WARNING: **⚠️ The following code is in css ⚠️**
    # ```css
    # .search { ... }
    # ```
    def add_class(class_name : ::String) : Nil
      # gtk_style_context_add_class: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_add_class(self, class_name)

      # Return value handling
    end

    # Adds a style provider to @context, to be used in style construction.
    #
    # Note that a style provider added by this function only affects
    # the style of the widget to which @context belongs. If you want
    # to affect the style of all widgets, use
    # `Gtk::StyleContext#add_provider_for_display`.
    #
    # Note: If both priorities are the same, a `GtkStyleProvider`
    # added through this function takes precedence over another added
    # through `Gtk::StyleContext#add_provider_for_display`.
    def add_provider(provider : Gtk::StyleProvider, priority : UInt32) : Nil
      # gtk_style_context_add_provider: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_add_provider(self, provider, priority)

      # Return value handling
    end

    # Gets the border for a given state as a `GtkBorder`.
    def border : Gtk::Border
      # gtk_style_context_get_border: (Method)
      # @border: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      border = Gtk::Border.new

      # C call
      LibGtk.gtk_style_context_get_border(self, border)

      # Return value handling

      border
    end

    # Gets the foreground color for a given state.
    def color : Gdk::RGBA
      # gtk_style_context_get_color: (Method)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      color = Gdk::RGBA.new

      # C call
      LibGtk.gtk_style_context_get_color(self, color)

      # Return value handling

      color
    end

    # Returns the `GdkDisplay` to which @context is attached.
    def display : Gdk::Display
      # gtk_style_context_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_style_context_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the margin for a given state as a `GtkBorder`.
    def margin : Gtk::Border
      # gtk_style_context_get_margin: (Method)
      # @margin: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      margin = Gtk::Border.new

      # C call
      LibGtk.gtk_style_context_get_margin(self, margin)

      # Return value handling

      margin
    end

    # Gets the padding for a given state as a `GtkBorder`.
    def padding : Gtk::Border
      # gtk_style_context_get_padding: (Method)
      # @padding: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      padding = Gtk::Border.new

      # C call
      LibGtk.gtk_style_context_get_padding(self, padding)

      # Return value handling

      padding
    end

    # Returns the scale used for assets.
    def scale : Int32
      # gtk_style_context_get_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_style_context_get_scale(self)

      # Return value handling

      _retval
    end

    # Returns the state used for style matching.
    #
    # This method should only be used to retrieve the `GtkStateFlags`
    # to pass to `GtkStyleContext` methods, like
    # `Gtk::StyleContext#padding`.
    # If you need to retrieve the current state of a `GtkWidget`, use
    # `Gtk::Widget#state_flags`.
    def state : Gtk::StateFlags
      # gtk_style_context_get_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_style_context_get_state(self)

      # Return value handling

      Gtk::StateFlags.new(_retval)
    end

    # Returns %TRUE if @context currently has defined the
    # given class name.
    def has_class(class_name : ::String) : Bool
      # gtk_style_context_has_class: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_style_context_has_class(self, class_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up and resolves a color name in the @context color map.
    def lookup_color(color_name : ::String) : Gdk::RGBA
      # gtk_style_context_lookup_color: (Method)
      # @color: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      color = Gdk::RGBA.new

      # C call
      _retval = LibGtk.gtk_style_context_lookup_color(self, color_name, color)

      # Return value handling

      color
    end

    # Removes @class_name from @context.
    def remove_class(class_name : ::String) : Nil
      # gtk_style_context_remove_class: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_remove_class(self, class_name)

      # Return value handling
    end

    # Removes @provider from the style providers list in @context.
    def remove_provider(provider : Gtk::StyleProvider) : Nil
      # gtk_style_context_remove_provider: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_remove_provider(self, provider)

      # Return value handling
    end

    # Restores @context state to a previous stage.
    #
    # See `Gtk::StyleContext#save`.
    def restore : Nil
      # gtk_style_context_restore: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_restore(self)

      # Return value handling
    end

    # Saves the @context state.
    #
    # This allows temporary modifications done through
    # `Gtk::StyleContext#add_class`,
    # `Gtk::StyleContext#remove_class`,
    # `Gtk::StyleContext#state=` to be quickly
    # reverted in one go through `Gtk::StyleContext#restore`.
    #
    # The matching call to `Gtk::StyleContext#restore`
    # must be done before GTK returns to the main loop.
    def save : Nil
      # gtk_style_context_save: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_save(self)

      # Return value handling
    end

    # Attaches @context to the given display.
    #
    # The display is used to add style information from “global”
    # style providers, such as the display's `GtkSettings` instance.
    #
    # If you are using a `GtkStyleContext` returned from
    # `Gtk::Widget#style_context`, you do not need to
    # call this yourself.
    def display=(display : Gdk::Display) : Nil
      # gtk_style_context_set_display: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_set_display(self, display)

      # Return value handling
    end

    # Sets the scale to use when getting image assets for the style.
    def scale=(scale : Int32) : Nil
      # gtk_style_context_set_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_set_scale(self, scale)

      # Return value handling
    end

    # Sets the state to be used for style matching.
    def state=(flags : Gtk::StateFlags) : Nil
      # gtk_style_context_set_state: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_style_context_set_state(self, flags)

      # Return value handling
    end

    # Converts the style context into a string representation.
    #
    # The string representation always includes information about
    # the name, state, id, visibility and style classes of the CSS
    # node that is backing @context. Depending on the flags, more
    # information may be included.
    #
    # This function is intended for testing and debugging of the
    # CSS implementation in GTK. There are no guarantees about
    # the format of the returned string, it may change.
    def to_string(flags : Gtk::StyleContextPrintFlags) : ::String
      # gtk_style_context_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_style_context_to_string(self, flags)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end
  end
end
