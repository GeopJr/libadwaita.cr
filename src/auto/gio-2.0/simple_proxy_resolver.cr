require "../g_object-2.0/object"
require "./proxy_resolver"

module Gio
  # #GSimpleProxyResolver is a simple #GProxyResolver implementation
  # that handles a single default proxy, multiple URI-scheme-specific
  # proxies, and a list of hosts that proxies should not be used for.
  #
  # #GSimpleProxyResolver is never the default proxy resolver, but it
  # can be used as the base class for another proxy resolver
  # implementation, or it can be created and used manually, such as
  # with g_socket_client_set_proxy_resolver().
  @[GObject::GeneratedWrapper]
  class SimpleProxyResolver < GObject::Object
    include ProxyResolver

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SimpleProxyResolverClass), class_init,
        sizeof(LibGio::SimpleProxyResolver), instance_init, 0)
    end

    GICrystal.define_new_method(SimpleProxyResolver, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SimpleProxyResolver`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, default_proxy : ::String? = nil, ignore_hosts : Enumerable(::String)? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !default_proxy.nil?
        (_names.to_unsafe + _n).value = "default-proxy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_proxy)
        _n += 1
      end
      if !ignore_hosts.nil?
        (_names.to_unsafe + _n).value = "ignore-hosts".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ignore_hosts)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimpleProxyResolver.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_proxy_resolver_get_type
    end

    def default_proxy=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "default-proxy", unsafe_value, Pointer(Void).null)
      value
    end

    def default_proxy : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "default-proxy", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def ignore_hosts=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "ignore-hosts", unsafe_value, Pointer(Void).null)
      value
    end

    def ignore_hosts : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "ignore-hosts", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    # Creates a new #GSimpleProxyResolver. See
    # #GSimpleProxyResolver:default-proxy and
    # #GSimpleProxyResolver:ignore-hosts for more details on how the
    # arguments are interpreted.
    def self.new(default_proxy : ::String?, ignore_hosts : Enumerable(::String)?) : Gio::ProxyResolver
      # g_simple_proxy_resolver_new: (None)
      # @default_proxy: (nullable)
      # @ignore_hosts: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      default_proxy = if default_proxy.nil?
                        Pointer(LibC::Char).null
                      else
                        default_proxy.to_unsafe
                      end
      # Generator::NullableArrayPlan
      ignore_hosts = if ignore_hosts.nil?
                       Pointer(Pointer(LibC::Char)).null
                     else
                       ignore_hosts.to_a.map(&.to_unsafe).to_unsafe
                     end

      # C call
      _retval = LibGio.g_simple_proxy_resolver_new(default_proxy, ignore_hosts)

      # Return value handling

      Gio::AbstractProxyResolver.new(_retval, GICrystal::Transfer::Full)
    end

    # Sets the default proxy on @resolver, to be used for any URIs that
    # don't match #GSimpleProxyResolver:ignore-hosts or a proxy set
    # via g_simple_proxy_resolver_set_uri_proxy().
    #
    # If @default_proxy starts with "socks://",
    # #GSimpleProxyResolver will treat it as referring to all three of
    # the socks5, socks4a, and socks4 proxy types.
    def default_proxy=(default_proxy : ::String) : Nil
      # g_simple_proxy_resolver_set_default_proxy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_simple_proxy_resolver_set_default_proxy(@pointer, default_proxy)

      # Return value handling
    end

    # Sets the list of ignored hosts.
    #
    # See #GSimpleProxyResolver:ignore-hosts for more details on how the
    # @ignore_hosts argument is interpreted.
    def ignore_hosts=(ignore_hosts : Enumerable(::String)) : Nil
      # g_simple_proxy_resolver_set_ignore_hosts: (Method | Setter)
      # @ignore_hosts: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      ignore_hosts = ignore_hosts.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_simple_proxy_resolver_set_ignore_hosts(@pointer, ignore_hosts)

      # Return value handling
    end

    # Adds a URI-scheme-specific proxy to @resolver; URIs whose scheme
    # matches @uri_scheme (and which don't match
    # #GSimpleProxyResolver:ignore-hosts) will be proxied via @proxy.
    #
    # As with #GSimpleProxyResolver:default-proxy, if @proxy starts with
    # "socks://", #GSimpleProxyResolver will treat it
    # as referring to all three of the socks5, socks4a, and socks4 proxy
    # types.
    def set_uri_proxy(uri_scheme : ::String, proxy : ::String) : Nil
      # g_simple_proxy_resolver_set_uri_proxy: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_simple_proxy_resolver_set_uri_proxy(@pointer, uri_scheme, proxy)

      # Return value handling
    end
  end
end
