require "../g_object-2.0/object"

module Gio
  # Integrating the launch with the launching application. This is used to
  # handle for instance startup notification and launching the new application
  # on the same screen as the launching window.
  class AppLaunchContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_app_launch_context_get_type
    end

    def initialize
      # g_app_launch_context_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_app_launch_context_new
      @pointer = _retval
    end

    def display(info : Gio::AppInfo, files : GLib::List) : ::String?
      # g_app_launch_context_get_display: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_app_launch_context_get_display(self, info, files)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def environment : Enumerable(::String)
      # g_app_launch_context_get_environment: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_app_launch_context_get_environment(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def startup_notify_id(info : Gio::AppInfo, files : GLib::List) : ::String?
      # g_app_launch_context_get_startup_notify_id: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_app_launch_context_get_startup_notify_id(self, info, files)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def launch_failed(startup_notify_id : ::String) : Nil
      # g_app_launch_context_launch_failed: (Method)
      # Returns: (transfer none)

      LibGio.g_app_launch_context_launch_failed(self, startup_notify_id)
    end

    def setenv(variable : ::String, value : ::String) : Nil
      # g_app_launch_context_setenv: (Method)
      # Returns: (transfer none)

      LibGio.g_app_launch_context_setenv(self, variable, value)
    end

    def unsetenv(variable : ::String) : Nil
      # g_app_launch_context_unsetenv: (Method)
      # Returns: (transfer none)

      LibGio.g_app_launch_context_unsetenv(self, variable)
    end

    struct LaunchFailedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "launch-failed::#{@detail}" : "launch-failed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::AppLaunchContext, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::AppLaunchContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::AppLaunchContext, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::AppLaunchContext, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::AppLaunchContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::AppLaunchContext, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(startup_notify_id : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "launch-failed", startup_notify_id)
      end
    end

    def launch_failed_signal
      LaunchFailedSignal.new(self)
    end

    struct LaunchedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "launched::#{@detail}" : "launched"
      end

      def connect(&block : Proc(Gio::AppInfo, GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::AppInfo, GLib::Variant, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::AppInfo, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, GLib::Variant, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::AppInfo, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppInfo, GLib::Variant, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::AppLaunchContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::AppLaunchContext.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::AppInfo__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Variant.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(info : Gio::AppInfo, platform_data : _) : Nil
        platform_data = GLib::Variant.new(platform_data) unless platform_data.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "launched", info, platform_data)
      end
    end

    def launched_signal
      LaunchedSignal.new(self)
    end
  end
end
