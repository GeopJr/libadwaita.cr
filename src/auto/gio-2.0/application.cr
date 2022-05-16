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
  @[GObject::GeneratedWrapper]
  class Application < GObject::Object
    include ActionGroup
    include ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ApplicationClass), class_init,
        sizeof(LibGio::Application), instance_init, 0)
    end

    GICrystal.define_new_method(Application, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Application`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, application_id : ::String? = nil, flags : Gio::ApplicationFlags? = nil, inactivity_timeout : UInt32? = nil, is_busy : Bool? = nil, is_registered : Bool? = nil, is_remote : Bool? = nil, resource_base_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if !action_group.nil?
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if !application_id.nil?
        (_names.to_unsafe + _n).value = "application-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application_id)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !inactivity_timeout.nil?
        (_names.to_unsafe + _n).value = "inactivity-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inactivity_timeout)
        _n += 1
      end
      if !is_busy.nil?
        (_names.to_unsafe + _n).value = "is-busy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_busy)
        _n += 1
      end
      if !is_registered.nil?
        (_names.to_unsafe + _n).value = "is-registered".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_registered)
        _n += 1
      end
      if !is_remote.nil?
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if !resource_base_path.nil?
        (_names.to_unsafe + _n).value = "resource-base-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_base_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Application.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_get_type
    end

    def action_group=(value : Gio::ActionGroup?) : Gio::ActionGroup?
      unsafe_value = value

      LibGObject.g_object_set(self, "action-group", unsafe_value, Pointer(Void).null)
      value
    end

    def application_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "application-id", unsafe_value, Pointer(Void).null)
      value
    end

    def application_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "application-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def flags=(value : Gio::ApplicationFlags) : Gio::ApplicationFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gio::ApplicationFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gio::ApplicationFlags.new(value)
    end

    def inactivity_timeout=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "inactivity-timeout", unsafe_value, Pointer(Void).null)
      value
    end

    def inactivity_timeout : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "inactivity-timeout", pointerof(value), Pointer(Void).null)
      value
    end

    def is_busy? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-busy", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_registered? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-registered", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_remote? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-remote", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def resource_base_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "resource-base-path", unsafe_value, Pointer(Void).null)
      value
    end

    def resource_base_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "resource-base-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GApplication instance.
    #
    # If non-%NULL, the application id must be valid.  See
    # g_application_id_is_valid().
    #
    # If no application ID is given then some features of #GApplication
    # (most notably application uniqueness) will be disabled.
    def initialize(application_id : ::String?, flags : Gio::ApplicationFlags)
      # g_application_new: (Constructor)
      # @application_id: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      # C call
      _retval = LibGio.g_application_new(application_id, flags)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the default #GApplication instance for this process.
    #
    # Normally there is only one #GApplication per process and it becomes
    # the default when it is created.  You can exercise more control over
    # this by using g_application_set_default().
    #
    # If there is no default application then %NULL is returned.
    def self.default : Gio::Application?
      # g_application_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_default

      # Return value handling

      Gio::Application.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks if @application_id is a valid application identifier.
    #
    # A valid ID is required for calls to g_application_new() and
    # g_application_set_application_id().
    #
    # Application identifiers follow the same format as
    # [D-Bus well-known bus names](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus).
    # For convenience, the restrictions on application identifiers are
    # reproduced here:
    #
    # - Application identifiers are composed of 1 or more elements separated by a
    #   period (`.`) character. All elements must contain at least one character.
    #
    # - Each element must only contain the ASCII characters `[A-Z][a-z][0-9]_-`,
    #   with `-` discouraged in new application identifiers. Each element must not
    #   begin with a digit.
    #
    # - Application identifiers must contain at least one `.` (period) character
    #   (and thus at least two elements).
    #
    # - Application identifiers must not begin with a `.` (period) character.
    #
    # - Application identifiers must not exceed 255 characters.
    #
    # Note that the hyphen (`-`) character is allowed in application identifiers,
    # but is problematic or not allowed in various specifications and APIs that
    # refer to D-Bus, such as
    # [Flatpak application IDs](http://docs.flatpak.org/en/latest/introduction.html#identifiers),
    # the
    # [`DBusActivatable` interface in the Desktop Entry Specification](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#dbus),
    # and the convention that an application's "main" interface and object path
    # resemble its application identifier and bus name. To avoid situations that
    # require special-case handling, it is recommended that new application
    # identifiers consistently replace hyphens with underscores.
    #
    # Like D-Bus interface names, application identifiers should start with the
    # reversed DNS domain name of the author of the interface (in lower-case), and
    # it is conventional for the rest of the application identifier to consist of
    # words run together, with initial capital letters.
    #
    # As with D-Bus interface names, if the author's DNS domain name contains
    # hyphen/minus characters they should be replaced by underscores, and if it
    # contains leading digits they should be escaped by prepending an underscore.
    # For example, if the owner of 7-zip.org used an application identifier for an
    # archiving application, it might be named `org._7_zip.Archiver`.
    def self.id_is_valid(application_id : ::String) : Bool
      # g_application_id_is_valid: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_id_is_valid(application_id)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Activates the application.
    #
    # In essence, this results in the #GApplication::activate signal being
    # emitted in the primary instance.
    #
    # The application must be registered before calling this function.
    def activate : Nil
      # g_application_activate: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_activate(@pointer)

      # Return value handling
    end

    # Add an option to be handled by @application.
    #
    # Calling this function is the equivalent of calling
    # g_application_add_main_option_entries() with a single #GOptionEntry
    # that has its arg_data member set to %NULL.
    #
    # The parsed arguments will be packed into a #GVariantDict which
    # is passed to #GApplication::handle-local-options. If
    # %G_APPLICATION_HANDLES_COMMAND_LINE is set, then it will also
    # be sent to the primary instance. See
    # g_application_add_main_option_entries() for more details.
    #
    # See #GOptionEntry for more documentation of the arguments.
    def add_main_option(long_name : ::String, short_name : Int8, flags : GLib::OptionFlags, arg : GLib::OptionArg, description : ::String, arg_description : ::String?) : Nil
      # g_application_add_main_option: (Method)
      # @arg_description: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      arg_description = if arg_description.nil?
                          Pointer(LibC::Char).null
                        else
                          arg_description.to_unsafe
                        end

      # C call
      LibGio.g_application_add_main_option(@pointer, long_name, short_name, flags, arg, description, arg_description)

      # Return value handling
    end

    # Adds main option entries to be handled by @application.
    #
    # This function is comparable to g_option_context_add_main_entries().
    #
    # After the commandline arguments are parsed, the
    # #GApplication::handle-local-options signal will be emitted.  At this
    # point, the application can inspect the values pointed to by @arg_data
    # in the given #GOptionEntrys.
    #
    # Unlike #GOptionContext, #GApplication supports giving a %NULL
    # @arg_data for a non-callback #GOptionEntry.  This results in the
    # argument in question being packed into a #GVariantDict which is also
    # passed to #GApplication::handle-local-options, where it can be
    # inspected and modified.  If %G_APPLICATION_HANDLES_COMMAND_LINE is
    # set, then the resulting dictionary is sent to the primary instance,
    # where g_application_command_line_get_options_dict() will return it.
    # This "packing" is done according to the type of the argument --
    # booleans for normal flags, strings for strings, bytestrings for
    # filenames, etc.  The packing only occurs if the flag is given (ie: we
    # do not pack a "false" #GVariant in the case that a flag is missing).
    #
    # In general, it is recommended that all commandline arguments are
    # parsed locally.  The options dictionary should then be used to
    # transmit the result of the parsing to the primary instance, where
    # g_variant_dict_lookup() can be used.  For local options, it is
    # possible to either use @arg_data in the usual way, or to consult (and
    # potentially remove) the option from the options dictionary.
    #
    # This function is new in GLib 2.40.  Before then, the only real choice
    # was to send all of the commandline arguments (options and all) to the
    # primary instance for handling.  #GApplication ignored them completely
    # on the local side.  Calling this function "opts in" to the new
    # behaviour, and in particular, means that unrecognised options will be
    # treated as errors.  Unrecognised options have never been ignored when
    # %G_APPLICATION_HANDLES_COMMAND_LINE is unset.
    #
    # If #GApplication::handle-local-options needs to see the list of
    # filenames, then the use of %G_OPTION_REMAINING is recommended.  If
    # @arg_data is %NULL then %G_OPTION_REMAINING can be used as a key into
    # the options dictionary.  If you do use %G_OPTION_REMAINING then you
    # need to handle these arguments for yourself because once they are
    # consumed, they will no longer be visible to the default handling
    # (which treats them as filenames to be opened).
    #
    # It is important to use the proper GVariant format when retrieving
    # the options with g_variant_dict_lookup():
    # - for %G_OPTION_ARG_NONE, use `b`
    # - for %G_OPTION_ARG_STRING, use `&s`
    # - for %G_OPTION_ARG_INT, use `i`
    # - for %G_OPTION_ARG_INT64, use `x`
    # - for %G_OPTION_ARG_DOUBLE, use `d`
    # - for %G_OPTION_ARG_FILENAME, use `^&ay`
    # - for %G_OPTION_ARG_STRING_ARRAY, use `^a&s`
    # - for %G_OPTION_ARG_FILENAME_ARRAY, use `^a&ay`
    def add_main_option_entries(entries : Enumerable(GLib::OptionEntry)) : Nil
      # g_application_add_main_option_entries: (Method)
      # @entries: (array zero-terminated=1 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_application_add_main_option_entries(@pointer, entries)

      # Return value handling
    end

    def add_main_option_entries(*entries : GLib::OptionEntry)
      add_main_option_entries(entries)
    end

    # Adds a #GOptionGroup to the commandline handling of @application.
    #
    # This function is comparable to g_option_context_add_group().
    #
    # Unlike g_application_add_main_option_entries(), this function does
    # not deal with %NULL @arg_data and never transmits options to the
    # primary instance.
    #
    # The reason for that is because, by the time the options arrive at the
    # primary instance, it is typically too late to do anything with them.
    # Taking the GTK option group as an example: GTK will already have been
    # initialised by the time the #GApplication::command-line handler runs.
    # In the case that this is not the first-running instance of the
    # application, the existing instance may already have been running for
    # a very long time.
    #
    # This means that the options from #GOptionGroup are only really usable
    # in the case that the instance of the application being run is the
    # first instance.  Passing options like `--display=` or `--gdk-debug=`
    # on future runs will have no effect on the existing primary instance.
    #
    # Calling this function will cause the options in the supplied option
    # group to be parsed, but it does not cause you to be "opted in" to the
    # new functionality whereby unrecognised options are rejected even if
    # %G_APPLICATION_HANDLES_COMMAND_LINE was given.
    def add_option_group(group : GLib::OptionGroup) : Nil
      # g_application_add_option_group: (Method)
      # @group: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_add_option_group(@pointer, group)

      # Return value handling
    end

    # Marks @application as busy (see g_application_mark_busy()) while
    # @property on @object is %TRUE.
    #
    # The binding holds a reference to @application while it is active, but
    # not to @object. Instead, the binding is destroyed when @object is
    # finalized.
    def bind_busy_property(object : GObject::Object, property : ::String) : Nil
      # g_application_bind_busy_property: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_bind_busy_property(@pointer, object, property)

      # Return value handling
    end

    # Gets the unique identifier for @application.
    def application_id : ::String?
      # g_application_get_application_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_application_id(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the #GDBusConnection being used by the application, or %NULL.
    #
    # If #GApplication is using its D-Bus backend then this function will
    # return the #GDBusConnection being used for uniqueness and
    # communication with the desktop environment and other instances of the
    # application.
    #
    # If #GApplication is not using D-Bus then this function will return
    # %NULL.  This includes the situation where the D-Bus backend would
    # normally be in use but we were unable to connect to the bus.
    #
    # This function must not be called before the application has been
    # registered.  See g_application_get_is_registered().
    def dbus_connection : Gio::DBusConnection?
      # g_application_get_dbus_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_dbus_connection(@pointer)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the D-Bus object path being used by the application, or %NULL.
    #
    # If #GApplication is using its D-Bus backend then this function will
    # return the D-Bus object path that #GApplication is using.  If the
    # application is the primary instance then there is an object published
    # at this path.  If the application is not the primary instance then
    # the result of this function is undefined.
    #
    # If #GApplication is not using D-Bus then this function will return
    # %NULL.  This includes the situation where the D-Bus backend would
    # normally be in use but we were unable to connect to the bus.
    #
    # This function must not be called before the application has been
    # registered.  See g_application_get_is_registered().
    def dbus_object_path : ::String?
      # g_application_get_dbus_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_dbus_object_path(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the flags for @application.
    #
    # See #GApplicationFlags.
    def flags : Gio::ApplicationFlags
      # g_application_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_flags(@pointer)

      # Return value handling

      Gio::ApplicationFlags.new(_retval)
    end

    # Gets the current inactivity timeout for the application.
    #
    # This is the amount of time (in milliseconds) after the last call to
    # g_application_release() before the application stops running.
    def inactivity_timeout : UInt32
      # g_application_get_inactivity_timeout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_inactivity_timeout(@pointer)

      # Return value handling

      _retval
    end

    # Gets the application's current busy state, as set through
    # g_application_mark_busy() or g_application_bind_busy_property().
    def is_busy : Bool
      # g_application_get_is_busy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_is_busy(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if @application is registered.
    #
    # An application is registered if g_application_register() has been
    # successfully called.
    def is_registered : Bool
      # g_application_get_is_registered: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_is_registered(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if @application is remote.
    #
    # If @application is remote then it means that another instance of
    # application already exists (the 'primary' instance).  Calls to
    # perform actions on @application will result in the actions being
    # performed by the primary instance.
    #
    # The value of this property cannot be accessed before
    # g_application_register() has been called.  See
    # g_application_get_is_registered().
    def is_remote : Bool
      # g_application_get_is_remote: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_is_remote(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the resource base path of @application.
    #
    # See g_application_set_resource_base_path() for more information.
    def resource_base_path : ::String?
      # g_application_get_resource_base_path: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_get_resource_base_path(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Increases the use count of @application.
    #
    # Use this function to indicate that the application has a reason to
    # continue to run.  For example, g_application_hold() is called by GTK+
    # when a toplevel window is on the screen.
    #
    # To cancel the hold, call g_application_release().
    def hold : Nil
      # g_application_hold: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_hold(@pointer)

      # Return value handling
    end

    # Increases the busy count of @application.
    #
    # Use this function to indicate that the application is busy, for instance
    # while a long running operation is pending.
    #
    # The busy state will be exposed to other processes, so a session shell will
    # use that information to indicate the state to the user (e.g. with a
    # spinner).
    #
    # To cancel the busy indication, use g_application_unmark_busy().
    #
    # The application must be registered before calling this function.
    def mark_busy : Nil
      # g_application_mark_busy: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_mark_busy(@pointer)

      # Return value handling
    end

    # Opens the given files.
    #
    # In essence, this results in the #GApplication::open signal being emitted
    # in the primary instance.
    #
    # @n_files must be greater than zero.
    #
    # @hint is simply passed through to the ::open signal.  It is
    # intended to be used by applications that have multiple modes for
    # opening files (eg: "view" vs "edit", etc).  Unless you have a need
    # for this functionality, you should use "".
    #
    # The application must be registered before calling this function
    # and it must have the %G_APPLICATION_HANDLES_OPEN flag set.
    def open(files : Enumerable(Gio::File), hint : ::String) : Nil
      # g_application_open: (Method)
      # @files: (array length=n_files element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_files = files.size # Generator::ArrayArgPlan
      files = files.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_application_open(@pointer, files, n_files, hint)

      # Return value handling
    end

    # Immediately quits the application.
    #
    # Upon return to the mainloop, g_application_run() will return,
    # calling only the 'shutdown' function before doing so.
    #
    # The hold count is ignored.
    # Take care if your code has called g_application_hold() on the application and
    # is therefore still expecting it to exist.
    # (Note that you may have called g_application_hold() indirectly, for example
    # through gtk_application_add_window().)
    #
    # The result of calling g_application_run() again after it returns is
    # unspecified.
    def quit : Nil
      # g_application_quit: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_quit(@pointer)

      # Return value handling
    end

    # Attempts registration of the application.
    #
    # This is the point at which the application discovers if it is the
    # primary instance or merely acting as a remote for an already-existing
    # primary instance.  This is implemented by attempting to acquire the
    # application identifier as a unique bus name on the session bus using
    # GDBus.
    #
    # If there is no application ID or if %G_APPLICATION_NON_UNIQUE was
    # given, then this process will always become the primary instance.
    #
    # Due to the internal architecture of GDBus, method calls can be
    # dispatched at any time (even if a main loop is not running).  For
    # this reason, you must ensure that any object paths that you wish to
    # register are registered before calling this function.
    #
    # If the application has already been registered then %TRUE is
    # returned with no work performed.
    #
    # The #GApplication::startup signal is emitted if registration succeeds
    # and @application is the primary instance (including the non-unique
    # case).
    #
    # In the event of an error (such as @cancellable being cancelled, or a
    # failure to connect to the session bus), %FALSE is returned and @error
    # is set appropriately.
    #
    # Note: the return value of this function is not an indicator that this
    # instance is or is not the primary instance of the application.  See
    # g_application_get_is_remote() for that.
    def register(cancellable : Gio::Cancellable?) : Bool
      # g_application_register: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_application_register(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Decrease the use count of @application.
    #
    # When the use count reaches zero, the application will stop running.
    #
    # Never call this function except to cancel the effect of a previous
    # call to g_application_hold().
    def release : Nil
      # g_application_release: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_release(@pointer)

      # Return value handling
    end

    # Runs the application.
    #
    # This function is intended to be run from main() and its return value
    # is intended to be returned by main(). Although you are expected to pass
    # the @argc, @argv parameters from main() to this function, it is possible
    # to pass %NULL if @argv is not available or commandline handling is not
    # required.  Note that on Windows, @argc and @argv are ignored, and
    # g_win32_get_command_line() is called internally (for proper support
    # of Unicode commandline arguments).
    #
    # #GApplication will attempt to parse the commandline arguments.  You
    # can add commandline flags to the list of recognised options by way of
    # g_application_add_main_option_entries().  After this, the
    # #GApplication::handle-local-options signal is emitted, from which the
    # application can inspect the values of its #GOptionEntrys.
    #
    # #GApplication::handle-local-options is a good place to handle options
    # such as `--version`, where an immediate reply from the local process is
    # desired (instead of communicating with an already-running instance).
    # A #GApplication::handle-local-options handler can stop further processing
    # by returning a non-negative value, which then becomes the exit status of
    # the process.
    #
    # What happens next depends on the flags: if
    # %G_APPLICATION_HANDLES_COMMAND_LINE was specified then the remaining
    # commandline arguments are sent to the primary instance, where a
    # #GApplication::command-line signal is emitted.  Otherwise, the
    # remaining commandline arguments are assumed to be a list of files.
    # If there are no files listed, the application is activated via the
    # #GApplication::activate signal.  If there are one or more files, and
    # %G_APPLICATION_HANDLES_OPEN was specified then the files are opened
    # via the #GApplication::open signal.
    #
    # If you are interested in doing more complicated local handling of the
    # commandline then you should implement your own #GApplication subclass
    # and override local_command_line(). In this case, you most likely want
    # to return %TRUE from your local_command_line() implementation to
    # suppress the default handling. See
    # [gapplication-example-cmdline2.c][https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c]
    # for an example.
    #
    # If, after the above is done, the use count of the application is zero
    # then the exit status is returned immediately.  If the use count is
    # non-zero then the default main context is iterated until the use count
    # falls to zero, at which point 0 is returned.
    #
    # If the %G_APPLICATION_IS_SERVICE flag is set, then the service will
    # run for as much as 10 seconds with a use count of zero while waiting
    # for the message that caused the activation to arrive.  After that,
    # if the use count falls to zero the application will exit immediately,
    # except in the case that g_application_set_inactivity_timeout() is in
    # use.
    #
    # This function sets the prgname (g_set_prgname()), if not already set,
    # to the basename of argv[0].
    #
    # Much like g_main_loop_run(), this function will acquire the main context
    # for the duration that the application is running.
    #
    # Since 2.40, applications that are not explicitly flagged as services
    # or launchers (ie: neither %G_APPLICATION_IS_SERVICE or
    # %G_APPLICATION_IS_LAUNCHER are given as flags) will check (from the
    # default handler for local_command_line) if "--gapplication-service"
    # was given in the command line.  If this flag is present then normal
    # commandline processing is interrupted and the
    # %G_APPLICATION_IS_SERVICE flag is set.  This provides a "compromise"
    # solution whereby running an application directly from the commandline
    # will invoke it in the normal way (which can be useful for debugging)
    # while still allowing applications to be D-Bus activated in service
    # mode.  The D-Bus service file should invoke the executable with
    # "--gapplication-service" as the sole commandline argument.  This
    # approach is suitable for use by most graphical applications but
    # should not be used from applications like editors that need precise
    # control over when processes invoked via the commandline will exit and
    # what their exit status will be.
    def run(argv : Enumerable(::String)?) : Int32
      # g_application_run: (Method)
      # @argv: (nullable) (array length=argc element-type Filename)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      argc = argv.try(&.size) || 0 # Generator::NullableArrayPlan
      argv = if argv.nil?
               Pointer(Pointer(LibC::Char)).null
             else
               argv.to_a.map(&.to_unsafe).to_unsafe
             end

      # C call
      _retval = LibGio.g_application_run(@pointer, argc, argv)

      # Return value handling

      _retval
    end

    def run(*argv : ::String)
      run(argv)
    end

    # Sends a notification on behalf of @application to the desktop shell.
    # There is no guarantee that the notification is displayed immediately,
    # or even at all.
    #
    # Notifications may persist after the application exits. It will be
    # D-Bus-activated when the notification or one of its actions is
    # activated.
    #
    # Modifying @notification after this call has no effect. However, the
    # object can be reused for a later call to this function.
    #
    # @id may be any string that uniquely identifies the event for the
    # application. It does not need to be in any special format. For
    # example, "new-message" might be appropriate for a notification about
    # new messages.
    #
    # If a previous notification was sent with the same @id, it will be
    # replaced with @notification and shown again as if it was a new
    # notification. This works even for notifications sent from a previous
    # execution of the application, as long as @id is the same string.
    #
    # @id may be %NULL, but it is impossible to replace or withdraw
    # notifications without an id.
    #
    # If @notification is no longer relevant, it can be withdrawn with
    # g_application_withdraw_notification().
    def send_notification(id : ::String?, notification : Gio::Notification) : Nil
      # g_application_send_notification: (Method)
      # @id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      id = if id.nil?
             Pointer(LibC::Char).null
           else
             id.to_unsafe
           end

      # C call
      LibGio.g_application_send_notification(@pointer, id, notification)

      # Return value handling
    end

    # This used to be how actions were associated with a #GApplication.
    # Now there is #GActionMap for that.
    def action_group=(action_group : Gio::ActionGroup?) : Nil
      # g_application_set_action_group: (Method | Setter)
      # @action_group: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      action_group = if action_group.nil?
                       Pointer(Void).null
                     else
                       action_group.to_unsafe
                     end

      # C call
      LibGio.g_application_set_action_group(@pointer, action_group)

      # Return value handling
    end

    # Sets the unique identifier for @application.
    #
    # The application id can only be modified if @application has not yet
    # been registered.
    #
    # If non-%NULL, the application id must be valid.  See
    # g_application_id_is_valid().
    def application_id=(application_id : ::String?) : Nil
      # g_application_set_application_id: (Method | Setter)
      # @application_id: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      # C call
      LibGio.g_application_set_application_id(@pointer, application_id)

      # Return value handling
    end

    # Sets or unsets the default application for the process, as returned
    # by g_application_get_default().
    #
    # This function does not take its own reference on @application.  If
    # @application is destroyed then the default application will revert
    # back to %NULL.
    def set_default : Nil
      # g_application_set_default: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_set_default(@pointer)

      # Return value handling
    end

    # Sets the flags for @application.
    #
    # The flags can only be modified if @application has not yet been
    # registered.
    #
    # See #GApplicationFlags.
    def flags=(flags : Gio::ApplicationFlags) : Nil
      # g_application_set_flags: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_set_flags(@pointer, flags)

      # Return value handling
    end

    # Sets the current inactivity timeout for the application.
    #
    # This is the amount of time (in milliseconds) after the last call to
    # g_application_release() before the application stops running.
    #
    # This call has no side effects of its own.  The value set here is only
    # used for next time g_application_release() drops the use count to
    # zero.  Any timeouts currently in progress are not impacted.
    def inactivity_timeout=(inactivity_timeout : UInt32) : Nil
      # g_application_set_inactivity_timeout: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_set_inactivity_timeout(@pointer, inactivity_timeout)

      # Return value handling
    end

    # Adds a description to the @application option context.
    #
    # See g_option_context_set_description() for more information.
    def option_context_description=(description : ::String?) : Nil
      # g_application_set_option_context_description: (Method)
      # @description: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      description = if description.nil?
                      Pointer(LibC::Char).null
                    else
                      description.to_unsafe
                    end

      # C call
      LibGio.g_application_set_option_context_description(@pointer, description)

      # Return value handling
    end

    # Sets the parameter string to be used by the commandline handling of @application.
    #
    # This function registers the argument to be passed to g_option_context_new()
    # when the internal #GOptionContext of @application is created.
    #
    # See g_option_context_new() for more information about @parameter_string.
    def option_context_parameter_string=(parameter_string : ::String?) : Nil
      # g_application_set_option_context_parameter_string: (Method)
      # @parameter_string: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      parameter_string = if parameter_string.nil?
                           Pointer(LibC::Char).null
                         else
                           parameter_string.to_unsafe
                         end

      # C call
      LibGio.g_application_set_option_context_parameter_string(@pointer, parameter_string)

      # Return value handling
    end

    # Adds a summary to the @application option context.
    #
    # See g_option_context_set_summary() for more information.
    def option_context_summary=(summary : ::String?) : Nil
      # g_application_set_option_context_summary: (Method)
      # @summary: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      summary = if summary.nil?
                  Pointer(LibC::Char).null
                else
                  summary.to_unsafe
                end

      # C call
      LibGio.g_application_set_option_context_summary(@pointer, summary)

      # Return value handling
    end

    # Sets (or unsets) the base resource path of @application.
    #
    # The path is used to automatically load various [application
    # resources][gresource] such as menu layouts and action descriptions.
    # The various types of resources will be found at fixed names relative
    # to the given base path.
    #
    # By default, the resource base path is determined from the application
    # ID by prefixing '/' and replacing each '.' with '/'.  This is done at
    # the time that the #GApplication object is constructed.  Changes to
    # the application ID after that point will not have an impact on the
    # resource base path.
    #
    # As an example, if the application has an ID of "org.example.app" then
    # the default resource base path will be "/org/example/app".  If this
    # is a #GtkApplication (and you have not manually changed the path)
    # then Gtk will then search for the menus of the application at
    # "/org/example/app/gtk/menus.ui".
    #
    # See #GResource for more information about adding resources to your
    # application.
    #
    # You can disable automatic resource loading functionality by setting
    # the path to %NULL.
    #
    # Changing the resource base path once the application is running is
    # not recommended.  The point at which the resource path is consulted
    # for forming paths for various purposes is unspecified.  When writing
    # a sub-class of #GApplication you should either set the
    # #GApplication:resource-base-path property at construction time, or call
    # this function during the instance initialization. Alternatively, you
    # can call this function in the #GApplicationClass.startup virtual function,
    # before chaining up to the parent implementation.
    def resource_base_path=(resource_path : ::String?) : Nil
      # g_application_set_resource_base_path: (Method | Setter)
      # @resource_path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      resource_path = if resource_path.nil?
                        Pointer(LibC::Char).null
                      else
                        resource_path.to_unsafe
                      end

      # C call
      LibGio.g_application_set_resource_base_path(@pointer, resource_path)

      # Return value handling
    end

    # Destroys a binding between @property and the busy state of
    # @application that was previously created with
    # g_application_bind_busy_property().
    def unbind_busy_property(object : GObject::Object, property : ::String) : Nil
      # g_application_unbind_busy_property: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_unbind_busy_property(@pointer, object, property)

      # Return value handling
    end

    # Decreases the busy count of @application.
    #
    # When the busy count reaches zero, the new state will be propagated
    # to other processes.
    #
    # This function must only be called to cancel the effect of a previous
    # call to g_application_mark_busy().
    def unmark_busy : Nil
      # g_application_unmark_busy: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_unmark_busy(@pointer)

      # Return value handling
    end

    # Withdraws a notification that was sent with
    # g_application_send_notification().
    #
    # This call does nothing if a notification with @id doesn't exist or
    # the notification was never sent.
    #
    # This function works even for notifications sent in previous
    # executions of this application, as long @id is the same as it was for
    # the sent notification.
    #
    # Note that notifications are dismissed when the user clicks on one
    # of the buttons in a notification or triggers its default action, so
    # there is no need to explicitly withdraw the notification in that case.
    def withdraw_notification(id : ::String) : Nil
      # g_application_withdraw_notification: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_withdraw_notification(@pointer, id)

      # Return value handling
    end

    # The ::activate signal is emitted on the primary instance when an
    # activation occurs. See g_application_activate().
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

      def connect(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # The ::command-line signal is emitted on the primary instance when
    # a commandline is not handled locally. See g_application_run() and
    # the #GApplicationCommandLine documentation for more information.
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

      def connect(handler : Proc(Gio::ApplicationCommandLine, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_command_line : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          command_line = Gio::ApplicationCommandLine.new(lib_command_line, :none)
          ::Box(Proc(Gio::ApplicationCommandLine, Int32)).unbox(_lib_box).call(command_line)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::ApplicationCommandLine, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_command_line : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          command_line = Gio::ApplicationCommandLine.new(lib_command_line, :none)
          ::Box(Proc(Gio::ApplicationCommandLine, Int32)).unbox(_lib_box).call(command_line)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Application, Gio::ApplicationCommandLine, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_command_line : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          command_line = Gio::ApplicationCommandLine.new(lib_command_line, :none)
          ::Box(Proc(Gio::Application, Gio::ApplicationCommandLine, Int32)).unbox(_lib_box).call(_sender, command_line)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Gio::ApplicationCommandLine, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_command_line : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          command_line = Gio::ApplicationCommandLine.new(lib_command_line, :none)
          ::Box(Proc(Gio::Application, Gio::ApplicationCommandLine, Int32)).unbox(_lib_box).call(_sender, command_line)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(command_line : Gio::ApplicationCommandLine) : Nil
        LibGObject.g_signal_emit_by_name(@source, "command-line", command_line)
      end
    end

    def command_line_signal
      CommandLineSignal.new(self)
    end

    # The ::handle-local-options signal is emitted on the local instance
    # after the parsing of the commandline options has occurred.
    #
    # You can add options to be recognised during commandline option
    # parsing using g_application_add_main_option_entries() and
    # g_application_add_option_group().
    #
    # Signal handlers can inspect @options (along with values pointed to
    # from the @arg_data of an installed #GOptionEntrys) in order to
    # decide to perform certain actions, including direct local handling
    # (which may be useful for options like --version).
    #
    # In the event that the application is marked
    # %G_APPLICATION_HANDLES_COMMAND_LINE the "normal processing" will
    # send the @options dictionary to the primary instance where it can be
    # read with g_application_command_line_get_options_dict().  The signal
    # handler can modify the dictionary before returning, and the
    # modified dictionary will be sent.
    #
    # In the event that %G_APPLICATION_HANDLES_COMMAND_LINE is not set,
    # "normal processing" will treat the remaining uncollected command
    # line arguments as filenames or URIs.  If there are no arguments,
    # the application is activated by g_application_activate().  One or
    # more arguments results in a call to g_application_open().
    #
    # If you want to handle the local commandline arguments for yourself
    # by converting them to calls to g_application_open() or
    # g_action_group_activate_action() then you must be sure to register
    # the application first.  You should probably not call
    # g_application_activate() for yourself, however: just return -1 and
    # allow the default handler to do it for you.  This will ensure that
    # the `--gapplication-service` switch works properly (i.e. no activation
    # in that case).
    #
    # Note that this signal is emitted from the default implementation of
    # local_command_line().  If you override that function and don't
    # chain up then this signal will never be emitted.
    #
    # You can override local_command_line() if you need more powerful
    # capabilities than what is provided here, but this should not
    # normally be required.
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

      def connect(handler : Proc(GLib::VariantDict, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_options : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          options = GLib::VariantDict.new(lib_options, :none)
          ::Box(Proc(GLib::VariantDict, Int32)).unbox(_lib_box).call(options)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GLib::VariantDict, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_options : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          options = GLib::VariantDict.new(lib_options, :none)
          ::Box(Proc(GLib::VariantDict, Int32)).unbox(_lib_box).call(options)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Application, GLib::VariantDict, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_options : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          options = GLib::VariantDict.new(lib_options, :none)
          ::Box(Proc(Gio::Application, GLib::VariantDict, Int32)).unbox(_lib_box).call(_sender, options)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, GLib::VariantDict, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_options : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          options = GLib::VariantDict.new(lib_options, :none)
          ::Box(Proc(Gio::Application, GLib::VariantDict, Int32)).unbox(_lib_box).call(_sender, options)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(options : GLib::VariantDict) : Nil
        LibGObject.g_signal_emit_by_name(@source, "handle-local-options", options)
      end
    end

    def handle_local_options_signal
      HandleLocalOptionsSignal.new(self)
    end

    # The ::name-lost signal is emitted only on the registered primary instance
    # when a new instance has taken over. This can only happen if the application
    # is using the %G_APPLICATION_ALLOW_REPLACEMENT flag.
    #
    # The default handler for this signal calls g_application_quit().
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

      def connect(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Application, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "name-lost")
      end
    end

    def name_lost_signal
      NameLostSignal.new(self)
    end

    # The ::open signal is emitted on the primary instance when there are
    # files to open. See g_application_open() for more information.
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

      def connect(&block : Proc(Enumerable(Gio::File), ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Enumerable(Gio::File), ::String, Nil))
        connect(block)
      end

      def connect(handler : Proc(Enumerable(Gio::File), ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_files : Pointer(Void), lib_n_files : Int32, lib_hint : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::ArrayLengthArgPlan
          # Generator::ArrayArgPlan
          lib_files = lib_files.as(Pointer(Pointer(Void)))
          files = Array(Gio::File).new(lib_n_files) do |_i|
            Gio::AbstractFile.new((lib_files + _i).value, GICrystal::Transfer::None)
          end
          # Generator::BuiltInTypeArgPlan
          hint = ::String.new(lib_hint)
          ::Box(Proc(Enumerable(Gio::File), ::String, Nil)).unbox(_lib_box).call(files, hint)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Enumerable(Gio::File), ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_files : Pointer(Void), lib_n_files : Int32, lib_hint : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::ArrayLengthArgPlan
          # Generator::ArrayArgPlan
          lib_files = lib_files.as(Pointer(Pointer(Void)))
          files = Array(Gio::File).new(lib_n_files) do |_i|
            Gio::AbstractFile.new((lib_files + _i).value, GICrystal::Transfer::None)
          end
          # Generator::BuiltInTypeArgPlan
          hint = ::String.new(lib_hint)
          ::Box(Proc(Enumerable(Gio::File), ::String, Nil)).unbox(_lib_box).call(files, hint)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Application, Enumerable(Gio::File), ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_files : Pointer(Void), lib_n_files : Int32, lib_hint : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::ArrayLengthArgPlan
          # Generator::ArrayArgPlan
          lib_files = lib_files.as(Pointer(Pointer(Void)))
          files = Array(Gio::File).new(lib_n_files) do |_i|
            Gio::AbstractFile.new((lib_files + _i).value, GICrystal::Transfer::None)
          end
          # Generator::BuiltInTypeArgPlan
          hint = ::String.new(lib_hint)
          ::Box(Proc(Gio::Application, Enumerable(Gio::File), ::String, Nil)).unbox(_lib_box).call(_sender, files, hint)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Enumerable(Gio::File), ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_files : Pointer(Void), lib_n_files : Int32, lib_hint : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::ArrayLengthArgPlan
          # Generator::ArrayArgPlan
          lib_files = lib_files.as(Pointer(Pointer(Void)))
          files = Array(Gio::File).new(lib_n_files) do |_i|
            Gio::AbstractFile.new((lib_files + _i).value, GICrystal::Transfer::None)
          end
          # Generator::BuiltInTypeArgPlan
          hint = ::String.new(lib_hint)
          ::Box(Proc(Gio::Application, Enumerable(Gio::File), ::String, Nil)).unbox(_lib_box).call(_sender, files, hint)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(files : Enumerable(Gio::File), hint : ::String) : Nil
        # Generator::ArrayLengthArgPlan
        n_files = files.size # Generator::ArrayArgPlan
        files = files.to_a.map(&.to_unsafe).to_unsafe

        LibGObject.g_signal_emit_by_name(@source, "open", files, n_files, hint)
      end
    end

    def open_signal
      OpenSignal.new(self)
    end

    # The ::shutdown signal is emitted only on the registered primary instance
    # immediately after the main loop terminates.
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

      def connect(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "shutdown")
      end
    end

    def shutdown_signal
      ShutdownSignal.new(self)
    end

    # The ::startup signal is emitted on the primary instance immediately
    # after registration. See g_application_register().
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

      def connect(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Application, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Application.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Application, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
