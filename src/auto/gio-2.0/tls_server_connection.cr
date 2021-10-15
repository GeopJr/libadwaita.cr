module Gio
  # #GTlsServerConnection is the server-side subclass of #GTlsConnection,
  # representing a server-side TLS connection.
  module TlsServerConnection
    def authentication_mode=(value : TlsAuthenticationMode) : TlsAuthenticationMode
      unsafe_value = value

      LibGObject.g_object_set(self, "authentication-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def authentication_mode : TlsAuthenticationMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "authentication-mode", pointerof(value), Pointer(Void).null)
      Gio::TlsAuthenticationMode.from_value(value)
    end

    def new(base_io_stream : Gio::IOStream, certificate : Gio::TlsCertificate?) : Gio::TlsServerConnection
      # g_tls_server_connection_new: (Throws)
      # @certificate: (nullable)
      # Returns: (transfer full)

      certificate = if certificate.nil?
                      Pointer(Void).null
                    else
                      certificate.to_unsafe
                    end

      _retval = LibGio.g_tls_server_connection_new(base_io_stream, certificate)
      Gio::TlsServerConnection__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TlsServerConnection__Impl
    include TlsServerConnection

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
      LibGio.g_tls_server_connection_get_type
    end

    # Cast a `GObject::Object` to `TlsServerConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TlsServerConnection")
    end

    # Cast a `GObject::Object` to `TlsServerConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
