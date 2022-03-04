module Gio
  # #GDtlsClientConnection is the client-side subclass of
  # #GDtlsConnection, representing a client-side DTLS connection.
  module DtlsClientConnection
    def accepted_cas : GLib::List
      # Returns: None

      value = uninitialized Pointer(LibGLib::List)
      LibGObject.g_object_get(self, "accepted-cas", pointerof(value), Pointer(Void).null)
      GLib::List(Pointer(Void)).new(value, GICrystal::Transfer::None)
    end

    def server_identity=(value : Gio::SocketConnectable?) : Gio::SocketConnectable?
      unsafe_value = value

      LibGObject.g_object_set(self, "server-identity", unsafe_value, Pointer(Void).null)
      value
    end

    def server_identity : Gio::SocketConnectable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "server-identity", pointerof(value), Pointer(Void).null)
      Gio::SocketConnectable__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def validation_flags=(value : Gio::TlsCertificateFlags) : Gio::TlsCertificateFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "validation-flags", unsafe_value, Pointer(Void).null)
      value
    end

    def validation_flags : Gio::TlsCertificateFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "validation-flags", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificateFlags.from_value(value)
    end

    def new(base_socket : Gio::DatagramBased, server_identity : Gio::SocketConnectable?) : Gio::DtlsClientConnection
      # g_dtls_client_connection_new: (Throws)
      # @server_identity: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      server_identity = if server_identity.nil?
                          Pointer(Void).null
                        else
                          server_identity.to_unsafe
                        end

      # C call
      _retval = LibGio.g_dtls_client_connection_new(base_socket, server_identity, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::DtlsClientConnection__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def accepted_cas : GLib::List
      # g_dtls_client_connection_get_accepted_cas: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dtls_client_connection_get_accepted_cas(self)

      # Return value handling
      GLib::List(Enumerable(UInt8)).new(_retval, GICrystal::Transfer::Full)
    end

    def server_identity : Gio::SocketConnectable
      # g_dtls_client_connection_get_server_identity: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dtls_client_connection_get_server_identity(self)

      # Return value handling
      Gio::SocketConnectable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def validation_flags : Gio::TlsCertificateFlags
      # g_dtls_client_connection_get_validation_flags: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dtls_client_connection_get_validation_flags(self)

      # Return value handling
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def server_identity=(identity : Gio::SocketConnectable) : Nil
      # g_dtls_client_connection_set_server_identity: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dtls_client_connection_set_server_identity(self, identity)

      # Return value handling
    end

    def validation_flags=(flags : Gio::TlsCertificateFlags) : Nil
      # g_dtls_client_connection_set_validation_flags: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dtls_client_connection_set_validation_flags(self, flags)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DtlsClientConnection__Impl < GObject::Object
    include DtlsClientConnection

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dtls_client_connection_get_type
    end

    # Cast a `GObject::Object` to `DtlsClientConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DtlsClientConnection")
    end

    # Cast a `GObject::Object` to `DtlsClientConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
