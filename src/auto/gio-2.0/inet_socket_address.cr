require "./socket_address"
require "./socket_connectable"

module Gio
  # An IPv4 or IPv6 socket address; that is, the combination of a
  # #GInetAddress and a port number.
  @[GObject::GeneratedWrapper]
  class InetSocketAddress < SocketAddress
    include SocketConnectable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::InetSocketAddressClass), class_init,
        sizeof(LibGio::InetSocketAddress), instance_init, 0)
    end

    GICrystal.define_new_method(InetSocketAddress, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `InetSocketAddress`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : Gio::InetAddress? = nil, family : Gio::SocketFamily? = nil, flowinfo : UInt32? = nil, port : UInt32? = nil, scope_id : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !address.nil?
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
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
      if !port.nil?
        (_names.to_unsafe + _n).value = "port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, port)
        _n += 1
      end
      if !scope_id.nil?
        (_names.to_unsafe + _n).value = "scope-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope_id)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(InetSocketAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_inet_socket_address_get_type
    end

    def address=(value : Gio::InetAddress?) : Gio::InetAddress?
      unsafe_value = value

      LibGObject.g_object_set(self, "address", unsafe_value, Pointer(Void).null)
      value
    end

    def address : Gio::InetAddress?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "address", pointerof(value), Pointer(Void).null)
      Gio::InetAddress.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def flowinfo=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "flowinfo", unsafe_value, Pointer(Void).null)
      value
    end

    def flowinfo : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flowinfo", pointerof(value), Pointer(Void).null)
      value
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

    def scope_id=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "scope-id", unsafe_value, Pointer(Void).null)
      value
    end

    def scope_id : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "scope-id", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new #GInetSocketAddress for @address and @port.
    def self.new(address : Gio::InetAddress, port : UInt16) : self
      # g_inet_socket_address_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_socket_address_new(address, port)

      # Return value handling

      Gio::InetSocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GInetSocketAddress for @address and @port.
    #
    # If @address is an IPv6 address, it can also contain a scope ID
    # (separated from the address by a `%`).
    def self.new_from_string(address : ::String, port : UInt32) : self?
      # g_inet_socket_address_new_from_string: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_socket_address_new_from_string(address, port)

      # Return value handling

      Gio::InetSocketAddress.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets @address's #GInetAddress.
    def address : Gio::InetAddress
      # g_inet_socket_address_get_address: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_socket_address_get_address(@pointer)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `sin6_flowinfo` field from @address,
    # which must be an IPv6 address.
    def flowinfo : UInt32
      # g_inet_socket_address_get_flowinfo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_socket_address_get_flowinfo(@pointer)

      # Return value handling

      _retval
    end

    # Gets @address's port.
    def port : UInt16
      # g_inet_socket_address_get_port: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_socket_address_get_port(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `sin6_scope_id` field from @address,
    # which must be an IPv6 address.
    def scope_id : UInt32
      # g_inet_socket_address_get_scope_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_socket_address_get_scope_id(@pointer)

      # Return value handling

      _retval
    end
  end
end
