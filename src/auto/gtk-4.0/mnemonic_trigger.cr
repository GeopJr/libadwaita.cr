require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that triggers when a specific mnemonic is pressed.
  #
  # Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
  # pressed together with the mnemonic key.
  class MnemonicTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, keyval : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if keyval
        (_names.to_unsafe + _n).value = "keyval".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keyval)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MnemonicTrigger.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_mnemonic_trigger_get_type
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

    def initialize(keyval : UInt32)
      # gtk_mnemonic_trigger_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_mnemonic_trigger_new(keyval)
      @pointer = _retval
    end

    def keyval : UInt32
      # gtk_mnemonic_trigger_get_keyval: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_mnemonic_trigger_get_keyval(self)
      _retval
    end
  end
end
