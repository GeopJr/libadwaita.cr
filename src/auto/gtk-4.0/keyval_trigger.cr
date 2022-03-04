require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that triggers when a specific keyval and modifiers are pressed.
  class KeyvalTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, keyval : UInt32? = nil, modifiers : Gdk::ModifierType? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if keyval
        (_names.to_unsafe + _n).value = "keyval".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keyval)
        _n += 1
      end
      if modifiers
        (_names.to_unsafe + _n).value = "modifiers".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modifiers)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(KeyvalTrigger.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_keyval_trigger_get_type
    end

    def keyval=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "keyval", unsafe_value, Pointer(Void).null)
      value
    end

    def keyval : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "keyval", pointerof(value), Pointer(Void).null)
      value
    end

    def modifiers=(value : Gdk::ModifierType) : Gdk::ModifierType
      unsafe_value = value

      LibGObject.g_object_set(self, "modifiers", unsafe_value, Pointer(Void).null)
      value
    end

    def modifiers : Gdk::ModifierType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "modifiers", pointerof(value), Pointer(Void).null)
      Gdk::ModifierType.from_value(value)
    end

    def initialize(keyval : UInt32, modifiers : Gdk::ModifierType)
      # gtk_keyval_trigger_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_keyval_trigger_new(keyval, modifiers)

      # Return value handling
      @pointer = _retval
    end

    def keyval : UInt32
      # gtk_keyval_trigger_get_keyval: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_keyval_trigger_get_keyval(self)

      # Return value handling
      _retval
    end

    def modifiers : Gdk::ModifierType
      # gtk_keyval_trigger_get_modifiers: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_keyval_trigger_get_modifiers(self)

      # Return value handling
      Gdk::ModifierType.from_value(_retval)
    end
  end
end
