require "./io_stream"

module Gio
  # #GTlsConnection is the base TLS connection class type, which wraps
  # a #GIOStream and provides TLS encryption on top of it. Its
  # subclasses, #GTlsClientConnection and #GTlsServerConnection,
  # implement client-side and server-side TLS, respectively.
  #
  # For DTLS (Datagram TLS) support, see #GDtlsConnection.
  @[GObject::GeneratedWrapper]
  class TlsConnection < IOStream
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TlsConnectionClass), class_init,
        sizeof(LibGio::TlsConnection), instance_init, 0)
    end

    GICrystal.define_new_method(TlsConnection, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TlsConnection`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, advertised_protocols : Enumerable(::String)? = nil, base_io_stream : Gio::IOStream? = nil, certificate : Gio::TlsCertificate? = nil, ciphersuite_name : ::String? = nil, closed : Bool? = nil, database : Gio::TlsDatabase? = nil, input_stream : Gio::InputStream? = nil, interaction : Gio::TlsInteraction? = nil, negotiated_protocol : ::String? = nil, output_stream : Gio::OutputStream? = nil, peer_certificate : Gio::TlsCertificate? = nil, peer_certificate_errors : Gio::TlsCertificateFlags? = nil, protocol_version : Gio::TlsProtocolVersion? = nil, rehandshake_mode : Gio::TlsRehandshakeMode? = nil, require_close_notify : Bool? = nil, use_system_certdb : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[16]
      _values = StaticArray(LibGObject::Value, 16).new(LibGObject::Value.new)
      _n = 0

      if !advertised_protocols.nil?
        (_names.to_unsafe + _n).value = "advertised-protocols".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, advertised_protocols)
        _n += 1
      end
      if !base_io_stream.nil?
        (_names.to_unsafe + _n).value = "base-io-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_io_stream)
        _n += 1
      end
      if !certificate.nil?
        (_names.to_unsafe + _n).value = "certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate)
        _n += 1
      end
      if !ciphersuite_name.nil?
        (_names.to_unsafe + _n).value = "ciphersuite-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ciphersuite_name)
        _n += 1
      end
      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !database.nil?
        (_names.to_unsafe + _n).value = "database".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, database)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !interaction.nil?
        (_names.to_unsafe + _n).value = "interaction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interaction)
        _n += 1
      end
      if !negotiated_protocol.nil?
        (_names.to_unsafe + _n).value = "negotiated-protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, negotiated_protocol)
        _n += 1
      end
      if !output_stream.nil?
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end
      if !peer_certificate.nil?
        (_names.to_unsafe + _n).value = "peer-certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, peer_certificate)
        _n += 1
      end
      if !peer_certificate_errors.nil?
        (_names.to_unsafe + _n).value = "peer-certificate-errors".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, peer_certificate_errors)
        _n += 1
      end
      if !protocol_version.nil?
        (_names.to_unsafe + _n).value = "protocol-version".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol_version)
        _n += 1
      end
      if !rehandshake_mode.nil?
        (_names.to_unsafe + _n).value = "rehandshake-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rehandshake_mode)
        _n += 1
      end
      if !require_close_notify.nil?
        (_names.to_unsafe + _n).value = "require-close-notify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, require_close_notify)
        _n += 1
      end
      if !use_system_certdb.nil?
        (_names.to_unsafe + _n).value = "use-system-certdb".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_system_certdb)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TlsConnection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_connection_get_type
    end

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

    def base_io_stream=(value : Gio::IOStream?) : Gio::IOStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-io-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def base_io_stream : Gio::IOStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "base-io-stream", pointerof(value), Pointer(Void).null)
      Gio::IOStream.new(value, GICrystal::Transfer::None) unless value.null?
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

    def use_system_certdb=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-system-certdb", unsafe_value, Pointer(Void).null)
      value
    end

    def use_system_certdb? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-system-certdb", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Used by #GTlsConnection implementations to emit the
    # #GTlsConnection::accept-certificate signal.
    def emit_accept_certificate(peer_cert : Gio::TlsCertificate, errors : Gio::TlsCertificateFlags) : Bool
      # g_tls_connection_emit_accept_certificate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_emit_accept_certificate(@pointer, peer_cert, errors)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets @conn's certificate, as set by
    # g_tls_connection_set_certificate().
    def certificate : Gio::TlsCertificate?
      # g_tls_connection_get_certificate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_certificate(@pointer)

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Query the TLS backend for TLS channel binding data of @type for @conn.
    #
    # This call retrieves TLS channel binding data as specified in RFC
    # [5056](https://tools.ietf.org/html/rfc5056), RFC
    # [5929](https://tools.ietf.org/html/rfc5929), and related RFCs.  The
    # binding data is returned in @data.  The @data is resized by the callee
    # using #GByteArray buffer management and will be freed when the @data
    # is destroyed by g_byte_array_unref(). If @data is %NULL, it will only
    # check whether TLS backend is able to fetch the data (e.g. whether @type
    # is supported by the TLS backend). It does not guarantee that the data
    # will be available though.  That could happen if TLS connection does not
    # support @type or the binding data is not available yet due to additional
    # negotiation or input required.
    def channel_binding_data(type : Gio::TlsChannelBindingType) : Bool
      # g_tls_connection_get_channel_binding_data: (Method | Throws)
      # @data: (out) (optional) (array element-type UInt8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      data = Pointer(Pointer(UInt8)).null # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_tls_connection_get_channel_binding_data(@pointer, type, data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the name of the current TLS ciphersuite, or %NULL if the
    # connection has not handshaked or has been closed. Beware that the TLS
    # backend may use any of multiple different naming conventions, because
    # OpenSSL and GnuTLS have their own ciphersuite naming conventions that
    # are different from each other and different from the standard, IANA-
    # registered ciphersuite names. The ciphersuite name is intended to be
    # displayed to the user for informative purposes only, and parsing it
    # is not recommended.
    def ciphersuite_name : ::String?
      # g_tls_connection_get_ciphersuite_name: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_tls_connection_get_ciphersuite_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the certificate database that @conn uses to verify
    # peer certificates. See g_tls_connection_set_database().
    def database : Gio::TlsDatabase?
      # g_tls_connection_get_database: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_database(@pointer)

      # Return value handling

      Gio::TlsDatabase.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Get the object that will be used to interact with the user. It will be used
    # for things like prompting the user for passwords. If %NULL is returned, then
    # no user interaction will occur for this connection.
    def interaction : Gio::TlsInteraction?
      # g_tls_connection_get_interaction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_interaction(@pointer)

      # Return value handling

      Gio::TlsInteraction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of the application-layer protocol negotiated during
    # the handshake.
    #
    # If the peer did not use the ALPN extension, or did not advertise a
    # protocol that matched one of @conn's protocols, or the TLS backend
    # does not support ALPN, then this will be %NULL. See
    # g_tls_connection_set_advertised_protocols().
    def negotiated_protocol : ::String?
      # g_tls_connection_get_negotiated_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_negotiated_protocol(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets @conn's peer's certificate after the handshake has completed
    # or failed. (It is not set during the emission of
    # #GTlsConnection::accept-certificate.)
    def peer_certificate : Gio::TlsCertificate?
      # g_tls_connection_get_peer_certificate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_peer_certificate(@pointer)

      # Return value handling

      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the errors associated with validating @conn's peer's
    # certificate, after the handshake has completed or failed. (It is
    # not set during the emission of #GTlsConnection::accept-certificate.)
    #
    # See #GTlsConnection:peer-certificate-errors for more information.
    def peer_certificate_errors : Gio::TlsCertificateFlags
      # g_tls_connection_get_peer_certificate_errors: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_peer_certificate_errors(@pointer)

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end

    # Returns the current TLS protocol version, which may be
    # %G_TLS_PROTOCOL_VERSION_UNKNOWN if the connection has not handshaked, or
    # has been closed, or if the TLS backend has implemented a protocol version
    # that is not a recognized #GTlsProtocolVersion.
    def protocol_version : Gio::TlsProtocolVersion
      # g_tls_connection_get_protocol_version: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_protocol_version(@pointer)

      # Return value handling

      Gio::TlsProtocolVersion.new(_retval)
    end

    # Gets @conn rehandshaking mode. See
    # g_tls_connection_set_rehandshake_mode() for details.
    def rehandshake_mode : Gio::TlsRehandshakeMode
      # g_tls_connection_get_rehandshake_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_rehandshake_mode(@pointer)

      # Return value handling

      Gio::TlsRehandshakeMode.new(_retval)
    end

    # Tests whether or not @conn expects a proper TLS close notification
    # when the connection is closed. See
    # g_tls_connection_set_require_close_notify() for details.
    def require_close_notify : Bool
      # g_tls_connection_get_require_close_notify: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_require_close_notify(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @conn uses the system certificate database to verify
    # peer certificates. See g_tls_connection_set_use_system_certdb().
    def use_system_certdb : Bool
      # g_tls_connection_get_use_system_certdb: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tls_connection_get_use_system_certdb(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Attempts a TLS handshake on @conn.
    #
    # On the client side, it is never necessary to call this method;
    # although the connection needs to perform a handshake after
    # connecting (or after sending a "STARTTLS"-type command),
    # #GTlsConnection will handle this for you automatically when you try
    # to send or receive data on the connection. You can call
    # g_tls_connection_handshake() manually if you want to know whether
    # the initial handshake succeeded or failed (as opposed to just
    # immediately trying to use @conn to read or write, in which case,
    # if it fails, it may not be possible to tell if it failed before or
    # after completing the handshake), but beware that servers may reject
    # client authentication after the handshake has completed, so a
    # successful handshake does not indicate the connection will be usable.
    #
    # Likewise, on the server side, although a handshake is necessary at
    # the beginning of the communication, you do not need to call this
    # function explicitly unless you want clearer error reporting.
    #
    # Previously, calling g_tls_connection_handshake() after the initial
    # handshake would trigger a rehandshake; however, this usage was
    # deprecated in GLib 2.60 because rehandshaking was removed from the
    # TLS protocol in TLS 1.3. Since GLib 2.64, calling this function after
    # the initial handshake will no longer do anything.
    #
    # When using a #GTlsConnection created by #GSocketClient, the
    # #GSocketClient performs the initial handshake, so calling this
    # function manually is not recommended.
    #
    # #GTlsConnection::accept_certificate may be emitted during the
    # handshake.
    def handshake(cancellable : Gio::Cancellable?) : Bool
      # g_tls_connection_handshake: (Method | Throws)
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
      _retval = LibGio.g_tls_connection_handshake(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously performs a TLS handshake on @conn. See
    # g_tls_connection_handshake() for more information.
    def handshake_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_tls_connection_handshake_async: (Method)
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
      LibGio.g_tls_connection_handshake_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous TLS handshake operation. See
    # g_tls_connection_handshake() for more information.
    def handshake_finish(result : Gio::AsyncResult) : Bool
      # g_tls_connection_handshake_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_connection_handshake_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the list of application-layer protocols to advertise that the
    # caller is willing to speak on this connection. The
    # Application-Layer Protocol Negotiation (ALPN) extension will be
    # used to negotiate a compatible protocol with the peer; use
    # g_tls_connection_get_negotiated_protocol() to find the negotiated
    # protocol after the handshake.  Specifying %NULL for the the value
    # of @protocols will disable ALPN negotiation.
    #
    # See [IANA TLS ALPN Protocol IDs](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids)
    # for a list of registered protocol IDs.
    def advertised_protocols=(protocols : Enumerable(::String)?) : Nil
      # g_tls_connection_set_advertised_protocols: (Method | Setter)
      # @protocols: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      protocols = if protocols.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    protocols.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      LibGio.g_tls_connection_set_advertised_protocols(@pointer, protocols)

      # Return value handling
    end

    # This sets the certificate that @conn will present to its peer
    # during the TLS handshake. For a #GTlsServerConnection, it is
    # mandatory to set this, and that will normally be done at construct
    # time.
    #
    # For a #GTlsClientConnection, this is optional. If a handshake fails
    # with %G_TLS_ERROR_CERTIFICATE_REQUIRED, that means that the server
    # requires a certificate, and if you try connecting again, you should
    # call this method first. You can call
    # g_tls_client_connection_get_accepted_cas() on the failed connection
    # to get a list of Certificate Authorities that the server will
    # accept certificates from.
    #
    # (It is also possible that a server will allow the connection with
    # or without a certificate; in that case, if you don't provide a
    # certificate, you can tell that the server requested one by the fact
    # that g_tls_client_connection_get_accepted_cas() will return
    # non-%NULL.)
    def certificate=(certificate : Gio::TlsCertificate) : Nil
      # g_tls_connection_set_certificate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_tls_connection_set_certificate(@pointer, certificate)

      # Return value handling
    end

    # Sets the certificate database that is used to verify peer certificates.
    # This is set to the default database by default. See
    # g_tls_backend_get_default_database(). If set to %NULL, then
    # peer certificate validation will always set the
    # %G_TLS_CERTIFICATE_UNKNOWN_CA error (meaning
    # #GTlsConnection::accept-certificate will always be emitted on
    # client-side connections, unless that bit is not set in
    # #GTlsClientConnection:validation-flags).
    #
    # There are nonintuitive security implications when using a non-default
    # database. See #GDtlsConnection:database for details.
    def database=(database : Gio::TlsDatabase?) : Nil
      # g_tls_connection_set_database: (Method | Setter)
      # @database: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      database = if database.nil?
                   Pointer(Void).null
                 else
                   database.to_unsafe
                 end

      # C call
      LibGio.g_tls_connection_set_database(@pointer, database)

      # Return value handling
    end

    # Set the object that will be used to interact with the user. It will be used
    # for things like prompting the user for passwords.
    #
    # The @interaction argument will normally be a derived subclass of
    # #GTlsInteraction. %NULL can also be provided if no user interaction
    # should occur for this connection.
    def interaction=(interaction : Gio::TlsInteraction?) : Nil
      # g_tls_connection_set_interaction: (Method | Setter)
      # @interaction: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end

      # C call
      LibGio.g_tls_connection_set_interaction(@pointer, interaction)

      # Return value handling
    end

    # Since GLib 2.64, changing the rehandshake mode is no longer supported
    # and will have no effect. With TLS 1.3, rehandshaking has been removed from
    # the TLS protocol, replaced by separate post-handshake authentication and
    # rekey operations.
    def rehandshake_mode=(mode : Gio::TlsRehandshakeMode) : Nil
      # g_tls_connection_set_rehandshake_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_tls_connection_set_rehandshake_mode(@pointer, mode)

      # Return value handling
    end

    # Sets whether or not @conn expects a proper TLS close notification
    # before the connection is closed. If this is %TRUE (the default),
    # then @conn will expect to receive a TLS close notification from its
    # peer before the connection is closed, and will return a
    # %G_TLS_ERROR_EOF error if the connection is closed without proper
    # notification (since this may indicate a network error, or
    # man-in-the-middle attack).
    #
    # In some protocols, the application will know whether or not the
    # connection was closed cleanly based on application-level data
    # (because the application-level data includes a length field, or is
    # somehow self-delimiting); in this case, the close notify is
    # redundant and sometimes omitted. (TLS 1.1 explicitly allows this;
    # in TLS 1.0 it is technically an error, but often done anyway.) You
    # can use g_tls_connection_set_require_close_notify() to tell @conn
    # to allow an "unannounced" connection close, in which case the close
    # will show up as a 0-length read, as in a non-TLS
    # #GSocketConnection, and it is up to the application to check that
    # the data has been fully received.
    #
    # Note that this only affects the behavior when the peer closes the
    # connection; when the application calls g_io_stream_close() itself
    # on @conn, this will send a close notification regardless of the
    # setting of this property. If you explicitly want to do an unclean
    # close, you can close @conn's #GTlsConnection:base-io-stream rather
    # than closing @conn itself, but note that this may only be done when no other
    # operations are pending on @conn or the base I/O stream.
    def require_close_notify=(require_close_notify : Bool) : Nil
      # g_tls_connection_set_require_close_notify: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_tls_connection_set_require_close_notify(@pointer, require_close_notify)

      # Return value handling
    end

    # Sets whether @conn uses the system certificate database to verify
    # peer certificates. This is %TRUE by default. If set to %FALSE, then
    # peer certificate validation will always set the
    # %G_TLS_CERTIFICATE_UNKNOWN_CA error (meaning
    # #GTlsConnection::accept-certificate will always be emitted on
    # client-side connections, unless that bit is not set in
    # #GTlsClientConnection:validation-flags).
    def use_system_certdb=(use_system_certdb : Bool) : Nil
      # g_tls_connection_set_use_system_certdb: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_tls_connection_set_use_system_certdb(@pointer, use_system_certdb)

      # Return value handling
    end

    # Emitted during the TLS handshake after the peer certificate has
    # been received. You can examine @peer_cert's certification path by
    # calling g_tls_certificate_get_issuer() on it.
    #
    # For a client-side connection, @peer_cert is the server's
    # certificate, and the signal will only be emitted if the
    # certificate was not acceptable according to @conn's
    # #GTlsClientConnection:validation_flags. If you would like the
    # certificate to be accepted despite @errors, return %TRUE from the
    # signal handler. Otherwise, if no handler accepts the certificate,
    # the handshake will fail with %G_TLS_ERROR_BAD_CERTIFICATE.
    #
    # GLib guarantees that if certificate verification fails, this signal
    # will be emitted with at least one error will be set in @errors, but
    # it does not guarantee that all possible errors will be set.
    # Accordingly, you may not safely decide to ignore any particular
    # type of error. For example, it would be incorrect to ignore
    # %G_TLS_CERTIFICATE_EXPIRED if you want to allow expired
    # certificates, because this could potentially be the only error flag
    # set even if other problems exist with the certificate.
    #
    # For a server-side connection, @peer_cert is the certificate
    # presented by the client, if this was requested via the server's
    # #GTlsServerConnection:authentication_mode. On the server side,
    # the signal is always emitted when the client presents a
    # certificate, and the certificate will only be accepted if a
    # handler returns %TRUE.
    #
    # Note that if this signal is emitted as part of asynchronous I/O
    # in the main thread, then you should not attempt to interact with
    # the user before returning from the signal handler. If you want to
    # let the user decide whether or not to accept the certificate, you
    # would have to return %FALSE from the signal handler on the first
    # attempt, and then after the connection attempt returns a
    # %G_TLS_ERROR_BAD_CERTIFICATE, you can interact with the user, and
    # if the user decides to accept the certificate, remember that fact,
    # create a new connection, and return %TRUE from the signal handler
    # the next time.
    #
    # If you are doing I/O in another thread, you do not
    # need to worry about this, and can simply block in the signal
    # handler until the UI thread returns an answer.
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

      def connect(handler : Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::TlsConnection.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(_sender, peer_cert, errors)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_peer_cert : Pointer(Void), lib_errors : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::TlsConnection.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          peer_cert = Gio::TlsCertificate.new(lib_peer_cert, :none)
          # Generator::BuiltInTypeArgPlan
          errors = Gio::TlsCertificateFlags.new(lib_errors)
          ::Box(Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(_lib_box).call(_sender, peer_cert, errors)
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
  end
end
