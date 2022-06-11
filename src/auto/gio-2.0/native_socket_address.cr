require "./socket_address"
require "./socket_connectable"

module Gio
  # A socket address of some unknown native type.
  @[GObject::GeneratedWrapper]
  class NativeSocketAddress < SocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::NativeSocketAddressClass), class_init,
        sizeof(LibGio::NativeSocketAddress), instance_init, 0)
    end

    GICrystal.define_new_method(NativeSocketAddress, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `NativeSocketAddress`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, family : Gio::SocketFamily? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NativeSocketAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_native_socket_address_get_type
    end

    # Creates a new #GNativeSocketAddress for @native and @len.
    def self.new(native : Pointer(Void)?, len : UInt64) : self
      # g_native_socket_address_new: (Constructor)
      # @native: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      native = if native.nil?
                 Pointer(Void).null
               else
                 native.to_unsafe
               end

      # C call
      _retval = LibGio.g_native_socket_address_new(native, len)

      # Return value handling

      Gio::NativeSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
