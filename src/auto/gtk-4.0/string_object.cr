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

    GICrystal.define_new_method(StringObject, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `StringObject`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def self.new(string : ::String) : self
      # gtk_string_object_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_string_object_new(string)

      # Return value handling

      Gtk::StringObject.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the string contained in a `GtkStringObject`.
    def string : ::String
      # gtk_string_object_get_string: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_object_get_string(@pointer)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
