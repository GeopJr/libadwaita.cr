require "../g_object-2.0/object"
require "./socket_connectable"

module Gio
  # #GSocketAddress is the equivalent of struct sockaddr in the BSD
  # sockets API. This is an abstract class; use #GInetSocketAddress
  # for internet sockets, or #GUnixSocketAddress for UNIX domain sockets.
  class SocketAddress < GObject::Object
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

      @pointer = LibGObject.g_object_new_with_properties(SocketAddress.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_address_get_type
    end

    def family : Gio::SocketFamily
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      Gio::SocketFamily.from_value(value)
    end

    def self.new_from_native(native : Pointer(Void), len : UInt64) : self
      # g_socket_address_new_from_native: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_address_new_from_native(native, len)

      # Return value handling
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def family : Gio::SocketFamily
      # g_socket_address_get_family: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_address_get_family(self)

      # Return value handling
      Gio::SocketFamily.from_value(_retval)
    end

    def native_size : Int64
      # g_socket_address_get_native_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_address_get_native_size(self)

      # Return value handling
      _retval
    end

    def to_native(dest : Pointer(Void)?, destlen : UInt64) : Bool
      # g_socket_address_to_native: (Method | Throws)
      # @dest: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      dest = if dest.nil?
               Pointer(Void).null
             else
               dest.to_unsafe
             end

      # C call
      _retval = LibGio.g_socket_address_to_native(self, dest, destlen, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
