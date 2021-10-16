module Gio
  # TLS (Transport Layer Security, aka SSL) and DTLS backend.
  module TlsBackend
    def self.default : Gio::TlsBackend
      # g_tls_backend_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_default
      Gio::TlsBackend__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def certificate_type : UInt64
      # g_tls_backend_get_certificate_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_certificate_type(self)
      _retval
    end

    def client_connection_type : UInt64
      # g_tls_backend_get_client_connection_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_client_connection_type(self)
      _retval
    end

    def default_database : Gio::TlsDatabase
      # g_tls_backend_get_default_database: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_backend_get_default_database(self)
      Gio::TlsDatabase.new(_retval, GICrystal::Transfer::Full)
    end

    def dtls_client_connection_type : UInt64
      # g_tls_backend_get_dtls_client_connection_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_dtls_client_connection_type(self)
      _retval
    end

    def dtls_server_connection_type : UInt64
      # g_tls_backend_get_dtls_server_connection_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_dtls_server_connection_type(self)
      _retval
    end

    def file_database_type : UInt64
      # g_tls_backend_get_file_database_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_file_database_type(self)
      _retval
    end

    def server_connection_type : UInt64
      # g_tls_backend_get_server_connection_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_get_server_connection_type(self)
      _retval
    end

    def default_database=(database : Gio::TlsDatabase?) : Nil
      # g_tls_backend_set_default_database: (Method)
      # @database: (nullable)
      # Returns: (transfer none)

      database = if database.nil?
                   Pointer(Void).null
                 else
                   database.to_unsafe
                 end

      LibGio.g_tls_backend_set_default_database(self, database)
    end

    def supports_dtls : Bool
      # g_tls_backend_supports_dtls: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_supports_dtls(self)
      GICrystal.to_bool(_retval)
    end

    def supports_tls : Bool
      # g_tls_backend_supports_tls: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_backend_supports_tls(self)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TlsBackend__Impl
    include TlsBackend

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
      LibGio.g_tls_backend_get_type
    end

    # Cast a `GObject::Object` to `TlsBackend`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TlsBackend")
    end

    # Cast a `GObject::Object` to `TlsBackend`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
