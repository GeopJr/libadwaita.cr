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
  class SimpleProxyResolver < GObject::Object
    include ProxyResolver

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, default_proxy : ::String? = nil, ignore_hosts : Enumerable(::String)? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if default_proxy
        (_names.to_unsafe + _n).value = "default-proxy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_proxy)
        _n += 1
      end
      if ignore_hosts
        (_names.to_unsafe + _n).value = "ignore-hosts".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ignore_hosts)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimpleProxyResolver.g_type, _n, _names, _values)
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

    def self.new(default_proxy : ::String?, ignore_hosts : ::String?) : Gio::ProxyResolver
      # g_simple_proxy_resolver_new: (None)
      # @default_proxy: (nullable)
      # @ignore_hosts: (nullable)
      # Returns: (transfer full)

      default_proxy = if default_proxy.nil?
                        Pointer(LibC::Char).null
                      else
                        default_proxy.to_unsafe
                      end
      ignore_hosts = if ignore_hosts.nil?
                       Pointer(LibC::Char).null
                     else
                       ignore_hosts.to_unsafe
                     end

      _retval = LibGio.g_simple_proxy_resolver_new(default_proxy, ignore_hosts)
      Gio::ProxyResolver__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def default_proxy=(default_proxy : ::String) : Nil
      # g_simple_proxy_resolver_set_default_proxy: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_simple_proxy_resolver_set_default_proxy(self, default_proxy)
    end

    def ignore_hosts=(ignore_hosts : ::String) : Nil
      # g_simple_proxy_resolver_set_ignore_hosts: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_simple_proxy_resolver_set_ignore_hosts(self, ignore_hosts)
    end

    def set_uri_proxy(uri_scheme : ::String, proxy : ::String) : Nil
      # g_simple_proxy_resolver_set_uri_proxy: (Method)
      # Returns: (transfer none)

      LibGio.g_simple_proxy_resolver_set_uri_proxy(self, uri_scheme, proxy)
    end
  end
end
