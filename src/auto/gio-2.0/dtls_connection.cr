module Gio
  # #GDtlsConnection is the base DTLS connection class type, which wraps
  # a #GDatagramBased and provides DTLS encryption on top of it. Its
  # subclasses, #GDtlsClientConnection and #GDtlsServerConnection,
  # implement client-side and server-side DTLS, respectively.
  #
  # For TLS support, see #GTlsConnection.
  #
  # As DTLS is datagram based, #GDtlsConnection implements #GDatagramBased,
  # presenting a datagram-socket-like API for the encrypted connection. This
  # operates over a base datagram connection, which is also a #GDatagramBased
  # (#GDtlsConnection:base-socket).
  #
  # To close a DTLS connection, use g_dtls_connection_close().
  #
  # Neither #GDtlsServerConnection or #GDtlsClientConnection set the peer address
  # on their base #GDatagramBased if it is a #GSocket — it is up to the caller to
  # do that if they wish. If they do not, and g_socket_close() is called on the
  # base socket, the #GDtlsConnection will not raise a %G_IO_ERROR_NOT_CONNECTED
  # error on further I/O.
  module DtlsConnection
    def advertised_protocols : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "advertised-protocols", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def base_socket=(value : DatagramBased?) : DatagramBased?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-socket", unsafe_value, Pointer(Void).null)
      value
    end

    def base_socket : DatagramBased?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "base-socket", pointerof(value), Pointer(Void).null)
      Gio::DatagramBased__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dtls_connection_close(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dtls_connection_close_async: (Method)
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

      LibGio.g_dtls_connection_close_async(self, io_priority, cancellable, callback, user_data)
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_close_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def emit_accept_certificate(peer_cert : Gio::TlsCertificate, errors : Gio::TlsCertificateFlags) : Bool
      # g_dtls_connection_emit_accept_certificate: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_emit_accept_certificate(self, peer_cert, errors)
      GICrystal.to_bool(_retval)
    end

    def certificate : Gio::TlsCertificate?
      # g_dtls_connection_get_certificate: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_certificate(self)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def channel_binding_data(type : Gio::TlsChannelBindingType) : Bool
      # g_dtls_connection_get_channel_binding_data: (Method | Throws)
      # @data: (out) (optional) (array element-type UInt8)
      # Returns: (transfer none)

      data = Pointer(Pointer(UInt8)).null
      data = data.to_a.to_unsafe

      _retval = LibGio.g_dtls_connection_get_channel_binding_data(self, type, data)
      GICrystal.to_bool(_retval)
    end

    def ciphersuite_name : ::String?
      # g_dtls_connection_get_ciphersuite_name: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_dtls_connection_get_ciphersuite_name(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def database : Gio::TlsDatabase?
      # g_dtls_connection_get_database: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_database(self)
      Gio::TlsDatabase.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def interaction : Gio::TlsInteraction?
      # g_dtls_connection_get_interaction: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_interaction(self)
      Gio::TlsInteraction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def negotiated_protocol : ::String?
      # g_dtls_connection_get_negotiated_protocol: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_negotiated_protocol(self)
      ::String.new(_retval) unless _retval.null?
    end

    def peer_certificate : Gio::TlsCertificate?
      # g_dtls_connection_get_peer_certificate: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_peer_certificate(self)
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def peer_certificate_errors : Gio::TlsCertificateFlags
      # g_dtls_connection_get_peer_certificate_errors: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_peer_certificate_errors(self)
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def protocol_version : Gio::TlsProtocolVersion
      # g_dtls_connection_get_protocol_version: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_protocol_version(self)
      Gio::TlsProtocolVersion.from_value(_retval)
    end

    def rehandshake_mode : Gio::TlsRehandshakeMode
      # g_dtls_connection_get_rehandshake_mode: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_rehandshake_mode(self)
      Gio::TlsRehandshakeMode.from_value(_retval)
    end

    def require_close_notify? : Bool
      # g_dtls_connection_get_require_close_notify: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_get_require_close_notify(self)
      GICrystal.to_bool(_retval)
    end

    def handshake(cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_handshake: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dtls_connection_handshake(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def handshake_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dtls_connection_handshake_async: (Method)
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

      LibGio.g_dtls_connection_handshake_async(self, io_priority, cancellable, callback, user_data)
    end

    def handshake_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_handshake_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_handshake_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def advertised_protocols=(protocols : Enumerable(::String)?) : Nil
      # g_dtls_connection_set_advertised_protocols: (Method | Setter)
      # @protocols: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      protocols = if protocols.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    protocols.to_a.map(&.to_unsafe).to_unsafe
                  end

      LibGio.g_dtls_connection_set_advertised_protocols(self, protocols)
    end

    def certificate=(certificate : Gio::TlsCertificate) : Nil
      # g_dtls_connection_set_certificate: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_dtls_connection_set_certificate(self, certificate)
    end

    def database=(database : Gio::TlsDatabase?) : Nil
      # g_dtls_connection_set_database: (Method | Setter)
      # @database: (nullable)
      # Returns: (transfer none)

      database = if database.nil?
                   Pointer(Void).null
                 else
                   database.to_unsafe
                 end

      LibGio.g_dtls_connection_set_database(self, database)
    end

    def interaction=(interaction : Gio::TlsInteraction?) : Nil
      # g_dtls_connection_set_interaction: (Method | Setter)
      # @interaction: (nullable)
      # Returns: (transfer none)

      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end

      LibGio.g_dtls_connection_set_interaction(self, interaction)
    end

    def rehandshake_mode=(mode : Gio::TlsRehandshakeMode) : Nil
      # g_dtls_connection_set_rehandshake_mode: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_dtls_connection_set_rehandshake_mode(self, mode)
    end

    def require_close_notify=(require_close_notify : Bool) : Nil
      # g_dtls_connection_set_require_close_notify: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_dtls_connection_set_require_close_notify(self, require_close_notify)
    end

    def shutdown(shutdown_read : Bool, shutdown_write : Bool, cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_shutdown: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dtls_connection_shutdown(self, shutdown_read, shutdown_write, cancellable)
      GICrystal.to_bool(_retval)
    end

    def shutdown_async(shutdown_read : Bool, shutdown_write : Bool, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dtls_connection_shutdown_async: (Method)
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

      LibGio.g_dtls_connection_shutdown_async(self, shutdown_read, shutdown_write, io_priority, cancellable, callback, user_data)
    end

    def shutdown_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_shutdown_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_dtls_connection_shutdown_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DtlsConnection__Impl
    include DtlsConnection

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
      LibGio.g_dtls_connection_get_type
    end

    # Cast a `GObject::Object` to `DtlsConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DtlsConnection")
    end

    # Cast a `GObject::Object` to `DtlsConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
