require "../g_object-2.0/object"

module Gio
  # Integrating the launch with the launching application. This is used to
  # handle for instance startup notification and launching the new application
  # on the same screen as the launching window.
  @[GObject::GeneratedWrapper]
  class AppLaunchContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::AppLaunchContextClass), class_init,
        sizeof(LibGio::AppLaunchContext), instance_init, 0)
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
      LibGio.g_app_launch_context_get_type
    end

    # Creates a new application launch context. This is not normally used,
    # instead you instantiate a subclass of this, such as #GdkAppLaunchContext.
    def initialize
      # g_app_launch_context_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_app_launch_context_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the display string for the @context. This is used to ensure new
    # applications are started on the same display as the launching
    # application, by setting the `DISPLAY` environment variable.
    def display(info : Gio::AppInfo, files : GLib::List) : ::String?
      # g_app_launch_context_get_display: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_app_launch_context_get_display(self, info, files)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the complete environment variable list to be passed to
    # the child process when @context is used to launch an application.
    # This is a %NULL-terminated array of strings, where each string has
    # the form `KEY=VALUE`.
    def environment : Enumerable(::String)
      # g_app_launch_context_get_environment: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Filename)

      # C call
      _retval = LibGio.g_app_launch_context_get_environment(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Initiates startup notification for the application and returns the
    # `DESKTOP_STARTUP_ID` for the launched operation, if supported.
    #
    # Startup notification IDs are defined in the
    # [FreeDesktop.Org Startup Notifications standard](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
    def startup_notify_id(info : Gio::AppInfo, files : GLib::List) : ::String?
      # g_app_launch_context_get_startup_notify_id: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_app_launch_context_get_startup_notify_id(self, info, files)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Called when an application has failed to launch, so that it can cancel
    # the application startup notification started in g_app_launch_context_get_startup_notify_id().
    def launch_failed(startup_notify_id : ::String) : Nil
      # g_app_launch_context_launch_failed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_app_launch_context_launch_failed(self, startup_notify_id)

      # Return value handling
    end

    # Arranges for @variable to be set to @value in the child's
    # environment when @context is used to launch an application.
    def setenv(variable : ::String, value : ::String) : Nil
      # g_app_launch_context_setenv: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_app_launch_context_setenv(self, variable, value)

      # Return value handling
    end

    # Arranges for @variable to be unset in the child's environment
    # when @context is used to launch an application.
    def unsetenv(variable : ::String) : Nil
      # g_app_launch_context_unsetenv: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_app_launch_context_unsetenv(self, variable)

      # Return value handling
    end

    # The #GAppLaunchContext::launch-failed signal is emitted when a #GAppInfo launch
    # fails. The startup notification id is provided, so that the launcher
    # can cancel the startup notification.
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

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_startup_notify_id : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          startup_notify_id = lib_startup_notify_id
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(startup_notify_id)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_startup_notify_id : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          startup_notify_id = lib_startup_notify_id
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(startup_notify_id)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::AppLaunchContext, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_startup_notify_id : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gio::AppLaunchContext.new(_lib_sender, GICrystal::Transfer::None)
          startup_notify_id = lib_startup_notify_id
          ::Box(Proc(Gio::AppLaunchContext, ::String, Nil)).unbox(_lib_box).call(_sender, startup_notify_id)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::AppLaunchContext, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_startup_notify_id : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gio::AppLaunchContext.new(_lib_sender, GICrystal::Transfer::None)
          startup_notify_id = lib_startup_notify_id
          ::Box(Proc(Gio::AppLaunchContext, ::String, Nil)).unbox(_lib_box).call(_sender, startup_notify_id)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(startup_notify_id : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "launch-failed", startup_notify_id)
      end
    end

    def launch_failed_signal
      LaunchFailedSignal.new(self)
    end

    # The #GAppLaunchContext::launched signal is emitted when a #GAppInfo is successfully
    # launched. The @platform_data is an GVariant dictionary mapping
    # strings to variants (ie `a{sv}`), which contains additional,
    # platform-specific data about this launch. On UNIX, at least the
    # `pid` and `startup-notification-id` keys will be present.
    #
    # Since 2.72 the `pid` may be 0 if the process id wasn't known (for
    # example if the process was launched via D-Bus). The `pid` may not be
    # set at all in subsequent releases.
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

      def connect(handler : Proc(Gio::AppInfo, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_info : Pointer(Void), lib_platform_data : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          info = Gio::AppInfo.new(lib_info, :none)
          # Generator::HandmadeArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          # Generator::GObjectArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          ::Box(Proc(Gio::AppInfo, GLib::Variant, Nil)).unbox(_lib_box).call(info, platform_data)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::AppInfo, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_info : Pointer(Void), lib_platform_data : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          info = Gio::AppInfo.new(lib_info, :none)
          # Generator::HandmadeArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          # Generator::GObjectArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          ::Box(Proc(Gio::AppInfo, GLib::Variant, Nil)).unbox(_lib_box).call(info, platform_data)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_info : Pointer(Void), lib_platform_data : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AppLaunchContext.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          info = Gio::AppInfo.new(lib_info, :none)
          # Generator::HandmadeArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          # Generator::GObjectArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          ::Box(Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil)).unbox(_lib_box).call(_sender, info, platform_data)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_info : Pointer(Void), lib_platform_data : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AppLaunchContext.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          info = Gio::AppInfo.new(lib_info, :none)
          # Generator::HandmadeArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          # Generator::GObjectArgPlan
          platform_data = GLib::Variant.new(lib_platform_data, :none)
          ::Box(Proc(Gio::AppLaunchContext, Gio::AppInfo, GLib::Variant, Nil)).unbox(_lib_box).call(_sender, info, platform_data)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
