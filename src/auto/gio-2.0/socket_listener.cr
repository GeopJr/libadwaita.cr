require "../g_object-2.0/object"

module Gio
  # A #GSocketListener is an object that keeps track of a set
  # of server sockets and helps you accept sockets from any of the
  # socket, either sync or async.
  #
  # Add addresses and ports to listen on using g_socket_listener_add_address()
  # and g_socket_listener_add_inet_port(). These will be listened on until
  # g_socket_listener_close() is called. Dropping your final reference to the
  # #GSocketListener will not cause g_socket_listener_close() to be called
  # implicitly, as some references to the #GSocketListener may be held
  # internally.
  #
  # If you want to implement a network server, also look at #GSocketService
  # and #GThreadedSocketService which are subclasses of #GSocketListener
  # that make this even easier.
  class SocketListener < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, listen_backlog : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if listen_backlog
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketListener.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_listener_get_type
    end

    def listen_backlog=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "listen-backlog", unsafe_value, Pointer(Void).null)
      value
    end

    def listen_backlog : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "listen-backlog", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # g_socket_listener_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_listener_new

      # Return value handling
      @pointer = _retval
    end

    def accept(cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_listener_accept: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = Pointer(Pointer(Void)).null
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_listener_accept(self, source_object, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def accept_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_socket_listener_accept_async: (Method)
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
      LibGio.g_socket_listener_accept_async(self, cancellable, callback, user_data)

      # Return value handling
    end

    def accept_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_listener_accept_finish: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = Pointer(Pointer(Void)).null
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_accept_finish(self, result, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def accept_socket(cancellable : Gio::Cancellable?) : Gio::Socket
      # g_socket_listener_accept_socket: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = Pointer(Pointer(Void)).null
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_listener_accept_socket(self, source_object, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    def accept_socket_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_socket_listener_accept_socket_async: (Method)
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
      LibGio.g_socket_listener_accept_socket_async(self, cancellable, callback, user_data)

      # Return value handling
    end

    def accept_socket_finish(result : Gio::AsyncResult) : Gio::Socket
      # g_socket_listener_accept_socket_finish: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = Pointer(Pointer(Void)).null
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_accept_socket_finish(self, result, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    def add_address(address : Gio::SocketAddress, type : Gio::SocketType, protocol : Gio::SocketProtocol, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_address: (Method | Throws)
      # @source_object: (nullable)
      # @effective_address: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      effective_address = Pointer(Pointer(Void)).null
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_address(self, address, type, protocol, source_object, effective_address, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def add_any_inet_port(source_object : GObject::Object?) : UInt16
      # g_socket_listener_add_any_inet_port: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_any_inet_port(self, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def add_inet_port(port : UInt16, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_inet_port: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_inet_port(self, port, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def add_socket(socket : Gio::Socket, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_socket: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_socket(self, socket, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close : Nil
      # g_socket_listener_close: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_listener_close(self)

      # Return value handling
    end

    def backlog=(listen_backlog : Int32) : Nil
      # g_socket_listener_set_backlog: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_listener_set_backlog(self, listen_backlog)

      # Return value handling
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

      def connect(&block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketListenerEvent.from_value(lib_arg0)
          arg1 = Gio::Socket.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketListenerEvent.from_value(lib_arg0)
          arg1 = Gio::Socket.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketListener.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketListenerEvent.from_value(lib_arg0)
          arg1 = Gio::Socket.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketListener.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketListenerEvent.from_value(lib_arg0)
          arg1 = Gio::Socket.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gio::SocketListenerEvent, socket : Gio::Socket) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event, socket)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
