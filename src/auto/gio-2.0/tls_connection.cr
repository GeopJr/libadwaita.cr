require "./io_stream"

module Gio
  # #GTlsConnection is the base TLS connection class type, which wraps
  # a #GIOStream and provides TLS encryption on top of it. Its
  # subclasses, #GTlsClientConnection and #GTlsServerConnection,
  # implement client-side and server-side TLS, respectively.
  #
  # For DTLS (Datagram TLS) support, see #GDtlsConnection.
  class TlsConnection < IOStream
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, advertised_protocols : Enumerable(::String)? = nil, base_io_stream : Gio::IOStream? = nil, certificate : Gio::TlsCertificate? = nil, ciphersuite_name : ::String? = nil, closed : Bool? = nil, database : Gio::TlsDatabase? = nil, input_stream : Gio::InputStream? = nil, interaction : Gio::TlsInteraction? = nil, negotiated_protocol : ::String? = nil, output_stream : Gio::OutputStream? = nil, peer_certificate : Gio::TlsCertificate? = nil, peer_certificate_errors : Gio::TlsCertificateFlags? = nil, protocol_version : Gio::TlsProtocolVersion? = nil, rehandshake_mode : Gio::TlsRehandshakeMode? = nil, require_close_notify : Bool? = nil, use_system_certdb : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[16]
      _values = StaticArray(LibGObject::Value, 16).new(LibGObject::Value.new)
      _n = 0

      if advertised_protocols
        (_names.to_unsafe + _n).value = "advertised-protocols".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, advertised_protocols)
        _n += 1
      end
      if base_io_stream
        (_names.to_unsafe + _n).value = "base-io-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_io_stream)
        _n += 1
      end
      if certificate
        (_names.to_unsafe + _n).value = "certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, certificate)
        _n += 1
      end
      if ciphersuite_name
        (_names.to_unsafe + _n).value = "ciphersuite-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ciphersuite_name)
        _n += 1
      end
      if closed
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if database
        (_names.to_unsafe + _n).value = "database".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, database)
        _n += 1
      end
      if input_stream
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if interaction
        (_names.to_unsafe + _n).value = "interaction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interaction)
        _n += 1
      end
      if negotiated_protocol
        (_names.to_unsafe + _n).value = "negotiated-protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, negotiated_protocol)
        _n += 1
      end
      if output_stream
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end
      if peer_certificate
        (_names.to_unsafe + _n).value = "peer-certificate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, peer_certificate)
        _n += 1
      end
      if peer_certificate_errors
        (_names.to_unsafe + _n).value = "peer-certificate-errors".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, peer_certificate_errors)
        _n += 1
      end
      if protocol_version
        (_names.to_unsafe + _n).value = "protocol-version".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol_version)
        _n += 1
      end
      if rehandshake_mode
        (_names.to_unsafe + _n).value = "rehandshake-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rehandshake_mode)
        _n += 1
      end
      if require_close_notify
        (_names.to_unsafe + _n).value = "require-close-notify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, require_close_notify)
        _n += 1
      end
      if use_system_certdb
        (_names.to_unsafe + _n).value = "use-system-certdb".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_system_certdb)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TlsConnection.g_type, _n, _names, _values)
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
      Gio::TlsCertificateFlags.from_value(value)
    end

    def protocol_version : Gio::TlsProtocolVersion
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "protocol-version", pointerof(value), Pointer(Void).null)
      Gio::TlsProtocolVersion.from_value(value)
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
      Gio::TlsRehandshakeMode.from_value(value)
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

    def emit_accept_certificate(peer_cert : Gio::TlsCertificate, errors : Gio::TlsCertificateFlags) : Bool
      # g_tls_connection_emit_accept_certificate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_emit_accept_certificate(self, peer_cert, errors)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def certificate : Gio::TlsCertificate?
      # g_tls_connection_get_certificate: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_certificate(self)

      # Return value handling
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def channel_binding_data(type : Gio::TlsChannelBindingType) : Bool
      # g_tls_connection_get_channel_binding_data: (Method | Throws)
      # @data: (out) (optional) (array element-type UInt8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      data = Pointer(Pointer(UInt8)).null
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_tls_connection_get_channel_binding_data(self, type, data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ciphersuite_name : ::String?
      # g_tls_connection_get_ciphersuite_name: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_ciphersuite_name(self)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def database : Gio::TlsDatabase?
      # g_tls_connection_get_database: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_database(self)

      # Return value handling
      Gio::TlsDatabase.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def interaction : Gio::TlsInteraction?
      # g_tls_connection_get_interaction: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_interaction(self)

      # Return value handling
      Gio::TlsInteraction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def negotiated_protocol : ::String?
      # g_tls_connection_get_negotiated_protocol: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_negotiated_protocol(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def peer_certificate : Gio::TlsCertificate?
      # g_tls_connection_get_peer_certificate: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_peer_certificate(self)

      # Return value handling
      Gio::TlsCertificate.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def peer_certificate_errors : Gio::TlsCertificateFlags
      # g_tls_connection_get_peer_certificate_errors: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_peer_certificate_errors(self)

      # Return value handling
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def protocol_version : Gio::TlsProtocolVersion
      # g_tls_connection_get_protocol_version: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_protocol_version(self)

      # Return value handling
      Gio::TlsProtocolVersion.from_value(_retval)
    end

    def rehandshake_mode : Gio::TlsRehandshakeMode
      # g_tls_connection_get_rehandshake_mode: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_rehandshake_mode(self)

      # Return value handling
      Gio::TlsRehandshakeMode.from_value(_retval)
    end

    def require_close_notify : Bool
      # g_tls_connection_get_require_close_notify: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_require_close_notify(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def use_system_certdb : Bool
      # g_tls_connection_get_use_system_certdb: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_get_use_system_certdb(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def handshake(cancellable : Gio::Cancellable?) : Bool
      # g_tls_connection_handshake: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_tls_connection_handshake(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def handshake_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_tls_connection_handshake_async: (Method)
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
      LibGio.g_tls_connection_handshake_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def handshake_finish(result : Gio::AsyncResult) : Bool
      # g_tls_connection_handshake_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_tls_connection_handshake_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def advertised_protocols=(protocols : Enumerable(::String)?) : Nil
      # g_tls_connection_set_advertised_protocols: (Method | Setter)
      # @protocols: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Handle parameters
      protocols = if protocols.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    protocols.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      LibGio.g_tls_connection_set_advertised_protocols(self, protocols)

      # Return value handling
    end

    def certificate=(certificate : Gio::TlsCertificate) : Nil
      # g_tls_connection_set_certificate: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_tls_connection_set_certificate(self, certificate)

      # Return value handling
    end

    def database=(database : Gio::TlsDatabase?) : Nil
      # g_tls_connection_set_database: (Method | Setter)
      # @database: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      database = if database.nil?
                   Pointer(Void).null
                 else
                   database.to_unsafe
                 end

      # C call
      LibGio.g_tls_connection_set_database(self, database)

      # Return value handling
    end

    def interaction=(interaction : Gio::TlsInteraction?) : Nil
      # g_tls_connection_set_interaction: (Method | Setter)
      # @interaction: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      interaction = if interaction.nil?
                      Pointer(Void).null
                    else
                      interaction.to_unsafe
                    end

      # C call
      LibGio.g_tls_connection_set_interaction(self, interaction)

      # Return value handling
    end

    def rehandshake_mode=(mode : Gio::TlsRehandshakeMode) : Nil
      # g_tls_connection_set_rehandshake_mode: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_tls_connection_set_rehandshake_mode(self, mode)

      # Return value handling
    end

    def require_close_notify=(require_close_notify : Bool) : Nil
      # g_tls_connection_set_require_close_notify: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_tls_connection_set_require_close_notify(self, require_close_notify)

      # Return value handling
    end

    def use_system_certdb=(use_system_certdb : Bool) : Nil
      # g_tls_connection_set_use_system_certdb: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_tls_connection_set_use_system_certdb(self, use_system_certdb)

      # Return value handling
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

      def connect(block : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gio::TlsCertificate.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::TlsCertificateFlags.from_value(lib_arg1)
          ::Box(Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gio::TlsCertificate.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::TlsCertificateFlags.from_value(lib_arg1)
          ::Box(Proc(Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gio::TlsConnection.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::TlsCertificate.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::TlsCertificateFlags.from_value(lib_arg1)
          ::Box(Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gio::TlsConnection.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::TlsCertificate.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::TlsCertificateFlags.from_value(lib_arg1)
          ::Box(Proc(Gio::TlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
