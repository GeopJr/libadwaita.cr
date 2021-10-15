require "./socket_address"
require "./socket_connectable"

module Gio
  # A socket address of some unknown native type.
  class NativeSocketAddress < SocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, family : Gio::SocketFamily? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NativeSocketAddress.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_native_socket_address_get_type
    end

    def initialize(native : Pointer(Nil)?, len : UInt64)
      # g_native_socket_address_new: (Constructor)
      # @native: (nullable)
      # Returns: (transfer full)

      native = if native.nil?
                 Pointer(Void).null
               else
                 native.to_unsafe
               end

      _retval = LibGio.g_native_socket_address_new(native, len)
      @pointer = _retval
    end
  end
end
