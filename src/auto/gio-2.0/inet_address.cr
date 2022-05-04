require "../g_object-2.0/object"

module Gio
  # #GInetAddress represents an IPv4 or IPv6 internet address. Use
  # g_resolver_lookup_by_name() or g_resolver_lookup_by_name_async() to
  # look up the #GInetAddress for a hostname. Use
  # g_resolver_lookup_by_address() or
  # g_resolver_lookup_by_address_async() to look up the hostname for a
  # #GInetAddress.
  #
  # To actually connect to a remote host, you will need a
  # #GInetSocketAddress (which includes a #GInetAddress as well as a
  # port number).
  @[GObject::GeneratedWrapper]
  class InetAddress < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::InetAddressClass), class_init,
        sizeof(LibGio::InetAddress), instance_init, 0)
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

    def initialize(*, bytes : Pointer(Void)? = nil, family : Gio::SocketFamily? = nil, is_any : Bool? = nil, is_link_local : Bool? = nil, is_loopback : Bool? = nil, is_mc_global : Bool? = nil, is_mc_link_local : Bool? = nil, is_mc_node_local : Bool? = nil, is_mc_org_local : Bool? = nil, is_mc_site_local : Bool? = nil, is_multicast : Bool? = nil, is_site_local : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if !bytes.nil?
        (_names.to_unsafe + _n).value = "bytes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bytes)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !is_any.nil?
        (_names.to_unsafe + _n).value = "is-any".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_any)
        _n += 1
      end
      if !is_link_local.nil?
        (_names.to_unsafe + _n).value = "is-link-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_link_local)
        _n += 1
      end
      if !is_loopback.nil?
        (_names.to_unsafe + _n).value = "is-loopback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_loopback)
        _n += 1
      end
      if !is_mc_global.nil?
        (_names.to_unsafe + _n).value = "is-mc-global".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_mc_global)
        _n += 1
      end
      if !is_mc_link_local.nil?
        (_names.to_unsafe + _n).value = "is-mc-link-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_mc_link_local)
        _n += 1
      end
      if !is_mc_node_local.nil?
        (_names.to_unsafe + _n).value = "is-mc-node-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_mc_node_local)
        _n += 1
      end
      if !is_mc_org_local.nil?
        (_names.to_unsafe + _n).value = "is-mc-org-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_mc_org_local)
        _n += 1
      end
      if !is_mc_site_local.nil?
        (_names.to_unsafe + _n).value = "is-mc-site-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_mc_site_local)
        _n += 1
      end
      if !is_multicast.nil?
        (_names.to_unsafe + _n).value = "is-multicast".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_multicast)
        _n += 1
      end
      if !is_site_local.nil?
        (_names.to_unsafe + _n).value = "is-site-local".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_site_local)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(InetAddress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_inet_address_get_type
    end

    def bytes=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "bytes", unsafe_value, Pointer(Void).null)
      value
    end

    def bytes : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "bytes", pointerof(value), Pointer(Void).null)
      value
    end

    def family=(value : Gio::SocketFamily) : Gio::SocketFamily
      unsafe_value = value

      LibGObject.g_object_set(self, "family", unsafe_value, Pointer(Void).null)
      value
    end

    def family : Gio::SocketFamily
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      Gio::SocketFamily.new(value)
    end

    def is_any? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-any", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_link_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-link-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_loopback? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-loopback", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_mc_global? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-mc-global", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_mc_link_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-mc-link-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_mc_node_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-mc-node-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_mc_org_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-mc-org-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_mc_site_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-mc-site-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_multicast? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-multicast", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_site_local? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-site-local", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a #GInetAddress for the "any" address (unassigned/"don't
    # care") for @family.
    def self.new_any(family : Gio::SocketFamily) : self
      # g_inet_address_new_any: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_address_new_any(family)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GInetAddress from the given @family and @bytes.
    # @bytes should be 4 bytes for %G_SOCKET_FAMILY_IPV4 and 16 bytes for
    # %G_SOCKET_FAMILY_IPV6.
    def self.new_from_bytes(bytes : Enumerable(UInt8), family : Gio::SocketFamily) : self
      # g_inet_address_new_from_bytes: (Constructor)
      # @bytes: (array element-type UInt8)
      # Returns: (transfer full)

      # Generator::ArrayArgPlan
      bytes = bytes.to_a.to_unsafe

      # C call
      _retval = LibGio.g_inet_address_new_from_bytes(bytes, family)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Parses @string as an IP address and creates a new #GInetAddress.
    def self.new_from_string(string : ::String) : self?
      # g_inet_address_new_from_string: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_address_new_from_string(string)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a #GInetAddress for the loopback address for @family.
    def self.new_loopback(family : Gio::SocketFamily) : self
      # g_inet_address_new_loopback: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_address_new_loopback(family)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks if two #GInetAddress instances are equal, e.g. the same address.
    def equal(other_address : Gio::InetAddress) : Bool
      # g_inet_address_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_equal(self, other_address)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets @address's family
    def family : Gio::SocketFamily
      # g_inet_address_get_family: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_family(self)

      # Return value handling

      Gio::SocketFamily.new(_retval)
    end

    # Tests whether @address is the "any" address for its family.
    def is_any : Bool
      # g_inet_address_get_is_any: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_any(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a link-local address (that is, if it
    # identifies a host on a local network that is not connected to the
    # Internet).
    def is_link_local : Bool
      # g_inet_address_get_is_link_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_link_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is the loopback address for its family.
    def is_loopback : Bool
      # g_inet_address_get_is_loopback: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_loopback(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a global multicast address.
    def is_mc_global : Bool
      # g_inet_address_get_is_mc_global: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_mc_global(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a link-local multicast address.
    def is_mc_link_local : Bool
      # g_inet_address_get_is_mc_link_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_mc_link_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a node-local multicast address.
    def is_mc_node_local : Bool
      # g_inet_address_get_is_mc_node_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_mc_node_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is an organization-local multicast address.
    def is_mc_org_local : Bool
      # g_inet_address_get_is_mc_org_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_mc_org_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a site-local multicast address.
    def is_mc_site_local : Bool
      # g_inet_address_get_is_mc_site_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_mc_site_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a multicast address.
    def is_multicast : Bool
      # g_inet_address_get_is_multicast: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_multicast(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tests whether @address is a site-local address such as 10.0.0.1
    # (that is, the address identifies a host on a local network that can
    # not be reached directly from the Internet, but which may have
    # outgoing Internet connectivity via a NAT or firewall).
    def is_site_local : Bool
      # g_inet_address_get_is_site_local: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_is_site_local(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the size of the native raw binary address for @address. This
    # is the size of the data that you get from g_inet_address_to_bytes().
    def native_size : UInt64
      # g_inet_address_get_native_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_get_native_size(self)

      # Return value handling

      _retval
    end

    # Converts @address to string form.
    def to_string : ::String
      # g_inet_address_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_address_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end
  end
end
