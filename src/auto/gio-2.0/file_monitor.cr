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
  class FileMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cancelled : Bool? = nil, rate_limit : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if cancelled
        (_names.to_unsafe + _n).value = "cancelled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cancelled)
        _n += 1
      end
      if rate_limit
        (_names.to_unsafe + _n).value = "rate-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rate_limit)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileMonitor.g_type, _n, _names, _values)
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

    def cancel : Bool
      # g_file_monitor_cancel: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_monitor_cancel(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def emit_event(child : Gio::File, other_file : Gio::File, event_type : Gio::FileMonitorEvent) : Nil
      # g_file_monitor_emit_event: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_monitor_emit_event(self, child, other_file, event_type)

      # Return value handling
    end

    def is_cancelled : Bool
      # g_file_monitor_is_cancelled: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_monitor_is_cancelled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def rate_limit=(limit_msecs : Int32) : Nil
      # g_file_monitor_set_rate_limit: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_monitor_set_rate_limit(self, limit_msecs)

      # Return value handling
    end

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

      def connect(block : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = Gio::File__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::File__Impl.new(lib_arg1, GICrystal::Transfer::None))
          arg2 = Gio::FileMonitorEvent.from_value(lib_arg2)
          ::Box(Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : UInt32, box : Pointer(Void)) {
          arg0 = Gio::File__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::File__Impl.new(lib_arg1, GICrystal::Transfer::None))
          arg2 = Gio::FileMonitorEvent.from_value(lib_arg2)
          ::Box(Proc(Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gio::FileMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::File__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::File__Impl.new(lib_arg1, GICrystal::Transfer::None))
          arg2 = Gio::FileMonitorEvent.from_value(lib_arg2)
          ::Box(Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : UInt32, box : Pointer(Void)) {
          sender = Gio::FileMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::File__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::File__Impl.new(lib_arg1, GICrystal::Transfer::None))
          arg2 = Gio::FileMonitorEvent.from_value(lib_arg2)
          ::Box(Proc(Gio::FileMonitor, Gio::File, Gio::File?, Gio::FileMonitorEvent, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(file : Gio::File, other_file : Gio::File?, event_type : Gio::FileMonitorEvent) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", file, other_file, event_type)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
