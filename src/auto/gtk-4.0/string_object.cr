require "../g_object-2.0/object"

module Gtk
  # `GtkStringObject` is the type of items in a `GtkStringList`.
  #
  # A `GtkStringObject` is a wrapper around a `const char*`; it has
  # a `Gtk::StringObject#string` property.
  @[GObject::GeneratedWrapper]
  class StringObject < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::StringObjectClass), class_init,
        sizeof(LibGtk::StringObject), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, string : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !string.nil?
        (_names.to_unsafe + _n).value = "string".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, string)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StringObject.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Wraps a string in an object for use with `GListModel`.
    def initialize(string : ::String)
      # gtk_string_object_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_string_object_new(string)

      # Return value handling

      @pointer = _retval
    end

    # Returns the string contained in a `GtkStringObject`.
    def string : ::String
      # gtk_string_object_get_string: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_object_get_string(self)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
