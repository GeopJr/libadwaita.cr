require "../g_object-2.0/object"

module Gio
  # #GSocketClient is a lightweight high-level utility class for connecting to
  # a network host using a connection oriented socket type.
  #
  # You create a #GSocketClient object, set any options you want, and then
  # call a sync or async connect operation, which returns a #GSocketConnection
  # subclass on success.
  #
  # The type of the #GSocketConnection object returned depends on the type of
  # the underlying socket that is in use. For instance, for a TCP/IP connection
  # it will be a #GTcpConnection.
  #
  # As #GSocketClient is a lightweight object, you don't need to cache it. You
  # can just create a new one any time you need one.
  class SocketClient < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enable_proxy : Bool? = nil, family : Gio::SocketFamily? = nil, local_address : Gio::SocketAddress? = nil, protocol : Gio::SocketProtocol? = nil, proxy_resolver : Gio::ProxyResolver? = nil, timeout : UInt32? = nil, tls : Bool? = nil, tls_validation_flags : Gio::TlsCertificateFlags? = nil, type : Gio::SocketType? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if enable_proxy
        (_names.to_unsafe + _n).value = "enable-proxy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_proxy)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if local_address
        (_names.to_unsafe + _n).value = "local-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local_address)
        _n += 1
      end
      if protocol
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if proxy_resolver
        (_names.to_unsafe + _n).value = "proxy-resolver".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, proxy_resolver)
        _n += 1
      end
      if timeout
        (_names.to_unsafe + _n).value = "timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timeout)
        _n += 1
      end
      if tls
        (_names.to_unsafe + _n).value = "tls".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tls)
        _n += 1
      end
      if tls_validation_flags
        (_names.to_unsafe + _n).value = "tls-validation-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tls_validation_flags)
        _n += 1
      end
      if type
        (_names.to_unsafe + _n).value = "type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketClient.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_client_get_type
    end

    def type=(value : SocketType) : SocketType
      unsafe_value = value

      LibGObject.g_object_set(self, "type", unsafe_value, Pointer(Void).null)
      value
    end

    def type : SocketType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "type", pointerof(value), Pointer(Void).null)
      Gio::SocketType.from_value(value)
    end

    def initialize
      # g_socket_client_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_client_new
      @pointer = _retval
    end

    def add_application_proxy(protocol : ::String) : Nil
      # g_socket_client_add_application_proxy: (Method)
      # Returns: (transfer none)

      LibGio.g_socket_client_add_application_proxy(self, protocol)
    end

    def connect(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_client_connect(self, connectable, cancellable)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_async(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_client_connect_async: (Method)
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

      LibGio.g_socket_client_connect_async(self, connectable, cancellable, callback, user_data)
    end

    def connect_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_client_connect_finish(self, result)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_host(host_and_port : ::String, default_port : UInt16, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_host: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_client_connect_to_host(self, host_and_port, default_port, cancellable)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_host_async(host_and_port : ::String, default_port : UInt16, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_client_connect_to_host_async: (Method)
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

      LibGio.g_socket_client_connect_to_host_async(self, host_and_port, default_port, cancellable, callback, user_data)
    end

    def connect_to_host_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_host_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_client_connect_to_host_finish(self, result)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_service(domain : ::String, service : ::String, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_service: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_client_connect_to_service(self, domain, service, cancellable)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_service_async(domain : ::String, service : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_client_connect_to_service_async: (Method)
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

      LibGio.g_socket_client_connect_to_service_async(self, domain, service, cancellable, callback, user_data)
    end

    def connect_to_service_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_service_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_client_connect_to_service_finish(self, result)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_uri(uri : ::String, default_port : UInt16, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_uri: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_client_connect_to_uri(self, uri, default_port, cancellable)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def connect_to_uri_async(uri : ::String, default_port : UInt16, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_client_connect_to_uri_async: (Method)
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

      LibGio.g_socket_client_connect_to_uri_async(self, uri, default_port, cancellable, callback, user_data)
    end

    def connect_to_uri_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_uri_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_client_connect_to_uri_finish(self, result)
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def enable_proxy? : Bool
      # g_socket_client_get_enable_proxy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_enable_proxy(self)
      GICrystal.to_bool(_retval)
    end

    def family : Gio::SocketFamily
      # g_socket_client_get_family: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_family(self)
      Gio::SocketFamily.from_value(_retval)
    end

    def local_address : Gio::SocketAddress?
      # g_socket_client_get_local_address: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_local_address(self)
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def protocol : Gio::SocketProtocol
      # g_socket_client_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_protocol(self)
      Gio::SocketProtocol.from_value(_retval)
    end

    def proxy_resolver : Gio::ProxyResolver
      # g_socket_client_get_proxy_resolver: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_proxy_resolver(self)
      Gio::ProxyResolver__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def socket_type : Gio::SocketType
      # g_socket_client_get_socket_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_socket_type(self)
      Gio::SocketType.from_value(_retval)
    end

    def timeout : UInt32
      # g_socket_client_get_timeout: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_timeout(self)
      _retval
    end

    def tls? : Bool
      # g_socket_client_get_tls: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_tls(self)
      GICrystal.to_bool(_retval)
    end

    def tls_validation_flags : Gio::TlsCertificateFlags
      # g_socket_client_get_tls_validation_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_client_get_tls_validation_flags(self)
      Gio::TlsCertificateFlags.from_value(_retval)
    end

    def enable_proxy=(enable : Bool) : Nil
      # g_socket_client_set_enable_proxy: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_enable_proxy(self, enable)
    end

    def family=(family : Gio::SocketFamily) : Nil
      # g_socket_client_set_family: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_family(self, family)
    end

    def local_address=(address : Gio::SocketAddress?) : Nil
      # g_socket_client_set_local_address: (Method | Setter)
      # @address: (nullable)
      # Returns: (transfer none)

      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end

      LibGio.g_socket_client_set_local_address(self, address)
    end

    def protocol=(protocol : Gio::SocketProtocol) : Nil
      # g_socket_client_set_protocol: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_protocol(self, protocol)
    end

    def proxy_resolver=(proxy_resolver : Gio::ProxyResolver?) : Nil
      # g_socket_client_set_proxy_resolver: (Method | Setter)
      # @proxy_resolver: (nullable)
      # Returns: (transfer none)

      proxy_resolver = if proxy_resolver.nil?
                         Pointer(Void).null
                       else
                         proxy_resolver.to_unsafe
                       end

      LibGio.g_socket_client_set_proxy_resolver(self, proxy_resolver)
    end

    def socket_type=(type : Gio::SocketType) : Nil
      # g_socket_client_set_socket_type: (Method)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_socket_type(self, type)
    end

    def timeout=(timeout : UInt32) : Nil
      # g_socket_client_set_timeout: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_timeout(self, timeout)
    end

    def tls=(tls : Bool) : Nil
      # g_socket_client_set_tls: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_tls(self, tls)
    end

    def tls_validation_flags=(flags : Gio::TlsCertificateFlags) : Nil
      # g_socket_client_set_tls_validation_flags: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_socket_client_set_tls_validation_flags(self, flags)
    end

    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketClientEvent.from_value(lib_arg0)
          arg1 = Gio::SocketConnectable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gio::IOStream.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketClientEvent.from_value(lib_arg0)
          arg1 = Gio::SocketConnectable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gio::IOStream.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketClientEvent.from_value(lib_arg0)
          arg1 = Gio::SocketConnectable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gio::IOStream.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketClientEvent.from_value(lib_arg0)
          arg1 = Gio::SocketConnectable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gio::IOStream.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gio::SocketClientEvent, connectable : Gio::SocketConnectable, connection : Gio::IOStream) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event, connectable, connection)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
