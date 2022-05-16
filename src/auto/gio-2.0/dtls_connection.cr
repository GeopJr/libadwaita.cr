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
    def advertised_protocols=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "advertised-protocols", unsafe_value, Pointer(Void).null)
      value
    end

    def advertised_protocols : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "advertised-protocols", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def base_socket=(value : Gio::DatagramBased?) : Gio::DatagramBased?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-socket", unsafe_value, Pointer(Void).null)
      value
    end

    def base_socket : Gio::DatagramBased?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "base-socket", pointerof(value), Pointer(Void).null)
      Gio::AbstractDatagramBased.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def certificate=(value : Gio::TlsCertificate?) : Gio::TlsCertificate?
      unsafe_value = value

      LibGObject.g_object_set(self, "certificate", unsafe_value, Pointer(Void).null)
      value
    end

    def certificate : Gio::TlsCertificate?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "certificate", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificate.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def ciphersuite_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "ciphersuite-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def database=(value : Gio::TlsDatabase?) : Gio::TlsDatabase?
      unsafe_value = value

      LibGObject.g_object_set(self, "database", unsafe_value, Pointer(Void).null)
      value
    end

    def database : Gio::TlsDatabase?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "database", pointerof(value), Pointer(Void).null)
      Gio::TlsDatabase.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def interaction=(value : Gio::TlsInteraction?) : Gio::TlsInteraction?
      unsafe_value = value

      LibGObject.g_object_set(self, "interaction", unsafe_value, Pointer(Void).null)
      value
    end

    def interaction : Gio::TlsInteraction?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "interaction", pointerof(value), Pointer(Void).null)
      Gio::TlsInteraction.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def negotiated_protocol : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "negotiated-protocol", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def peer_certificate : Gio::TlsCertificate?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "peer-certificate", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificate.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def peer_certificate_errors : Gio::TlsCertificateFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "peer-certificate-errors", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificateFlags.new(value)
    end

    def protocol_version : Gio::TlsProtocolVersion
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "protocol-version", pointerof(value), Pointer(Void).null)
      Gio::TlsProtocolVersion.new(value)
    end

    def rehandshake_mode=(value : Gio::TlsRehandshakeMode) : Gio::TlsRehandshakeMode
      unsafe_value = value

      LibGObject.g_object_set(self, "rehandshake-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def rehandshake_mode : Gio::TlsRehandshakeMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "rehandshake-mode", pointerof(value), Pointer(Void).null)
      Gio::TlsRehandshakeMode.new(value)
    end

    def require_close_notify=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "require-close-notify", unsafe_value, Pointer(Void).null)
      value
    end

    def require_close_notify? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "require-close-notify", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dtls_connection_close(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dtls_connection_close_async: (Method)
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
      LibGio.g_dtls_connection_close_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dtls_connection_close_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def emit_accept_certificate(peer_cert : Gio::TlsCertificate, errors : Gio::TlsCertificateFlags) : Bool
      # g_dtls_connection_emit_accept_certificate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_emit_accept_certificate(@pointer, peer_cert, errors)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def certificate : Gio::TlsCertificate?
      # g_dtls_connection_get_certificate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_certificate(@pointer)

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def channel_binding_data(type : Gio::TlsChannelBindingType) : Bool
      # g_dtls_connection_get_channel_binding_data: (Method | Throws)
      # @data: (out) (optional) (array element-type UInt8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      data = Pointer(Pointer(UInt8)).null # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_dtls_connection_get_channel_binding_data(@pointer, type, data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ciphersuite_name : ::String?
      # g_dtls_connection_get_ciphersuite_name: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dtls_connection_get_ciphersuite_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def database : Gio::TlsDatabase?
      # g_dtls_connection_get_database: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_database(@pointer)

      # Return value handling

      Gio::TlsDatabase.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def interaction : Gio::TlsInteraction?
      # g_dtls_connection_get_interaction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_interaction(@pointer)

      # Return value handling

      Gio::TlsInteraction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def negotiated_protocol : ::String?
      # g_dtls_connection_get_negotiated_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_negotiated_protocol(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def peer_certificate : Gio::TlsCertificate?
      # g_dtls_connection_get_peer_certificate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_peer_certificate(@pointer)

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def peer_certificate_errors : Gio::TlsCertificateFlags
      # g_dtls_connection_get_peer_certificate_errors: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_peer_certificate_errors(@pointer)

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end

    def protocol_version : Gio::TlsProtocolVersion
      # g_dtls_connection_get_protocol_version: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_protocol_version(@pointer)

      # Return value handling

      Gio::TlsProtocolVersion.new(_retval)
    end

    def rehandshake_mode : Gio::TlsRehandshakeMode
      # g_dtls_connection_get_rehandshake_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_rehandshake_mode(@pointer)

      # Return value handling

      Gio::TlsRehandshakeMode.new(_retval)
    end

    def require_close_notify : Bool
      # g_dtls_connection_get_require_close_notify: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dtls_connection_get_require_close_notify(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def handshake(cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_handshake: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dtls_connection_handshake(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def handshake_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dtls_connection_handshake_async: (Method)
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
      LibGio.g_dtls_connection_handshake_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def handshake_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_handshake_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dtls_connection_handshake_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def advertised_protocols=(protocols : Enumerable(::String)?) : Nil
      # g_dtls_connection_set_advertised_protocols: (Method | Setter)
      # @protocols: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      protocols = if protocols.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    protocols.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      LibGio.g_dtls_connection_set_advertised_protocols(@pointer, protocols)

      # Return value handling
    end

    def certificate=(certificate : Gio::TlsCertificate) : Nil
      # g_dtls_connection_set_certificate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_dtls_connection_set_certificate(@pointer, certificate)

      # Return value handling
    end

    def database=(database : Gio::TlsDatabase?) : Nil
      # g_dtls_connection_set_database: (Method | Setter)
      # @database: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      database = if database.nil?
                   Pointer(Void).null
                 else
                   database.to_unsafe
                 end

      # C call
      LibGio.g_dtls_connection_set_database(@pointer, database)

      # Return value handling
    end

    def interaction=(interaction : Gio::TlsInteraction?) : Nil
      # g_dtls_connection_set_interaction: (Method | Setter)
      # @interaction: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end

      # C call
      LibGio.g_dtls_connection_set_interaction(@pointer, interaction)

      # Return value handling
    end

    def rehandshake_mode=(mode : Gio::TlsRehandshakeMode) : Nil
      # g_dtls_connection_set_rehandshake_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_dtls_connection_set_rehandshake_mode(@pointer, mode)

      # Return value handling
    end

    def require_close_notify=(require_close_notify : Bool) : Nil
      # g_dtls_connection_set_require_close_notify: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_dtls_connection_set_require_close_notify(@pointer, require_close_notify)

      # Return value handling
    end

    def shutdown(shutdown_read : Bool, shutdown_write : Bool, cancellable : Gio::Cancellable?) : Bool
      # g_dtls_connection_shutdown: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dtls_connection_shutdown(@pointer, shutdown_read, shutdown_write, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def shutdown_async(shutdown_read : Bool, shutdown_write : Bool, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dtls_connection_shutdown_async: (Method)
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
      LibGio.g_dtls_connection_shutdown_async(@pointer, shutdown_read, shutdown_write, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def shutdown_finish(result : Gio::AsyncResult) : Bool
      # g_dtls_connection_shutdown_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dtls_connection_shutdown_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct AcceptCertificateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "accept-certificate::#{@detail}" : "accept-certificate"
      end

      def connect(&block : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(peer_cert, errors)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(peer_cert, errors)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DtlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDtlsConnection.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::DtlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(_sender, peer_cert, errors)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DtlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDtlsConnection.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::DtlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(_sender, peer_cert, errors)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(peer_cert : Gio::TlsCertificate, errors : Gio::TlsCertificateFlags) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accept-certificate", peer_cert, errors)
      end
    end

    def accept_certificate_signal
      AcceptCertificateSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDtlsConnection < GObject::Object
    include DtlsConnection

    GICrystal.define_new_method(Gio::AbstractDtlsConnection, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dtls_connection_get_type
    end

    # Cast a `GObject::Object` to `DtlsConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DtlsConnection")
    end

    # Cast a `GObject::Object` to `DtlsConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
