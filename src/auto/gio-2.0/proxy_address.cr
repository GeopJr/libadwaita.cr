require "./inet_socket_address"
require "./socket_connectable"

module Gio
  # Support for proxied #GInetSocketAddress.
  @[GObject::GeneratedWrapper]
  class ProxyAddress < InetSocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ProxyAddressClass), class_init,
        sizeof(LibGio::ProxyAddress), instance_init, 0)
    end

    GICrystal.define_new_method(ProxyAddress, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ProxyAddress`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : Gio::InetAddress? = nil, destination_hostname : ::String? = nil, destination_port : UInt32? = nil, destination_protocol : ::String? = nil, family : Gio::SocketFamily? = nil, flowinfo : UInt32? = nil, password : ::String? = nil, port : UInt32? = nil, protocol : ::String? = nil, scope_id : UInt32? = nil, uri : ::String? = nil, username : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if !address.nil?
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if !destination_hostname.nil?
        (_names.to_unsafe + _n).value = "destination-hostname".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destination_hostname)
        _n += 1
      end
      if !destination_port.nil?
        (_names.to_unsafe + _n).value = "destination-port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destination_port)
        _n += 1
      end
      if !destination_protocol.nil?
        (_names.to_unsafe + _n).value = "destination-protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destination_protocol)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !flowinfo.nil?
        (_names.to_unsafe + _n).value = "flowinfo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flowinfo)
        _n += 1
      end
      if !password.nil?
        (_names.to_unsafe + _n).value = "password".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password)
        _n += 1
      end
      if !port.nil?
        (_names.to_unsafe + _n).value = "port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, port)
        _n += 1
      end
      if !protocol.nil?
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if !scope_id.nil?
        (_names.to_unsafe + _n).value = "scope-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope_id)
        _n += 1
      end
      if !uri.nil?
        (_names.to_unsafe + _n).value = "uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, uri)
        _n += 1
      end
      if !username.nil?
        (_names.to_unsafe + _n).value = "username".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, username)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ProxyAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_proxy_address_get_type
    end

    def destination_hostname=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "destination-hostname", unsafe_value, Pointer(Void).null)
      value
    end

    def destination_hostname : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "destination-hostname", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def destination_port=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "destination-port", unsafe_value, Pointer(Void).null)
      value
    end

    def destination_port : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "destination-port", pointerof(value), Pointer(Void).null)
      value
    end

    def destination_protocol=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "destination-protocol", unsafe_value, Pointer(Void).null)
      value
    end

    def destination_protocol : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "destination-protocol", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def password=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "password", unsafe_value, Pointer(Void).null)
      value
    end

    def password : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "password", pointerof(value), Pointer(Void).null)
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

    def uri=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "uri", unsafe_value, Pointer(Void).null)
      value
    end

    def uri : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "uri", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def username=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "username", unsafe_value, Pointer(Void).null)
      value
    end

    def username : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "username", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GProxyAddress for @inetaddr with @protocol that should
    # tunnel through @dest_hostname and @dest_port.
    #
    # (Note that this method doesn't set the #GProxyAddress:uri or
    # #GProxyAddress:destination-protocol fields; use g_object_new()
    # directly if you want to set those.)
    def self.new(inetaddr : Gio::InetAddress, port : UInt16, protocol : ::String, dest_hostname : ::String, dest_port : UInt16, username : ::String?, password : ::String?) : self
      # g_proxy_address_new: (Constructor)
      # @username: (nullable)
      # @password: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      username = if username.nil?
                   Pointer(LibC::Char).null
                 else
                   username.to_unsafe
                 end
      # Generator::NullableArrayPlan
      password = if password.nil?
                   Pointer(LibC::Char).null
                 else
                   password.to_unsafe
                 end

      # C call
      _retval = LibGio.g_proxy_address_new(inetaddr, port, protocol, dest_hostname, dest_port, username, password)

      # Return value handling

      Gio::ProxyAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets @proxy's destination hostname; that is, the name of the host
    # that will be connected to via the proxy, not the name of the proxy
    # itself.
    def destination_hostname : ::String
      # g_proxy_address_get_destination_hostname: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_destination_hostname(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets @proxy's destination port; that is, the port on the
    # destination host that will be connected to via the proxy, not the
    # port number of the proxy itself.
    def destination_port : UInt16
      # g_proxy_address_get_destination_port: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_destination_port(@pointer)

      # Return value handling

      _retval
    end

    # Gets the protocol that is being spoken to the destination
    # server; eg, "http" or "ftp".
    def destination_protocol : ::String
      # g_proxy_address_get_destination_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_destination_protocol(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets @proxy's password.
    def password : ::String?
      # g_proxy_address_get_password: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_password(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets @proxy's protocol. eg, "socks" or "http"
    def protocol : ::String
      # g_proxy_address_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_protocol(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the proxy URI that @proxy was constructed from.
    def uri : ::String?
      # g_proxy_address_get_uri: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_uri(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets @proxy's username.
    def username : ::String?
      # g_proxy_address_get_username: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_address_get_username(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end
  end
end
