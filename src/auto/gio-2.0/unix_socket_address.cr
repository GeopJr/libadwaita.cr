require "./socket_address"
require "./socket_connectable"

module Gio
  # Support for UNIX-domain (also known as local) sockets.
  #
  # UNIX domain sockets are generally visible in the filesystem.
  # However, some systems support abstract socket names which are not
  # visible in the filesystem and not affected by the filesystem
  # permissions, visibility, etc. Currently this is only supported
  # under Linux. If you attempt to use abstract sockets on other
  # systems, function calls may return %G_IO_ERROR_NOT_SUPPORTED
  # errors. You can use g_unix_socket_address_abstract_names_supported()
  # to see if abstract names are supported.
  #
  # Note that `<gio/gunixsocketaddress.h>` belongs to the UNIX-specific GIO
  # interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
  # when using it.
  class UnixSocketAddress < SocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, abstract _abstract : Bool? = nil, address_type : Gio::UnixSocketAddressType? = nil, family : Gio::SocketFamily? = nil, path : ::String? = nil, path_as_array : Enumerable(UInt8)? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if _abstract
        (_names.to_unsafe + _n).value = "abstract".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, _abstract)
        _n += 1
      end
      if address_type
        (_names.to_unsafe + _n).value = "address-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address_type)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if path
        (_names.to_unsafe + _n).value = "path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path)
        _n += 1
      end
      if path_as_array
        (_names.to_unsafe + _n).value = "path-as-array".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path_as_array)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixSocketAddress.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_socket_address_get_type
    end

    def abstract=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "abstract", unsafe_value, Pointer(Void).null)
      value
    end

    def abstract? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "abstract", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def address_type=(value : Gio::UnixSocketAddressType) : Gio::UnixSocketAddressType
      unsafe_value = value

      LibGObject.g_object_set(self, "address-type", unsafe_value, Pointer(Void).null)
      value
    end

    def address_type : Gio::UnixSocketAddressType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "address-type", pointerof(value), Pointer(Void).null)
      Gio::UnixSocketAddressType.from_value(value)
    end

    def path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "path", unsafe_value, Pointer(Void).null)
      value
    end

    def path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def path_as_array=(value : Enumerable(UInt8)) : Enumerable(UInt8)
      # handle array

      LibGObject.g_object_set(self, "path-as-array", unsafe_value, Pointer(Void).null)
      value
    end

    def path_as_array : Enumerable(UInt8)
      # Returns: None

      value = uninitialized Pointer(UInt8)
      LibGObject.g_object_get(self, "path-as-array", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(path : ::String)
      # g_unix_socket_address_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_socket_address_new(path)
      @pointer = _retval
    end

    def self.new_abstract(path : Enumerable(Int8)) : Gio::SocketAddress
      # g_unix_socket_address_new_abstract: (Constructor)
      # @path: (array length=path_len element-type Int8)
      # Returns: (transfer full)

      path_len = path.size
      path = path.to_a.to_unsafe

      _retval = LibGio.g_unix_socket_address_new_abstract(path, path_len)
      Gio::UnixSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_abstract(*path : Int8)
      self.new_abstract(path)
    end

    def self.new_with_type(path : Enumerable(Int8), type : Gio::UnixSocketAddressType) : Gio::SocketAddress
      # g_unix_socket_address_new_with_type: (Constructor)
      # @path: (array length=path_len element-type Int8)
      # Returns: (transfer full)

      path_len = path.size
      path = path.to_a.to_unsafe

      _retval = LibGio.g_unix_socket_address_new_with_type(path, path_len, type)
      Gio::UnixSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def self.abstract_names_supported : Bool
      # g_unix_socket_address_abstract_names_supported: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_socket_address_abstract_names_supported
      GICrystal.to_bool(_retval)
    end

    def address_type : Gio::UnixSocketAddressType
      # g_unix_socket_address_get_address_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_socket_address_get_address_type(self)
      Gio::UnixSocketAddressType.from_value(_retval)
    end

    def is_abstract : Bool
      # g_unix_socket_address_get_is_abstract: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_socket_address_get_is_abstract(self)
      GICrystal.to_bool(_retval)
    end

    def path : ::String
      # g_unix_socket_address_get_path: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_socket_address_get_path(self)
      ::String.new(_retval)
    end

    def path_len : UInt64
      # g_unix_socket_address_get_path_len: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_socket_address_get_path_len(self)
      _retval
    end
  end
end
