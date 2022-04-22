require "../g_object-2.0/object"

module Gtk
  # `GtkShortcutTrigger` tracks how a `GtkShortcut` should be activated.
  #
  # To find out if a `GtkShortcutTrigger` triggers, you can call
  # `Gtk::ShortcutTrigger#trigger` on a `GdkEvent`.
  #
  # `GtkShortcutTriggers` contain functions that allow easy presentation
  # to end users as well as being printed for debugging.
  #
  # All `GtkShortcutTriggers` are immutable, you can only specify their
  # properties during construction. If you want to change a trigger, you
  # have to replace it with a new one.
  @[GObject::GeneratedWrapper]
  class ShortcutTrigger < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ShortcutTriggerClass), class_init,
        sizeof(LibGtk::ShortcutTrigger), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_trigger_get_type
    end

    # Tries to parse the given string into a trigger.
    #
    # On success, the parsed trigger is returned.
    # When parsing failed, %NULL is returned.
    #
    # The accepted strings are:
    #
    #   - `never`, for `GtkNeverTrigger`
    #   - a string parsed by gtk_accelerator_parse(), for a `GtkKeyvalTrigger`, e.g. `<Control>C`
    #   - underscore, followed by a single character, for `GtkMnemonicTrigger`, e.g. `_l`
    #   - two valid trigger strings, separated by a `|` character, for a
    #     `GtkAlternativeTrigger`: `<Control>q|<Control>w`
    #
    # Note that you will have to escape the `<` and `>` characters when specifying
    # triggers in XML files, such as GtkBuilder ui files. Use `&lt;` instead of
    # `<` and `&gt;` instead of `>`.
    def self.parse_string(string : ::String) : self?
      # gtk_shortcut_trigger_parse_string: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_parse_string(string)

      # Return value handling

      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # The types of @trigger1 and @trigger2 are `gconstpointer` only to allow
    # use of this function as a `GCompareFunc`.
    #
    # They must each be a `GtkShortcutTrigger`.
    def compare(trigger2 : Gtk::ShortcutTrigger) : Int32
      # gtk_shortcut_trigger_compare: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_compare(self, trigger2)

      # Return value handling

      _retval
    end

    # Checks if @trigger1 and @trigger2 trigger under the same conditions.
    #
    # The types of @one and @two are `gconstpointer` only to allow use of this
    # function with `GHashTable`. They must each be a `GtkShortcutTrigger`.
    def equal(trigger2 : Gtk::ShortcutTrigger) : Bool
      # gtk_shortcut_trigger_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_equal(self, trigger2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Generates a hash value for a `GtkShortcutTrigger`.
    #
    # The output of this function is guaranteed to be the same for a given
    # value only per-process. It may change between different processor
    # architectures or even different versions of GTK. Do not use this
    # function as a basis for building protocols or file formats.
    #
    # The types of @trigger is `gconstpointer` only to allow use of this
    # function with `GHashTable`. They must each be a `GtkShortcutTrigger`.
    def hash : UInt32
      # gtk_shortcut_trigger_hash: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_hash(self)

      # Return value handling

      _retval
    end

    # Prints the given trigger into a string for the developer.
    # This is meant for debugging and logging.
    #
    # The form of the representation may change at any time
    # and is not guaranteed to stay identical.
    def print(string : GLib::String) : Nil
      # gtk_shortcut_trigger_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_shortcut_trigger_print(self, string)

      # Return value handling
    end

    # Prints the given trigger into a string.
    #
    # This function is returning a translated string for presentation
    # to end users for example in menu items or in help texts.
    #
    # The @display in use may influence the resulting string in
    # various forms, such as resolving hardware keycodes or by
    # causing display-specific modifier names.
    #
    # The form of the representation may change at any time and is
    # not guaranteed to stay identical.
    def print_label(display : Gdk::Display, string : GLib::String) : Bool
      # gtk_shortcut_trigger_print_label: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_print_label(self, display, string)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets textual representation for the given trigger.
    #
    # This function is returning a translated string for
    # presentation to end users for example in menu items
    # or in help texts.
    #
    # The @display in use may influence the resulting string in
    # various forms, such as resolving hardware keycodes or by
    # causing display-specific modifier names.
    #
    # The form of the representation may change at any time and is
    # not guaranteed to stay identical.
    def to_label(display : Gdk::Display) : ::String
      # gtk_shortcut_trigger_to_label: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_to_label(self, display)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Prints the given trigger into a human-readable string.
    #
    # This is a small wrapper around `Gtk::ShortcutTrigger#print`
    # to help when debugging.
    def to_string : ::String
      # gtk_shortcut_trigger_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Checks if the given @event triggers @self.
    def trigger(event : Gdk::Event, enable_mnemonics : Bool) : Gdk::KeyMatch
      # gtk_shortcut_trigger_trigger: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_trigger(self, event, enable_mnemonics)

      # Return value handling

      Gdk::KeyMatch.new(_retval)
    end
  end
end
