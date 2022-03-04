require "./socket_listener"

module Gio
  # A #GSocketService is an object that represents a service that
  # is provided to the network or over local sockets.  When a new
  # connection is made to the service the #GSocketService::incoming
  # signal is emitted.
  #
  # A #GSocketService is a subclass of #GSocketListener and you need
  # to add the addresses you want to accept connections on with the
  # #GSocketListener APIs.
  #
  # There are two options for implementing a network service based on
  # #GSocketService. The first is to create the service using
  # g_socket_service_new() and to connect to the #GSocketService::incoming
  # signal. The second is to subclass #GSocketService and override the
  # default signal handler implementation.
  #
  # In either case, the handler must immediately return, or else it
  # will block additional incoming connections from being serviced.
  # If you are interested in writing connection handlers that contain
  # blocking code then see #GThreadedSocketService.
  #
  # The socket service runs on the main loop of the
  # [thread-default context][g-main-context-push-thread-default-context]
  # of the thread it is created in, and is not
  # threadsafe in general. However, the calls to start and stop the
  # service are thread-safe so these can be used from threads that
  # handle incoming clients.
  class SocketService < SocketListener
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, active : Bool? = nil, listen_backlog : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if active
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if listen_backlog
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketService.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_service_get_type
    end

    def active=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # g_socket_service_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_service_new

      # Return value handling
      @pointer = _retval
    end

    def is_active : Bool
      # g_socket_service_is_active: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_service_is_active(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def start : Nil
      # g_socket_service_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_service_start(self)

      # Return value handling
    end

    def stop : Nil
      # g_socket_service_stop: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_service_stop(self)

      # Return value handling
    end

    struct IncomingSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "incoming::#{@detail}" : "incoming"
      end

      def connect(&block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        connect(block)
      end

      def connect(block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketService.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::SocketService.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(connection : Gio::SocketConnection, source_object : GObject::Object?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "incoming", connection, source_object)
      end
    end

    def incoming_signal
      IncomingSignal.new(self)
    end
  end
end
