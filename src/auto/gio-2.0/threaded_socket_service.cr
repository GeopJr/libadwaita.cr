require "./socket_service"

module Gio
  # A #GThreadedSocketService is a simple subclass of #GSocketService
  # that handles incoming connections by creating a worker thread and
  # dispatching the connection to it by emitting the
  # #GThreadedSocketService::run signal in the new thread.
  #
  # The signal handler may perform blocking IO and need not return
  # until the connection is closed.
  #
  # The service is implemented using a thread pool, so there is a
  # limited amount of threads available to serve incoming requests.
  # The service automatically stops the #GSocketService from accepting
  # new connections when all threads are busy.
  #
  # As with #GSocketService, you may connect to #GThreadedSocketService::run,
  # or subclass and override the default handler.
  class ThreadedSocketService < SocketService
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, active : Bool? = nil, listen_backlog : Int32? = nil, max_threads : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
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
      if max_threads
        (_names.to_unsafe + _n).value = "max-threads".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_threads)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ThreadedSocketService.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_threaded_socket_service_get_type
    end

    def max_threads=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-threads", unsafe_value, Pointer(Void).null)
      value
    end

    def max_threads : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-threads", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(max_threads : Int32)
      # g_threaded_socket_service_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_threaded_socket_service_new(max_threads)

      # Return value handling
      @pointer = _retval
    end

    struct RunSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "run::#{@detail}" : "run"
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

      def connect(block : Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::ThreadedSocketService.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::ThreadedSocketService.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::SocketConnection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : GObject::Object.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(connection : Gio::SocketConnection, source_object : GObject::Object?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "run", connection, source_object)
      end
    end

    def run_signal
      RunSignal.new(self)
    end
  end
end
