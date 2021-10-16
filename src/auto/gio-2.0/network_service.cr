require "../g_object-2.0/object"
require "./socket_connectable"

module Gio
  # Like #GNetworkAddress does with hostnames, #GNetworkService
  # provides an easy way to resolve a SRV record, and then attempt to
  # connect to one of the hosts that implements that service, handling
  # service priority/weighting, multiple IP addresses, and multiple
  # address families.
  #
  # See #GSrvTarget for more information about SRV records, and see
  # #GSocketConnectable for an example of using the connectable
  # interface.
  class NetworkService < GObject::Object
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, domain : ::String? = nil, protocol : ::String? = nil, scheme : ::String? = nil, service : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if domain
        (_names.to_unsafe + _n).value = "domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, domain)
        _n += 1
      end
      if protocol
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if scheme
        (_names.to_unsafe + _n).value = "scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scheme)
        _n += 1
      end
      if service
        (_names.to_unsafe + _n).value = "service".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, service)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NetworkService.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_network_service_get_type
    end

    def domain=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "domain", unsafe_value, Pointer(Void).null)
      value
    end

    def domain : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "domain", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def protocol=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "protocol", unsafe_value, Pointer(Void).null)
      value
    end

    def protocol : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "protocol", pointerof(value), Pointer(Void).null)
      ::String.new(value)
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

    def service=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "service", unsafe_value, Pointer(Void).null)
      value
    end

    def service : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "service", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(service : ::String, protocol : ::String, domain : ::String)
      # g_network_service_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_network_service_new(service, protocol, domain)
      @pointer = _retval
    end

    def domain : ::String
      # g_network_service_get_domain: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_service_get_domain(self)
      ::String.new(_retval)
    end

    def protocol : ::String
      # g_network_service_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_service_get_protocol(self)
      ::String.new(_retval)
    end

    def scheme : ::String
      # g_network_service_get_scheme: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_service_get_scheme(self)
      ::String.new(_retval)
    end

    def service : ::String
      # g_network_service_get_service: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_network_service_get_service(self)
      ::String.new(_retval)
    end

    def scheme=(scheme : ::String) : Nil
      # g_network_service_set_scheme: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_network_service_set_scheme(self, scheme)
    end
  end
end
