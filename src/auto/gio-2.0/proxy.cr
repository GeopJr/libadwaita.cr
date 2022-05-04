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

      # C call
      _retval = LibGio.g_proxy_get_default_for_protocol(protocol)

      # Return value handling

      Gio::Proxy__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def connect(connection : Gio::IOStream, proxy_address : Gio::ProxyAddress, cancellable : Gio::Cancellable?) : Gio::IOStream
      # g_proxy_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_proxy_connect(self, connection, proxy_address, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_async(connection : Gio::IOStream, proxy_address : Gio::ProxyAddress, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_proxy_connect_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_proxy_connect_async(self, connection, proxy_address, cancellable, callback, user_data)

      # Return value handling
    end

    def connect_finish(result : Gio::AsyncResult) : Gio::IOStream
      # g_proxy_connect_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_proxy_connect_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::IOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def supports_hostname : Bool
      # g_proxy_supports_hostname: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_supports_hostname(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class Proxy__Impl < GObject::Object
    include Proxy

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_proxy_get_type
    end

    # Cast a `GObject::Object` to `Proxy`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Proxy")
    end

    # Cast a `GObject::Object` to `Proxy`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
