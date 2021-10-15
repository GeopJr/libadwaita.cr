module Gio
  # #GTlsClientConnection is the client-side subclass of
  # #GTlsConnection, representing a client-side TLS connection.
  module TlsClientConnection
    def new(base_io_stream : Gio::IOStream, server_identity : Gio::SocketConnectable?) : Gio::TlsClientConnection
      # g_tls_client_connection_new: (Throws)
      # @server_identity: (nullable)
      # Returns: (transfer full)

      server_identity = if server_identity.nil?
                          Pointer(Void).null
                        else
                          server_identity.to_unsafe
                        end

      _retval = LibGio.g_tls_client_connection_new(base_io_stream, server_identity)
      Gio::TlsClientConnection__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def copy_session_state(source : Gio::TlsClientConnection) : Nil
      # g_tls_client_connection_copy_session_state: (Method)
      # Returns: (transfer none)

      LibGio.g_tls_client_connection_copy_session_state(self, source)
    end

    def accepted_cas : GLib::List
      # g_tls_client_connection_get_accepted_cas: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_tls_client_connection_get_accepted_cas(self)
      GLib::List(Enumerable(UInt8)).new(_retval, GICrystal::Transfer::Full)
    end

    def server_identity : Gio::SocketConnectable?
      # g_tls_client_connection_get_server_identity: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_client_connection_get_server_identity(self)
      Gio::SocketConnectable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def use_ssl3? : Bool
      # g_tls_client_connection_get_use_ssl3: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_client_connection_get_use_ssl3(self)
      GICrystal.to_bool(_retval)
    end

    def validation_flags : Gio::TlsCertificateFlags
      # g_tls_client_connection_get_validation_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tls_client_connection_get_validation_flags(self)
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def server_identity=(identity : Gio::SocketConnectable) : Nil
      # g_tls_client_connection_set_server_identity: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_client_connection_set_server_identity(self, identity)
    end

    def use_ssl3=(use_ssl3 : Bool) : Nil
      # g_tls_client_connection_set_use_ssl3: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_client_connection_set_use_ssl3(self, use_ssl3)
    end

    def validation_flags=(flags : Gio::TlsCertificateFlags) : Nil
      # g_tls_client_connection_set_validation_flags: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tls_client_connection_set_validation_flags(self, flags)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TlsClientConnection__Impl
    include TlsClientConnection

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
      LibGio.g_tls_client_connection_get_type
    end

    # Cast a `GObject::Object` to `TlsClientConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TlsClientConnection")
    end

    # Cast a `GObject::Object` to `TlsClientConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
