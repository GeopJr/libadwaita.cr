require "../g_object-2.0/object"
require "./action_group"

require "./action_map"

module Gio
  # A #GApplication is the foundation of an application.  It wraps some
  # low-level platform-specific services and is intended to act as the
  # foundation for higher-level application classes such as
  # #GtkApplication or #MxApplication.  In general, you should not use
  # this class outside of a higher level framework.
  #
  # GApplication provides convenient life cycle management by maintaining
  # a "use count" for the primary application instance. The use count can
  # be changed using g_application_hold() and g_application_release(). If
  # it drops to zero, the application exits. Higher-level classes such as
  # #GtkApplication employ the use count to ensure that the application
  # stays alive as long as it has any opened windows.
  #
  # Another feature that GApplication (optionally) provides is process
  # uniqueness. Applications can make use of this functionality by
  # providing a unique application ID. If given, only one application
  # with this ID can be running at a time per session. The session
  # concept is platform-dependent, but corresponds roughly to a graphical
  # desktop login. When your application is launched again, its
  # arguments are passed through platform communication to the already
  # running program. The already running instance of the program is
  # called the "primary instance"; for non-unique applications this is
  # always the current instance. On Linux, the D-Bus session bus
  # is used for communication.
  #
  # The use of #GApplication differs from some other commonly-used
  # uniqueness libraries (such as libunique) in important ways. The
  # application is not expected to manually register itself and check
  # if it is the primary instance. Instead, the main() function of a
  # #GApplication should do very little more than instantiating the
  # application instance, possibly connecting signal handlers, then
  # calling g_application_run(). All checks for uniqueness are done
  # internally. If the application is the primary instance then the
  # startup signal is emitted and the mainloop runs. If the application
  # is not the primary instance then a signal is sent to the primary
  # instance and g_application_run() promptly returns. See the code
  # examples below.
  #
  # If used, the expected form of an application identifier is the same as
  # that of of a
  # [D-Bus well-known bus name](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
  # Examples include: `com.example.MyApp`, `org.example.internal_apps.Calculator`,
  # `org._7_zip.Archiver`.
  # For details on valid application identifiers, see g_application_id_is_valid().
  #
  # On Linux, the application identifier is claimed as a well-known bus name
  # on the user's session bus.  This means that the uniqueness of your
  # application is scoped to the current session.  It also means that your
  # application may provide additional services (through registration of other
  # object paths) at that bus name.  The registration of these object paths
  # should be done with the shared GDBus session bus.  Note that due to the
  # internal architecture of GDBus, method calls can be dispatched at any time
  # (even if a main loop is not running).  For this reason, you must ensure that
  # any object paths that you wish to register are registered before #GApplication
  # attempts to acquire the bus name of your application (which happens in
  # g_application_register()).  Unfortunately, this means that you cannot use
  # g_application_get_is_remote() to decide if you want to register object paths.
  #
  # GApplication also implements the #GActionGroup and #GActionMap
  # interfaces and lets you easily export actions by adding them with
  # g_action_map_add_action(). When invoking an action by calling
  # g_action_group_activate_action() on the application, it is always
  # invoked in the primary instance. The actions are also exported on
  # the session bus, and GIO provides the #GDBusActionGroup wrapper to
  # conveniently access them remotely. GIO provides a #GDBusMenuModel wrapper
  # for remote access to exported #GMenuModels.
  #
  # There is a number of different entry points into a GApplication:
  #
  # - via 'Activate' (i.e. just starting the application)
  #
  # - via 'Open' (i.e. opening some files)
  #
  # - by handling a command-line
  #
  # - via activating an action
  #
  # The #GApplication::startup signal lets you handle the application
  # initialization for all of these in a single place.
  #
  # Regardless of which of these entry points is used to start the
  # application, GApplication passes some ‘platform data’ from the
  # launching instance to the primary instance, in the form of a
  # #GVariant dictionary mapping strings to variants. To use platform
  # data, override the @before_emit or @after_emit virtual functions
  # in your #GApplication subclass. When dealing with
  # #GApplicationCommandLine objects, the platform data is
  # directly available via g_application_command_line_get_cwd(),
  # g_application_command_line_get_environ() and
  # g_application_command_line_get_platform_data().
  #
  # As the name indicates, the platform data may vary depending on the
  # operating system, but it always includes the current directory (key
  # "cwd"), and optionally the environment (ie the set of environment
  # variables and their values) of the calling process (key "environ").
  # The environment is only added to the platform data if the
  # %G_APPLICATION_SEND_ENVIRONMENT flag is set. #GApplication subclasses
  # can add their own platform data by overriding the @add_platform_data
  # virtual function. For instance, #GtkApplication adds startup notification
  # data in this way.
  #
  # To parse commandline arguments you may handle the
  # #GApplication::command-line signal or override the local_command_line()
  # vfunc, to parse them in either the primary instance or the local instance,
  # respectively.
  #
  # For an example of opening files with a GApplication, see
  # [gapplication-example-open.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-open.c).
  #
  # For an example of using actions with GApplication, see
  # [gapplication-example-actions.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-actions.c).
  #
  # For an example of using extra D-Bus hooks with GApplication, see
  # [gapplication-example-dbushooks.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c).
  class Application < GObject::Object
    include ActionGroup
    include ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, application_id : ::String? = nil, flags : Gio::ApplicationFlags? = nil, inactivity_timeout : UInt32? = nil, is_busy : Bool? = nil, is_registered : Bool? = nil, is_remote : Bool? = nil, resource_base_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if action_group
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if application_id
        (_names.to_unsafe + _n).value = "application-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application_id)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if inactivity_timeout
        (_names.to_unsafe + _n).value = "inactivity-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inactivity_timeout)
        _n += 1
      end
      if is_busy
        (_names.to_unsafe + _n).value = "is-busy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_busy)
        _n += 1
      end
      if is_registered
        (_names.to_unsafe + _n).value = "is-registered".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_registered)
        _n += 1
      end
      if is_remote
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if resource_base_path
        (_names.to_unsafe + _n).value = "resource-base-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_base_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Application.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_get_type
    end

    def initialize(application_id : ::String?, flags : Gio::ApplicationFlags)
      # g_application_new: (Constructor)
      # @application_id: (nullable)
      # Returns: (transfer full)

      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      _retval = LibGio.g_application_new(application_id, flags)
      @pointer = _retval
    end

    def self.default : Gio::Application?
      # g_application_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_default
      Gio::Application.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.id_is_valid(application_id : ::String) : Bool
      # g_application_id_is_valid: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_application_id_is_valid(application_id)
      GICrystal.to_bool(_retval)
    end

    def activate : Nil
      # g_application_activate: (Method)
      # Returns: (transfer none)

      LibGio.g_application_activate(self)
    end

    def add_main_option(long_name : ::String, short_name : Int8, flags : GLib::OptionFlags, arg : GLib::OptionArg, description : ::String, arg_description : ::String?) : Nil
      # g_application_add_main_option: (Method)
      # @arg_description: (nullable)
      # Returns: (transfer none)

      arg_description = if arg_description.nil?
                          Pointer(LibC::Char).null
                        else
                          arg_description.to_unsafe
                        end

      LibGio.g_application_add_main_option(self, long_name, short_name, flags, arg, description, arg_description)
    end

    def add_main_option_entries(entries : Enumerable(GLib::OptionEntry)) : Nil
      # g_application_add_main_option_entries: (Method)
      # @entries: (array zero-terminated=1 element-type Interface)
      # Returns: (transfer none)

      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      LibGio.g_application_add_main_option_entries(self, entries)
    end

    def add_main_option_entries(*entries : GLib::OptionEntry)
      add_main_option_entries(entries)
    end

    def add_option_group(group : GLib::OptionGroup) : Nil
      # g_application_add_option_group: (Method)
      # @group: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(group)

      LibGio.g_application_add_option_group(self, group)
    end

    def bind_busy_property(object : GObject::Object, property : ::String) : Nil
      # g_application_bind_busy_property: (Method)
      # Returns: (transfer none)

      LibGio.g_application_bind_busy_property(self, object, property)
    end

    def application_id : ::String?
      # g_application_get_application_id: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_application_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def dbus_connection : Gio::DBusConnection?
      # g_application_get_dbus_connection: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_dbus_connection(self)
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def dbus_object_path : ::String?
      # g_application_get_dbus_object_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_dbus_object_path(self)
      ::String.new(_retval) unless _retval.null?
    end

    def flags : Gio::ApplicationFlags
      # g_application_get_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_flags(self)
      Gio::ApplicationFlags.from_value(_retval)
    end

    def inactivity_timeout : UInt32
      # g_application_get_inactivity_timeout: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_inactivity_timeout(self)
      _retval
    end

    def is_busy? : Bool
      # g_application_get_is_busy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_is_busy(self)
      GICrystal.to_bool(_retval)
    end

    def is_registered? : Bool
      # g_application_get_is_registered: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_is_registered(self)
      GICrystal.to_bool(_retval)
    end

    def is_remote? : Bool
      # g_application_get_is_remote: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_is_remote(self)
      GICrystal.to_bool(_retval)
    end

    def resource_base_path : ::String?
      # g_application_get_resource_base_path: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_get_resource_base_path(self)
      ::String.new(_retval) unless _retval.null?
    end

    def hold : Nil
      # g_application_hold: (Method)
      # Returns: (transfer none)

      LibGio.g_application_hold(self)
    end

    def mark_busy : Nil
      # g_application_mark_busy: (Method)
      # Returns: (transfer none)

      LibGio.g_application_mark_busy(self)
    end

    def open(files : Enumerable(Gio::File), hint : ::String) : Nil
      # g_application_open: (Method)
      # @files: (array length=n_files element-type Interface)
      # Returns: (transfer none)

      n_files = files.size
      files = files.to_a.map(&.to_unsafe).to_unsafe

      LibGio.g_application_open(self, files, n_files, hint)
    end

    def quit : Nil
      # g_application_quit: (Method)
      # Returns: (transfer none)

      LibGio.g_application_quit(self)
    end

    def register(cancellable : Gio::Cancellable?) : Bool
      # g_application_register: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_application_register(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def release : Nil
      # g_application_release: (Method)
      # Returns: (transfer none)

      LibGio.g_application_release(self)
    end

    def run(argv : Enumerable(::String)?) : Int32
      # g_application_run: (Method)
      # @argv: (nullable) (array length=argc element-type Filename)
      # Returns: (transfer none)

      argc = argv.try(&.size) || 0
      argv = if argv.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               argv.to_a.map(&.to_unsafe).to_unsafe
             end

      _retval = LibGio.g_application_run(self, argc, argv)
      _retval
    end

    def run(*argv : ::String)
      run(argv)
    end

    def send_notification(id : ::String?, notification : Gio::Notification) : Nil
      # g_application_send_notification: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      LibGio.g_application_send_notification(self, id, notification)
    end

    def action_group=(action_group : Gio::ActionGroup?) : Nil
      # g_application_set_action_group: (Method | Setter)
      # @action_group: (nullable)
      # Returns: (transfer none)

      action_group = if action_group.nil?
                       Pointer(Void).null
                     else
                       action_group.to_unsafe
                     end

      LibGio.g_application_set_action_group(self, action_group)
    end

    def application_id=(application_id : ::String?) : Nil
      # g_application_set_application_id: (Method | Setter)
      # @application_id: (nullable)
      # Returns: (transfer none)

      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      LibGio.g_application_set_application_id(self, application_id)
    end

    def set_default : Nil
      # g_application_set_default: (Method)
      # Returns: (transfer none)

      LibGio.g_application_set_default(self)
    end

    def flags=(flags : Gio::ApplicationFlags) : Nil
      # g_application_set_flags: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_application_set_flags(self, flags)
    end

    def inactivity_timeout=(inactivity_timeout : UInt32) : Nil
      # g_application_set_inactivity_timeout: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_application_set_inactivity_timeout(self, inactivity_timeout)
    end

    def option_context_description=(description : ::String?) : Nil
      # g_application_set_option_context_description: (Method)
      # @description: (nullable)
      # Returns: (transfer none)

      description = if description.nil?
                      Pointer(LibC::Char).null
                    else
                      description.to_unsafe
                    end

      LibGio.g_application_set_option_context_description(self, description)
    end

    def option_context_parameter_string=(parameter_string : ::String?) : Nil
      # g_application_set_option_context_parameter_string: (Method)
      # @parameter_string: (nullable)
      # Returns: (transfer none)

      parameter_string = if parameter_string.nil?
                           Pointer(LibC::Char).null
                         else
                           parameter_string.to_unsafe
                         end

      LibGio.g_application_set_option_context_parameter_string(self, parameter_string)
    end

    def option_context_summary=(summary : ::String?) : Nil
      # g_application_set_option_context_summary: (Method)
      # @summary: (nullable)
      # Returns: (transfer none)

      summary = if summary.nil?
                  Pointer(LibC::Char).null
                else
                  summary.to_unsafe
                end

      LibGio.g_application_set_option_context_summary(self, summary)
    end

    def resource_base_path=(resource_path : ::String?) : Nil
      # g_application_set_resource_base_path: (Method | Setter)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      LibGio.g_application_set_resource_base_path(self, resource_path)
    end

    def unbind_busy_property(object : GObject::Object, property : ::String) : Nil
      # g_application_unbind_busy_property: (Method)
      # Returns: (transfer none)

      LibGio.g_application_unbind_busy_property(self, object, property)
    end

    def unmark_busy : Nil
      # g_application_unmark_busy: (Method)
      # Returns: (transfer none)

      LibGio.g_application_unmark_busy(self)
    end

    def withdraw_notification(id : ::String) : Nil
      # g_application_withdraw_notification: (Method)
      # Returns: (transfer none)

      LibGio.g_application_withdraw_notification(self, id)
    end

    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    struct CommandLineSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "command-line::#{@detail}" : "command-line"
      end

      def connect(&block : Proc(Gio::ApplicationCommandLine, Int32))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::ApplicationCommandLine, Int32))
        connect(block)
      end

      def connect(block : Proc(Gio::ApplicationCommandLine, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::ApplicationCommandLine.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::ApplicationCommandLine, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::ApplicationCommandLine, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::ApplicationCommandLine.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::ApplicationCommandLine, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Gio::ApplicationCommandLine, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::ApplicationCommandLine.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Gio::ApplicationCommandLine, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Gio::ApplicationCommandLine, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::ApplicationCommandLine.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Gio::ApplicationCommandLine, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(command_line : Gio::ApplicationCommandLine) : Nil
        LibGObject.g_signal_emit_by_name(@source, "command-line", command_line)
      end
    end

    def command_line_signal
      CommandLineSignal.new(self)
    end

    struct HandleLocalOptionsSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "handle-local-options::#{@detail}" : "handle-local-options"
      end

      def connect(&block : Proc(GLib::VariantDict, Int32))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::VariantDict, Int32))
        connect(block)
      end

      def connect(block : Proc(GLib::VariantDict, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::VariantDict.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::VariantDict, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GLib::VariantDict, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GLib::VariantDict.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GLib::VariantDict, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, GLib::VariantDict, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::VariantDict.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, GLib::VariantDict, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, GLib::VariantDict, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::VariantDict.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, GLib::VariantDict, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(options : GLib::VariantDict) : Nil
        LibGObject.g_signal_emit_by_name(@source, "handle-local-options", options)
      end
    end

    def handle_local_options_signal
      HandleLocalOptionsSignal.new(self)
    end

    struct NameLostSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "name-lost::#{@detail}" : "name-lost"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "name-lost")
      end
    end

    def name_lost_signal
      NameLostSignal.new(self)
    end

    struct OpenSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "open::#{@detail}" : "open"
      end

      def connect(&block : Proc(Enumerable(Gio::File), Int32, ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Enumerable(Gio::File), Int32, ::String, Nil))
        connect(block)
      end

      def connect(block : Proc(Enumerable(Gio::File), Int32, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = ::String.new(lib_arg2)
          ::Box(Proc(Enumerable(Gio::File), Int32, ::String, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Enumerable(Gio::File), Int32, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = ::String.new(lib_arg2)
          ::Box(Proc(Enumerable(Gio::File), Int32, ::String, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Enumerable(Gio::File), Int32, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = ::String.new(lib_arg2)
          ::Box(Proc(Gio::Application, Enumerable(Gio::File), Int32, ::String, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Enumerable(Gio::File), Int32, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = ::String.new(lib_arg2)
          ::Box(Proc(Gio::Application, Enumerable(Gio::File), Int32, ::String, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(files : Enumerable(Gio::File), n_files : Int32, hint : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "open", files, n_files, hint)
      end
    end

    def open_signal
      OpenSignal.new(self)
    end

    struct ShutdownSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "shutdown::#{@detail}" : "shutdown"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "shutdown")
      end
    end

    def shutdown_signal
      ShutdownSignal.new(self)
    end

    struct StartupSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "startup::#{@detail}" : "startup"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "startup")
      end
    end

    def startup_signal
      StartupSignal.new(self)
    end
  end
end
