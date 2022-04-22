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
  # Since GLib 2.72, #GUnixSocketAddress is available on all platforms. It
  # requires underlying system support (such as Windows 10 with `AF_UNIX`) at
  # run time.
  #
  # Before GLib 2.72, `<gio/gunixsocketaddress.h>` belonged to the UNIX-specific
  # GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
  # when using it. This is no longer necessary since GLib 2.72.
  @[GObject::GeneratedWrapper]
  class UnixSocketAddress < SocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixSocketAddressClass), class_init,
        sizeof(LibGio::UnixSocketAddress), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, abstract _abstract : Bool? = nil, address_type : Gio::UnixSocketAddressType? = nil, family : Gio::SocketFamily? = nil, path : ::String? = nil, path_as_array : Enumerable(UInt8)? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !_abstract.nil?
        (_names.to_unsafe + _n).value = "abstract".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, _abstract)
        _n += 1
      end
      if !address_type.nil?
        (_names.to_unsafe + _n).value = "address-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address_type)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !path.nil?
        (_names.to_unsafe + _n).value = "path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path)
        _n += 1
      end
      if !path_as_array.nil?
        (_names.to_unsafe + _n).value = "path-as-array".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, path_as_array)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixSocketAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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
      Gio::UnixSocketAddressType.new(value)
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

    # Creates a new #GUnixSocketAddress for @path.
    #
    # To create abstract socket addresses, on systems that support that,
    # use g_unix_socket_address_new_abstract().
    def initialize(path : ::String)
      # g_unix_socket_address_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_socket_address_new(path)

      # Return value handling

      @pointer = _retval
    end

    # Creates a new %G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED
    # #GUnixSocketAddress for @path.
    def self.new_abstract(path : Enumerable(Int8)) : self
      # g_unix_socket_address_new_abstract: (Constructor)
      # @path: (array length=path_len element-type Int8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      path_len = path.size
      # Generator::ArrayArgPlan
      path = path.to_a.to_unsafe

      # C call
      _retval = LibGio.g_unix_socket_address_new_abstract(path, path_len)

      # Return value handling

      Gio::UnixSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_abstract(*path : Int8)
      self.new_abstract(path)
    end

    # Creates a new #GUnixSocketAddress of type @type with name @path.
    #
    # If @type is %G_UNIX_SOCKET_ADDRESS_PATH, this is equivalent to
    # calling g_unix_socket_address_new().
    #
    # If @type is %G_UNIX_SOCKET_ADDRESS_ANONYMOUS, @path and @path_len will be
    # ignored.
    #
    # If @path_type is %G_UNIX_SOCKET_ADDRESS_ABSTRACT, then @path_len
    # bytes of @path will be copied to the socket's path, and only those
    # bytes will be considered part of the name. (If @path_len is -1,
    # then @path is assumed to be NUL-terminated.) For example, if @path
    # was "test", then calling g_socket_address_get_native_size() on the
    # returned socket would return 7 (2 bytes of overhead, 1 byte for the
    # abstract-socket indicator byte, and 4 bytes for the name "test").
    #
    # If @path_type is %G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED, then
    # @path_len bytes of @path will be copied to the socket's path, the
    # rest of the path will be padded with 0 bytes, and the entire
    # zero-padded buffer will be considered the name. (As above, if
    # @path_len is -1, then @path is assumed to be NUL-terminated.) In
    # this case, g_socket_address_get_native_size() will always return
    # the full size of a `struct sockaddr_un`, although
    # g_unix_socket_address_get_path_len() will still return just the
    # length of @path.
    #
    # %G_UNIX_SOCKET_ADDRESS_ABSTRACT is preferred over
    # %G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED for new programs. Of course,
    # when connecting to a server created by another process, you must
    # use the appropriate type corresponding to how that process created
    # its listening socket.
    def self.new_with_type(path : Enumerable(Int8), type : Gio::UnixSocketAddressType) : self
      # g_unix_socket_address_new_with_type: (Constructor)
      # @path: (array length=path_len element-type Int8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      path_len = path.size
      # Generator::ArrayArgPlan
      path = path.to_a.to_unsafe

      # C call
      _retval = LibGio.g_unix_socket_address_new_with_type(path, path_len, type)

      # Return value handling

      Gio::UnixSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks if abstract UNIX domain socket names are supported.
    def self.abstract_names_supported : Bool
      # g_unix_socket_address_abstract_names_supported: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_socket_address_abstract_names_supported

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets @address's type.
    def address_type : Gio::UnixSocketAddressType
      # g_unix_socket_address_get_address_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_socket_address_get_address_type(self)

      # Return value handling

      Gio::UnixSocketAddressType.new(_retval)
    end

    # Tests if @address is abstract.
    def is_abstract : Bool
      # g_unix_socket_address_get_is_abstract: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_socket_address_get_is_abstract(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets @address's path, or for abstract sockets the "name".
    #
    # Guaranteed to be zero-terminated, but an abstract socket
    # may contain embedded zeros, and thus you should use
    # g_unix_socket_address_get_path_len() to get the true length
    # of this string.
    def path : ::String
      # g_unix_socket_address_get_path: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_socket_address_get_path(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the length of @address's path.
    #
    # For details, see g_unix_socket_address_get_path().
    def path_len : UInt64
      # g_unix_socket_address_get_path_len: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_socket_address_get_path_len(self)

      # Return value handling

      _retval
    end
  end
end
