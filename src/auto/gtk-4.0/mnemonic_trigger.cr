require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that triggers when a specific mnemonic is pressed.
  #
  # Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
  # pressed together with the mnemonic key.
  @[GObject::GeneratedWrapper]
  class MnemonicTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MnemonicTriggerClass), class_init,
        sizeof(LibGtk::MnemonicTrigger), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, keyval : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !keyval.nil?
        (_names.to_unsafe + _n).value = "keyval".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keyval)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MnemonicTrigger.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a `GtkShortcutTrigger` that will trigger whenever the key with
    # the given @keyval is pressed and mnemonics have been activated.
    #
    # Mnemonics are activated by calling code when a key event with the right
    # modifiers is detected.
    def initialize(keyval : UInt32)
      # gtk_mnemonic_trigger_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_mnemonic_trigger_new(keyval)

      # Return value handling

      @pointer = _retval
    end

    # Gets the keyval that must be pressed to succeed triggering @self.
    def keyval : UInt32
      # gtk_mnemonic_trigger_get_keyval: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_mnemonic_trigger_get_keyval(self)

      # Return value handling

      _retval
    end
  end
end
