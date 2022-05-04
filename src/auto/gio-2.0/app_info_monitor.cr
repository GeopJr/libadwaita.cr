require "../g_object-2.0/object"

module Gio
  # #GAppInfoMonitor is a very simple object used for monitoring the app
  # info database for changes (ie: newly installed or removed
  # applications).
  #
  # Call g_app_info_monitor_get() to get a #GAppInfoMonitor and connect
  # to the "changed" signal.
  #
  # In the usual case, applications should try to make note of the change
  # (doing things like invalidating caches) but not act on it.  In
  # particular, applications should avoid making calls to #GAppInfo APIs
  # in response to the change signal, deferring these until the time that
  # the data is actually required.  The exception to this case is when
  # application information is actually being displayed on the screen
  # (eg: during a search or when the list of all applications is shown).
  # The reason for this is that changes to the list of installed
  # applications often come in groups (like during system updates) and
  # rescanning the list on every change is pointless and expensive.
  @[GObject::GeneratedWrapper]
  class AppInfoMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::AppInfoMonitor), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_app_info_monitor_get_type
    end

    # Gets the #GAppInfoMonitor for the current thread-default main
    # context.
    #
    # The #GAppInfoMonitor will emit a "changed" signal in the
    # thread-default main context whenever the list of installed
    # applications (as reported by g_app_info_get_all()) may have changed.
    #
    # You must only call g_object_unref() on the return value from under
    # the same main context as you created it.
    def self.get : Gio::AppInfoMonitor
      # g_app_info_monitor_get: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_app_info_monitor_get

      # Return value handling

      Gio::AppInfoMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    # Signal emitted when the app info database for changes (ie: newly installed
    # or removed applications).
    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::AppInfoMonitor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AppInfoMonitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfoMonitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::AppInfoMonitor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AppInfoMonitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfoMonitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
