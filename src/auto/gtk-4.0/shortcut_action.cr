require "../g_object-2.0/object"

module Gtk
  # `GtkShortcutAction` encodes an action that can be triggered by a
  # keyboard shortcut.
  #
  # `GtkShortcutActions` contain functions that allow easy presentation
  # to end users as well as being printed for debugging.
  #
  # All `GtkShortcutActions` are immutable, you can only specify their
  # properties during construction. If you want to change a action, you
  # have to replace it with a new one. If you need to pass arguments to
  # an action, these are specified by the higher-level `GtkShortcut` object.
  #
  # To activate a `GtkShortcutAction` manually, [method@Gtk.ShortcutAction.activate]
  # can be called.
  #
  # GTK provides various actions:
  #
  #  - [class@Gtk.MnemonicAction]: a shortcut action that calls
  #    gtk_widget_mnemonic_activate()
  #  - [class@Gtk.CallbackAction]: a shortcut action that invokes
  #    a given callback
  #  - [class@Gtk.SignalAction]: a shortcut action that emits a
  #    given signal
  #  - [class@Gtk.ActivateAction]: a shortcut action that calls
  #    gtk_widget_activate()
  #  - [class@Gtk.NamedAction]: a shortcut action that calls
  #    gtk_widget_activate_action()
  #  - [class@Gtk.NothingAction]: a shortcut action that does nothing
  class ShortcutAction < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_action_get_type
    end

    def self.parse_string(string : ::String) : self?
      # gtk_shortcut_action_parse_string: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_action_parse_string(string)

      # Return value handling
      Gtk::ShortcutAction.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def activate(flags : Gtk::ShortcutActionFlags, widget : Gtk::Widget, args : _?) : Bool
      # gtk_shortcut_action_activate: (Method)
      # @args: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      args = if args.nil?
               Pointer(Void).null
             else
               args.to_unsafe
             end
      args = GLib::Variant.new(args) unless args.is_a?(GLib::Variant)

      # C call
      _retval = LibGtk.gtk_shortcut_action_activate(self, flags, widget, args)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def print(string : GLib::String) : Nil
      # gtk_shortcut_action_print: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_shortcut_action_print(self, string)

      # Return value handling
    end

    def to_string : ::String
      # gtk_shortcut_action_to_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_shortcut_action_to_string(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end
  end
end
