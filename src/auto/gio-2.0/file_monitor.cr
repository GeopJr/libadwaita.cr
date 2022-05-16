require "../g_object-2.0/object"

module Gio
  # Monitors a file or directory for changes.
  #
  # To obtain a #GFileMonitor for a file or directory, use
  # g_file_monitor(), g_file_monitor_file(), or
  # g_file_monitor_directory().
  #
  # To get informed about changes to the file or directory you are
  # monitoring, connect to the #GFileMonitor::changed signal. The
  # signal will be emitted in the
  # [thread-default main context][g-main-context-push-thread-default]
  # of the thread that the monitor was created in
  # (though if the global default main context is blocked, this may
  # cause notifications to be blocked even if the thread-default
  # context is still running).
  @[GObject::GeneratedWrapper]
  class FileMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileMonitorClass), class_init,
        sizeof(LibGio::FileMonitor), instance_init, 0)
    end

    GICrystal.define_new_method(FileMonitor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FileMonitor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cancelled : Bool? = nil, rate_limit : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !cancelled.nil?
        (_names.to_unsafe + _n).value = "cancelled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cancelled)
        _n += 1
      end
      if !rate_limit.nil?
        (_names.to_unsafe + _n).value = "rate-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rate_limit)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileMonitor.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_monitor_get_type
    end

    def cancelled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "cancelled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def rate_limit=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "rate-limit", unsafe_value, Pointer(Void).null)
      value
    end

    def rate_limit : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "rate-limit", pointerof(value), Pointer(Void).null)
      value
    end

    # Cancels a file monitor.
    def cancel : Bool
      # g_file_monitor_cancel: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_monitor_cancel(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emits the #GFileMonitor::changed signal if a change
    # has taken place. Should be called from file monitor
    # implementations only.
    #
    # Implementations are responsible to call this method from the
    # [thread-default main context][g-main-context-push-thread-default] of the
    # thread that the monitor was created in.
    def emit_event(child : Gio::File, other_file : Gio::File, event_type : Gio::FileMonitorEvent) : Nil
      # g_file_monitor_emit_event: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_monitor_emit_event(@pointer, child, other_file, event_type)

      # Return value handling
    end

    # Returns whether the monitor is canceled.
    def is_cancelled : Bool
      # g_file_monitor_is_cancelled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_monitor_is_cancelled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the rate limit to which the @monitor will report
    # consecutive change events to the same file.
    def rate_limit=(limit_msecs : Int32) : Nil
      # g_file_monitor_set_rate_limit: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_monitor_set_rate_limit(@pointer, limit_msecs)

      # Return value handling
    end

    # Emitted when @file has been changed.
    #
    # If using %G_FILE_MONITOR_WATCH_MOVES on a directory monitor, and
    # the information is available (and if supported by the backend),
    # @event_type may be %G_FILE_MONITOR_EVENT_RENAMED,
    # %G_FILE_MONITOR_EVENT_MOVED_IN or %G_FILE_MONITOR_EVENT_MOVED_OUT.
    #
    # In all cases @file will be a child of the monitored directory.  For
    # renames, @file will be the old name and @other_file is the new
    # name.  For "moved in" events, @file is the name of the file that
    # appeared and @other_file is the old name that it was moved from (in
    # another directory).  For "moved out" events, @file is the name of
    # the file that used to be in this directory and @other_file is the
    # name of the file at its new location.
    #
    # It makes sense to treat %G_FILE_MONITOR_EVENT_MOVED_IN as
    # equivalent to %G_FILE_MONITOR_EVENT_CREATED and
    # %G_FILE_MONITOR_EVENT_MOVED_OUT as equivalent to
    # %G_FILE_MONITOR_EVENT_DELETED, with extra information.
    # %G_FILE_MONITOR_EVENT_RENAMED is equivalent to a delete/create
    # pair.  This is exactly how the events will be reported in the case
    # that the %G_FILE_MONITOR_WATCH_MOVES flag is not in use.
    #
    # If using the deprecated flag %G_FILE_MONITOR_SEND_MOVED flag and @event_type is
    # %G_FILE_MONITOR_EVENT_MOVED, @file will be set to a #GFile containing the
    # old path, and @other_file will be set to a #GFile containing the new path.
    #
    # In all the other cases, @other_file will be set to #NULL.
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

      def connect(&block : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_file : Pointer(Void), lib_other_file : Pointer(Void), lib_event_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          file = Gio::File.new(lib_file, :none)
          # Generator::NullableArrayPlan
          other_file = (lib_other_file.null? ? nil : Gio::AbstractFile.new(lib_other_file, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          other_file = Gio::File.new(lib_other_file, :none) unless lib_other_file.null?
          # Generator::BuiltInTypeArgPlan
          event_type = Gio::FileMonitorEvent.new(lib_event_type)
          ::Box(Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(_lib_box).call(file, other_file, event_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_file : Pointer(Void), lib_other_file : Pointer(Void), lib_event_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          file = Gio::File.new(lib_file, :none)
          # Generator::NullableArrayPlan
          other_file = (lib_other_file.null? ? nil : Gio::AbstractFile.new(lib_other_file, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          other_file = Gio::File.new(lib_other_file, :none) unless lib_other_file.null?
          # Generator::BuiltInTypeArgPlan
          event_type = Gio::FileMonitorEvent.new(lib_event_type)
          ::Box(Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(_lib_box).call(file, other_file, event_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_file : Pointer(Void), lib_other_file : Pointer(Void), lib_event_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::FileMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          file = Gio::File.new(lib_file, :none)
          # Generator::NullableArrayPlan
          other_file = (lib_other_file.null? ? nil : Gio::AbstractFile.new(lib_other_file, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          other_file = Gio::File.new(lib_other_file, :none) unless lib_other_file.null?
          # Generator::BuiltInTypeArgPlan
          event_type = Gio::FileMonitorEvent.new(lib_event_type)
          ::Box(Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(_lib_box).call(_sender, file, other_file, event_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_file : Pointer(Void), lib_other_file : Pointer(Void), lib_event_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::FileMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          file = Gio::File.new(lib_file, :none)
          # Generator::NullableArrayPlan
          other_file = (lib_other_file.null? ? nil : Gio::AbstractFile.new(lib_other_file, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          other_file = Gio::File.new(lib_other_file, :none) unless lib_other_file.null?
          # Generator::BuiltInTypeArgPlan
          event_type = Gio::FileMonitorEvent.new(lib_event_type)
          ::Box(Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(_lib_box).call(_sender, file, other_file, event_type)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(file : Gio::File, other_file : Gio::File?, event_type : Gio::FileMonitorEvent) : Nil
        # Generator::NullableArrayPlan
        other_file = if other_file.nil?
                       Void.null
                     else
                       other_file.to_unsafe
                     end

        LibGObject.g_signal_emit_by_name(@source, "changed", file, other_file, event_type)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
