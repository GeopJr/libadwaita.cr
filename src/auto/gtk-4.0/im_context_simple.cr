require "./im_context"

module Gtk
  # `GtkIMContextSimple` is an input method supporting table-based input methods.
  #
  # ## Compose sequences
  #
  # `GtkIMContextSimple` reads compose sequences from the first of the
  # following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
  # /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
  # Compose file). The syntax of these files is described in the Compose(5)
  # manual page.
  #
  # If none of these files is found, `GtkIMContextSimple` uses a built-in table
  # of compose sequences that is derived from the X11 Compose files.
  #
  # Note that compose sequences typically start with the Compose_key, which is
  # often not available as a dedicated key on keyboards. Keyboard layouts may
  # map this keysym to other keys, such as the right Control key.
  #
  # ## Unicode characters
  #
  # `GtkIMContextSimple` also supports numeric entry of Unicode characters
  # by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
  # hexadecimal Unicode codepoint.
  #
  # For example,
  #
  #     Ctrl-Shift-u 1 2 3 Enter
  #
  # yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.
  #
  # ## Dead keys
  #
  # `GtkIMContextSimple` supports dead keys. For example, typing
  #
  #     dead_acute a
  #
  #  yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this
  #  depends on the keyboard layout including dead keys.
  @[GObject::GeneratedWrapper]
  class IMContextSimple < IMContext
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::IMContextSimpleClass), class_init,
        sizeof(LibGtk::IMContextSimple), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !input_hints.nil?
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if !input_purpose.nil?
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IMContextSimple.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_im_context_simple_get_type
    end

    # Creates a new `GtkIMContextSimple`.
    def initialize
      # gtk_im_context_simple_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_im_context_simple_new

      # Return value handling

      @pointer = _retval
    end

    # Adds an additional table from the X11 compose file.
    def add_compose_file(compose_file : ::String) : Nil
      # gtk_im_context_simple_add_compose_file: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_im_context_simple_add_compose_file(self, compose_file)

      # Return value handling
    end
  end
end
