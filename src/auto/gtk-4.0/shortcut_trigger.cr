require "../g_object-2.0/object"

module Gtk
  # `GtkShortcutTrigger` tracks how a `GtkShortcut` should be activated.
  #
  # To find out if a `GtkShortcutTrigger` triggers, you can call
  # [method@Gtk.ShortcutTrigger.trigger] on a `GdkEvent`.
  #
  # `GtkShortcutTriggers` contain functions that allow easy presentation
  # to end users as well as being printed for debugging.
  #
  # All `GtkShortcutTriggers` are immutable, you can only specify their
  # properties during construction. If you want to change a trigger, you
  # have to replace it with a new one.
  class ShortcutTrigger < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_trigger_get_type
    end

    def self.parse_string(string : ::String) : self?
      # gtk_shortcut_trigger_parse_string: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_parse_string(string)

      # Return value handling
      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def compare(trigger2 : Gtk::ShortcutTrigger) : Int32
      # gtk_shortcut_trigger_compare: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_compare(self, trigger2)

      # Return value handling
      _retval
    end

    def equal(trigger2 : Gtk::ShortcutTrigger) : Bool
      # gtk_shortcut_trigger_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_equal(self, trigger2)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def hash : UInt32
      # gtk_shortcut_trigger_hash: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_hash(self)

      # Return value handling
      _retval
    end

    def print(string : GLib::String) : Nil
      # gtk_shortcut_trigger_print: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_shortcut_trigger_print(self, string)

      # Return value handling
    end

    def print_label(display : Gdk::Display, string : GLib::String) : Bool
      # gtk_shortcut_trigger_print_label: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_print_label(self, display, string)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_label(display : Gdk::Display) : ::String
      # gtk_shortcut_trigger_to_label: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_to_label(self, display)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def to_string : ::String
      # gtk_shortcut_trigger_to_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_to_string(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def trigger(event : Gdk::Event, enable_mnemonics : Bool) : Gdk::KeyMatch
      # gtk_shortcut_trigger_trigger: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_trigger_trigger(self, event, enable_mnemonics)

      # Return value handling
      Gdk::KeyMatch.from_value(_retval)
    end
  end
end
