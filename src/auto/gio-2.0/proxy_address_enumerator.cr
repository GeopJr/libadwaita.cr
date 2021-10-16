require "./socket_address_enumerator"

module Gio
  # #GProxyAddressEnumerator is a wrapper around #GSocketAddressEnumerator which
  # takes the #GSocketAddress instances returned by the #GSocketAddressEnumerator
  # and wraps them in #GProxyAddress instances, using the given
  # #GProxyAddressEnumerator:proxy-resolver.
  #
  # This enumerator will be returned (for example, by
  # g_socket_connectable_enumerate()) as appropriate when a proxy is configured;
  # there should be no need to manually wrap a #GSocketAddressEnumerator instance
  # with one.
  class ProxyAddressEnumerator < SocketAddressEnumerator
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, connectable : Gio::SocketConnectable? = nil, default_port : UInt32? = nil, proxy_resolver : Gio::ProxyResolver? = nil, uri : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if connectable
        (_names.to_unsafe + _n).value = "connectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connectable)
        _n += 1
      end
      if default_port
        (_names.to_unsafe + _n).value = "default-port".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_port)
        _n += 1
      end
      if proxy_resolver
        (_names.to_unsafe + _n).value = "proxy-resolver".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, proxy_resolver)
        _n += 1
      end
      if uri
        (_names.to_unsafe + _n).value = "uri".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, uri)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ProxyAddressEnumerator.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_proxy_address_enumerator_get_type
    end

    def connectable=(value : Gio::SocketConnectable?) : Gio::SocketConnectable?
      unsafe_value = value

      LibGObject.g_object_set(self, "connectable", unsafe_value, Pointer(Void).null)
      value
    end

    def connectable : Gio::SocketConnectable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "connectable", pointerof(value), Pointer(Void).null)
      Gio::SocketConnectable__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def default_port=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "default-port", unsafe_value, Pointer(Void).null)
      value
    end

    def default_port : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "default-port", pointerof(value), Pointer(Void).null)
      value
    end

    def proxy_resolver=(value : Gio::ProxyResolver?) : Gio::ProxyResolver?
      unsafe_value = value

      LibGObject.g_object_set(self, "proxy-resolver", unsafe_value, Pointer(Void).null)
      value
    end

    def proxy_resolver : Gio::ProxyResolver?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "proxy-resolver", pointerof(value), Pointer(Void).null)
      Gio::ProxyResolver__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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
  end
end
