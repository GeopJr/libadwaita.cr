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
  class NetworkAddress < GObject::Object
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, hostname : ::String? = nil, port : UInt32? = nil, scheme : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if hostname
        (_names.to_unsafe + _n).value = "hostname".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hostname)
        _n += 1
      end
      if port
        (_names.to_unsafe + _n).value = "port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, port)
        _n += 1
      end
      if scheme
        (_names.to_unsafe + _n).value = "scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scheme)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NetworkAddress.g_type, _n, _names, _values)
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

    def port=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "port", unsafe_value, Pointer(Void).null)
      value
    end

    def scheme=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "scheme", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(hostname : ::String, port : UInt16)
      # g_network_address_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_network_address_new(hostname, port)
      @pointer = _retval
    end

    def self.new_loopback(port : UInt16) : Gio::NetworkAddress
      # g_network_address_new_loopback: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_network_address_new_loopback(port)
      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def parse(host_and_port : ::String, default_port : UInt16) : Gio::NetworkAddress
      # g_network_address_parse: (Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_network_address_parse(host_and_port, default_port)
      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def parse_uri(uri : ::String, default_port : UInt16) : Gio::NetworkAddress
      # g_network_address_parse_uri: (Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_network_address_parse_uri(uri, default_port)
      Gio::NetworkAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def hostname : ::String
      # g_network_address_get_hostname: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_address_get_hostname(self)
      ::String.new(_retval)
    end

    def port : UInt16
      # g_network_address_get_port: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_address_get_port(self)
      _retval
    end

    def scheme : ::String?
      # g_network_address_get_scheme: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_address_get_scheme(self)
      ::String.new(_retval) unless _retval.null?
    end
  end
end
