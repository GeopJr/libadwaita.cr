require "../g_object-2.0/object"

module Gtk
  # `GtkStringObject` is the type of items in a `GtkStringList`.
  #
  # A `GtkStringObject` is a wrapper around a `const char*`; it has
  # a [property@Gtk.StringObject:string] property.
  class StringObject < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, string : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if string
        (_names.to_unsafe + _n).value = "string".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, string)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StringObject.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_string_object_get_type
    end

    def string : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "string", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(string : ::String)
      # gtk_string_object_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_string_object_new(string)
      @pointer = _retval
    end

    def string : ::String
      # gtk_string_object_get_string: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_string_object_get_string(self)
      ::String.new(_retval)
    end
  end
end
