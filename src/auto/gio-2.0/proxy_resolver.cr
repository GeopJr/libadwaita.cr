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

      # C call
      _retval = LibGio.g_proxy_resolver_get_default

      # Return value handling

      Gio::AbstractProxyResolver.new(_retval, GICrystal::Transfer::None)
    end

    def is_supported : Bool
      # g_proxy_resolver_is_supported: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_proxy_resolver_is_supported(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def lookup(uri : ::String, cancellable : Gio::Cancellable?) : Enumerable(::String)
      # g_proxy_resolver_lookup: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_proxy_resolver_lookup(@pointer, uri, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def lookup_async(uri : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_proxy_resolver_lookup_async: (Method)
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
      LibGio.g_proxy_resolver_lookup_async(@pointer, uri, cancellable, callback, user_data)

      # Return value handling
    end

    def lookup_finish(result : Gio::AsyncResult) : Enumerable(::String)
      # g_proxy_resolver_lookup_finish: (Method | Throws)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_proxy_resolver_lookup_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractProxyResolver < GObject::Object
    include ProxyResolver

    GICrystal.define_new_method(Gio::AbstractProxyResolver, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

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
