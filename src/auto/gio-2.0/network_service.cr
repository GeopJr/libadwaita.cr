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
  @[GObject::GeneratedWrapper]
  class NetworkService < GObject::Object
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::NetworkServiceClass), class_init,
        sizeof(LibGio::NetworkService), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, domain : ::String? = nil, protocol : ::String? = nil, scheme : ::String? = nil, service : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !domain.nil?
        (_names.to_unsafe + _n).value = "domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, domain)
        _n += 1
      end
      if !protocol.nil?
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if !scheme.nil?
        (_names.to_unsafe + _n).value = "scheme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scheme)
        _n += 1
      end
      if !service.nil?
        (_names.to_unsafe + _n).value = "service".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, service)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NetworkService.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new #GNetworkService representing the given @service,
    # @protocol, and @domain. This will initially be unresolved; use the
    # #GSocketConnectable interface to resolve it.
    def initialize(service : ::String, protocol : ::String, domain : ::String)
      # g_network_service_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_network_service_new(service, protocol, domain)

      # Return value handling

      @pointer = _retval
    end

    # Gets the domain that @srv serves. This might be either UTF-8 or
    # ASCII-encoded, depending on what @srv was created with.
    def domain : ::String
      # g_network_service_get_domain: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_service_get_domain(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets @srv's protocol name (eg, "tcp").
    def protocol : ::String
      # g_network_service_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_service_get_protocol(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the URI scheme used to resolve proxies. By default, the service name
    # is used as scheme.
    def scheme : ::String
      # g_network_service_get_scheme: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_service_get_scheme(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets @srv's service name (eg, "ldap").
    def service : ::String
      # g_network_service_get_service: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_service_get_service(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Set's the URI scheme used to resolve proxies. By default, the service name
    # is used as scheme.
    def scheme=(scheme : ::String) : Nil
      # g_network_service_set_scheme: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_network_service_set_scheme(self, scheme)

      # Return value handling
    end
  end
end
