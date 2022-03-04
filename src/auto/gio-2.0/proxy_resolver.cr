module Gio
  # #GProxyResolver provides synchronous and asynchronous network proxy
  # resolution. #GProxyResolver is used within #GSocketClient through
  # the method g_socket_connectable_proxy_enumerate().
  #
  # Implementations of #GProxyResolver based on libproxy and GNOME settings can
  # be found in glib-networking. GIO comes with an implementation for use inside
  # Flatpak portals.
  module ProxyResolver
    def self.default : Gio::ProxyResolver
      # g_proxy_resolver_get_default: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_proxy_resolver_get_default

      # Return value handling
      Gio::ProxyResolver__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def is_supported : Bool
      # g_proxy_resolver_is_supported: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_proxy_resolver_is_supported(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def lookup(uri : ::String, cancellable : Gio::Cancellable?) : Enumerable(::String)
      # g_proxy_resolver_lookup: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_proxy_resolver_lookup(self, uri, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def lookup_async(uri : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_proxy_resolver_lookup_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_proxy_resolver_lookup_async(self, uri, cancellable, callback, user_data)

      # Return value handling
    end

    def lookup_finish(result : Gio::AsyncResult) : Enumerable(::String)
      # g_proxy_resolver_lookup_finish: (Method | Throws)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_proxy_resolver_lookup_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class ProxyResolver__Impl < GObject::Object
    include ProxyResolver

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_proxy_resolver_get_type
    end

    # Cast a `GObject::Object` to `ProxyResolver`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ProxyResolver")
    end

    # Cast a `GObject::Object` to `ProxyResolver`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
