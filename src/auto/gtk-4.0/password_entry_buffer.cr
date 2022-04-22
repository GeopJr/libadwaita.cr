require "./entry_buffer"

module Gtk
  # A `GtkEntryBuffer` that locks the underlying memory to prevent it
  # from being swapped to disk.
  #
  # `GtkPasswordEntry` uses a `GtkPasswordEntryBuffer`.
  @[GObject::GeneratedWrapper]
  class PasswordEntryBuffer < EntryBuffer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::PasswordEntryBufferClass), class_init,
        sizeof(LibGtk::PasswordEntryBuffer), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, length : UInt32? = nil, max_length : Int32? = nil, text : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !length.nil?
        (_names.to_unsafe + _n).value = "length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, length)
        _n += 1
      end
      if !max_length.nil?
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PasswordEntryBuffer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_password_entry_buffer_get_type
    end

    # Creates a new `GtkEntryBuffer` using secure memory allocations.
    def initialize
      # gtk_password_entry_buffer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_password_entry_buffer_new

      # Return value handling

      @pointer = _retval
    end
  end
end
