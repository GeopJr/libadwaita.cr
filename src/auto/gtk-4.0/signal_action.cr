require "./shortcut_action"

module Gtk
  # A `GtkShortcut`Action that emits a signal.
  #
  # Signals that are used in this way are referred to as keybinding signals,
  # and they are expected to be defined with the %G_SIGNAL_ACTION flag.
  class SignalAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, signal_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if signal_name
        (_names.to_unsafe + _n).value = "signal-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, signal_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SignalAction.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_signal_action_get_type
    end

    def signal_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "signal-name", unsafe_value, Pointer(Void).null)
      value
    end

    def signal_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "signal-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(signal_name : ::String)
      # gtk_signal_action_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_signal_action_new(signal_name)
      @pointer = _retval
    end

    def signal_name : ::String
      # gtk_signal_action_get_signal_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_signal_action_get_signal_name(self)
      ::String.new(_retval)
    end
  end
end
