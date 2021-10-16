require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that activates an action by name.
  class NamedAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if action_name
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NamedAction.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_named_action_get_type
    end

    def action_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "action-name", unsafe_value, Pointer(Void).null)
      value
    end

    def action_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "action-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(name : ::String)
      # gtk_named_action_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_named_action_new(name)
      @pointer = _retval
    end

    def action_name : ::String
      # gtk_named_action_get_action_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_named_action_get_action_name(self)
      ::String.new(_retval)
    end
  end
end
