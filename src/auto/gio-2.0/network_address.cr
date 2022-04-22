require "../g_object-2.0/object"
require "./socket_connectable"

module Gio
  # #GNetworkAddress provides an easy way to resolve a hostname and
  # then attempt to connect to that host, handling the possibility of
  # multiple IP addresses and multiple address families.
  #
  # The enumeration results of resolved addresses *may* be cached as long
  # as this object is kept alive which may have unexpected results if
  # alive for too long.
  #
  # See #GSocketConnectable for an example of using the connectable
  # interface.
  @[GObject::GeneratedWrapper]
  class NetworkAddress < GObject::Object
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::NetworkAddressClass), class_init,
        sizeof(LibGio::NetworkAddress), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, hostname : ::String? = nil, port : UInt32? = nil, scheme : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !hostname.nil?
        (_names.to_unsafe + _n).value = "hostname".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hostname)
        _n += 1
      end
      if !port.nil?
        (_names.to_unsafe + _n).value = "port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, port)
        _n += 1
      end
      if !scheme.nil?
        (_names.to_unsafe + _n).value = "scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scheme)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NetworkAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_network_address_get_type
    end

    def hostname=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "hostname", unsafe_value, Pointer(Void).null)
      value
    end

    def hostname : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "hostname", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def port=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "port", unsafe_value, Pointer(Void).null)
      value
    end

    def port : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "port", pointerof(value), Pointer(Void).null)
      value
    end

    def scheme=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "scheme", unsafe_value, Pointer(Void).null)
      value
    end

    def scheme : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "scheme", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GSocketConnectable for connecting to the given
    # @hostname and @port.
    #
    # Note that depending on the configuration of the machine, a
    # @hostname of `localhost` may refer to the IPv4 loopback address
    # only, or to both IPv4 and IPv6; use
    # g_network_address_new_loopback() to create a #GNetworkAddress that
    # is guaranteed to resolve to both addresses.
    def initialize(hostname : ::String, port : UInt16)
      # g_network_address_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_network_address_new(hostname, port)

      # Return value handling

      @pointer = _retval
    end

    # Creates a new #GSocketConnectable for connecting to the local host
    # over a loopback connection to the given @port. This is intended for
    # use in connecting to local services which may be running on IPv4 or
    # IPv6.
    #
    # The connectable will return IPv4 and IPv6 loopback addresses,
    # regardless of how the host resolves `localhost`. By contrast,
    # g_network_address_new() will often only return an IPv4 address when
    # resolving `localhost`, and an IPv6 address for `localhost6`.
    #
    # g_network_address_get_hostname() will always return `localhost` for
    # a #GNetworkAddress created with this constructor.
    def self.new_loopback(port : UInt16) : self
      # g_network_address_new_loopback: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_network_address_new_loopback(port)

      # Return value handling

      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def parse(host_and_port : ::String, default_port : UInt16) : Gio::NetworkAddress
      # g_network_address_parse: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_network_address_parse(host_and_port, default_port, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def parse_uri(uri : ::String, default_port : UInt16) : Gio::NetworkAddress
      # g_network_address_parse_uri: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_network_address_parse_uri(uri, default_port, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets @addr's hostname. This might be either UTF-8 or ASCII-encoded,
    # depending on what @addr was created with.
    def hostname : ::String
      # g_network_address_get_hostname: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_address_get_hostname(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets @addr's port number
    def port : UInt16
      # g_network_address_get_port: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_address_get_port(self)

      # Return value handling

      _retval
    end

    # Gets @addr's scheme
    def scheme : ::String?
      # g_network_address_get_scheme: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_address_get_scheme(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end
  end
end
