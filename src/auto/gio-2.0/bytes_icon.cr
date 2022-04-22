require "../g_object-2.0/object"
require "./icon"

require "./loadable_icon"

module Gio
  # #GBytesIcon specifies an image held in memory in a common format (usually
  # png) to be used as icon.
  @[GObject::GeneratedWrapper]
  class BytesIcon < GObject::Object
    include Icon
    include LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::BytesIcon), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, bytes : GLib::Bytes? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !bytes.nil?
        (_names.to_unsafe + _n).value = "bytes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bytes)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BytesIcon.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_bytes_icon_get_type
    end

    def bytes=(value : GLib::Bytes?) : GLib::Bytes?
      unsafe_value = value

      LibGObject.g_object_set(self, "bytes", unsafe_value, Pointer(Void).null)
      value
    end

    def bytes : GLib::Bytes?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "bytes", pointerof(value), Pointer(Void).null)
      GLib::Bytes.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new icon for a bytes.
    #
    # This cannot fail, but loading and interpreting the bytes may fail later on
    # (for example, if g_loadable_icon_load() is called) if the image is invalid.
    def initialize(bytes : GLib::Bytes)
      # g_bytes_icon_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_bytes_icon_new(bytes)

      # Return value handling

      @pointer = _retval
    end

    # Gets the #GBytes associated with the given @icon.
    def bytes : GLib::Bytes
      # g_bytes_icon_get_bytes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_bytes_icon_get_bytes(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end
  end
end
