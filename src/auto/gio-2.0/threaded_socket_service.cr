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
  @[GObject::GeneratedWrapper]
  class ThreadedSocketService < SocketService
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ThreadedSocketServiceClass), class_init,
        sizeof(LibGio::ThreadedSocketService), instance_init, 0)
    end

    GICrystal.define_new_method(ThreadedSocketService, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ThreadedSocketService`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, active : Bool? = nil, listen_backlog : Int32? = nil, max_threads : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if !listen_backlog.nil?
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end
      if !max_threads.nil?
        (_names.to_unsafe + _n).value = "max-threads".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_threads)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ThreadedSocketService.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new #GThreadedSocketService with no listeners. Listeners
    # must be added with one of the #GSocketListener "add" methods.
    def initialize(max_threads : Int32)
      # g_threaded_socket_service_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_threaded_socket_service_new(max_threads)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # The ::run signal is emitted in a worker thread in response to an
    # incoming connection. This thread is dedicated to handling
    # @connection and may perform blocking IO. The signal handler need
    # not return until the connection is closed.
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

      def connect(handler : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::ThreadedSocketService.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(_sender, connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::ThreadedSocketService.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::ThreadedSocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(_sender, connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(connection : Gio::SocketConnection, source_object : GObject::Object?) : Nil
        # Generator::NullableArrayPlan
        source_object = if source_object.nil?
                          Void.null
                        else
                          source_object.to_unsafe
                        end

        LibGObject.g_signal_emit_by_name(@source, "run", connection, source_object)
      end
    end

    def run_signal
      RunSignal.new(self)
    end
  end
end
