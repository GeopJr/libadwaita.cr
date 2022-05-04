require "../g_object-2.0/object"
require "./socket_connectable"

module Gio
  # #GSocketAddress is the equivalent of struct sockaddr in the BSD
  # sockets API. This is an abstract class; use #GInetSocketAddress
  # for internet sockets, or #GUnixSocketAddress for UNIX domain sockets.
  @[GObject::GeneratedWrapper]
  class SocketAddress < GObject::Object
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketAddressClass), class_init,
        sizeof(LibGio::SocketAddress), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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

      @pointer = LibGObject.g_object_new_with_properties(SocketAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_address_get_type
    end

    def family : Gio::SocketFamily
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      Gio::SocketFamily.new(value)
    end

    # Creates a #GSocketAddress subclass corresponding to the native
    # struct sockaddr @native.
    def self.new_from_native(native : Pointer(Void), len : UInt64) : self
      # g_socket_address_new_from_native: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_socket_address_new_from_native(native, len)

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the socket family type of @address.
    def family : Gio::SocketFamily
      # g_socket_address_get_family: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_address_get_family(self)

      # Return value handling

      Gio::SocketFamily.new(_retval)
    end

    # Gets the size of @address's native struct sockaddr.
    # You can use this to allocate memory to pass to
    # g_socket_address_to_native().
    def native_size : Int64
      # g_socket_address_get_native_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_address_get_native_size(self)

      # Return value handling

      _retval
    end

    # Converts a #GSocketAddress to a native struct sockaddr, which can
    # be passed to low-level functions like connect() or bind().
    #
    # If not enough space is available, a %G_IO_ERROR_NO_SPACE error
    # is returned. If the address type is not known on the system
    # then a %G_IO_ERROR_NOT_SUPPORTED error is returned.
    def to_native(dest : Pointer(Void)?, destlen : UInt64) : Bool
      # g_socket_address_to_native: (Method | Throws)
      # @dest: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
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
