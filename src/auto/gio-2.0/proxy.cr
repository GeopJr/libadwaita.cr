module Gio
  # A #GProxy handles connecting to a remote host via a given type of
  # proxy server. It is implemented by the 'gio-proxy' extension point.
  # The extensions are named after their proxy protocol name. As an
  # example, a SOCKS5 proxy implementation can be retrieved with the
  # name 'socks5' using the function
  # g_io_extension_point_get_extension_by_name().
  module Proxy
    def self.default_for_protocol(protocol : ::String) : Gio::Proxy?
      # g_proxy_get_default_for_protocol: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_proxy_get_default_for_protocol(protocol)
      Gio::Proxy__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def connect(connection : Gio::IOStream, proxy_address : Gio::ProxyAddress, cancellable : Gio::Cancellable?) : Gio::IOStream
      # g_proxy_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_proxy_connect(self, connection, proxy_address, cancellable)
      Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_async(connection : Gio::IOStream, proxy_address : Gio::ProxyAddress, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_proxy_connect_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_proxy_connect_async(self, connection, proxy_address, cancellable, callback, user_data)
    end

    def connect_finish(result : Gio::AsyncResult) : Gio::IOStream
      # g_proxy_connect_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_proxy_connect_finish(self, result)
      Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def supports_hostname : Bool
      # g_proxy_supports_hostname: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_proxy_supports_hostname(self)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Proxy__Impl
    include Proxy

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_proxy_get_type
    end

    # Cast a `GObject::Object` to `Proxy`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Proxy")
    end

    # Cast a `GObject::Object` to `Proxy`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
