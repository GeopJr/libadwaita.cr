require "../g_object-2.0/object"
require "./app_info"

module Gio
  # #GDesktopAppInfo is an implementation of #GAppInfo based on
  # desktop files.
  #
  # Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-specific
  # GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  @[GObject::GeneratedWrapper]
  class DesktopAppInfo < GObject::Object
    include AppInfo

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DesktopAppInfoClass), class_init,
        sizeof(LibGio::DesktopAppInfo), instance_init, 0)
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

    def initialize(*, filename : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !filename.nil?
        (_names.to_unsafe + _n).value = "filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filename)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DesktopAppInfo.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_desktop_app_info_get_type
    end

    def filename=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "filename", unsafe_value, Pointer(Void).null)
      value
    end

    def filename : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "filename", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GDesktopAppInfo based on a desktop file id.
    #
    # A desktop file id is the basename of the desktop file, including the
    # .desktop extension. GIO is looking for a desktop file with this name
    # in the `applications` subdirectories of the XDG
    # data directories (i.e. the directories specified in the `XDG_DATA_HOME`
    # and `XDG_DATA_DIRS` environment variables). GIO also supports the
    # prefix-to-subdirectory mapping that is described in the
    # [Menu Spec](http://standards.freedesktop.org/menu-spec/latest/)
    # (i.e. a desktop id of kde-foo.desktop will match
    # `/usr/share/applications/kde/foo.desktop`).
    def initialize(desktop_id : ::String)
      # g_desktop_app_info_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_new(desktop_id)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id)) unless _retval.null?
    end

    # Creates a new #GDesktopAppInfo.
    def self.new_from_filename(filename : ::String) : self?
      # g_desktop_app_info_new_from_filename: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_new_from_filename(filename)

      # Return value handling

      Gio::DesktopAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new #GDesktopAppInfo.
    def self.new_from_keyfile(key_file : GLib::KeyFile) : self?
      # g_desktop_app_info_new_from_keyfile: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_new_from_keyfile(key_file)

      # Return value handling

      Gio::DesktopAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets all applications that implement @interface.
    #
    # An application implements an interface if that interface is listed in
    # the Implements= line of the desktop file of the application.
    def self.implementations(interface : ::String) : GLib::List
      # g_desktop_app_info_get_implementations: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_get_implementations(interface)

      # Return value handling

      GLib::List(Gio::DesktopAppInfo).new(_retval, GICrystal::Transfer::Full)
    end

    # Searches desktop files for ones that match @search_string.
    #
    # The return value is an array of strvs.  Each strv contains a list of
    # applications that matched @search_string with an equal score.  The
    # outer list is sorted by score so that the first strv contains the
    # best-matching applications, and so on.
    # The algorithm for determining matches is undefined and may change at
    # any time.
    #
    # None of the search results are subjected to the normal validation
    # checks performed by g_desktop_app_info_new() (for example, checking that
    # the executable referenced by a result exists), and so it is possible for
    # g_desktop_app_info_new() to return %NULL when passed an app ID returned by
    # this function. It is expected that calling code will do this when
    # subsequently creating a #GDesktopAppInfo for each result.
    def self.search(search_string : ::String) : Enumerable(Enumerable(::String))
      # g_desktop_app_info_search: (None)
      # Returns: (transfer full) (array zero-terminated=1 element-type Array)

      # C call
      _retval = LibGio.g_desktop_app_info_search(search_string)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Sets the name of the desktop that the application is running in.
    # This is used by g_app_info_should_show() and
    # g_desktop_app_info_get_show_in() to evaluate the
    # `OnlyShowIn` and `NotShowIn`
    # desktop entry fields.
    #
    # Should be called only once; subsequent calls are ignored.
    def self.desktop_env=(desktop_env : ::String) : Nil
      # g_desktop_app_info_set_desktop_env: (None)
      # Returns: (transfer none)

      # C call
      LibGio.g_desktop_app_info_set_desktop_env(desktop_env)

      # Return value handling
    end

    # Gets the user-visible display name of the "additional application
    # action" specified by @action_name.
    #
    # This corresponds to the "Name" key within the keyfile group for the
    # action.
    def action_name(action_name : ::String) : ::String
      # g_desktop_app_info_get_action_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_get_action_name(self, action_name)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Looks up a boolean value in the keyfile backing @info.
    #
    # The @key is looked up in the "Desktop Entry" group.
    def boolean(key : ::String) : Bool
      # g_desktop_app_info_get_boolean: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_boolean(self, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the categories from the desktop file.
    def categories : ::String?
      # g_desktop_app_info_get_categories: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_categories(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # When @info was created from a known filename, return it.  In some
    # situations such as the #GDesktopAppInfo returned from
    # g_desktop_app_info_new_from_keyfile(), this function will return %NULL.
    def filename : ::Path?
      # g_desktop_app_info_get_filename: (Method | Getter)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGio.g_desktop_app_info_get_filename(self)

      # Return value handling

      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    # Gets the generic name from the desktop file.
    def generic_name : ::String?
      # g_desktop_app_info_get_generic_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_generic_name(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # A desktop file is hidden if the Hidden key in it is
    # set to True.
    def is_hidden : Bool
      # g_desktop_app_info_get_is_hidden: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_is_hidden(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the keywords from the desktop file.
    def keywords : Enumerable(::String)
      # g_desktop_app_info_get_keywords: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_desktop_app_info_get_keywords(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Looks up a localized string value in the keyfile backing @info
    # translated to the current locale.
    #
    # The @key is looked up in the "Desktop Entry" group.
    def locale_string(key : ::String) : ::String?
      # g_desktop_app_info_get_locale_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_get_locale_string(self, key)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the value of the NoDisplay key, which helps determine if the
    # application info should be shown in menus. See
    # %G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY and g_app_info_should_show().
    def nodisplay : Bool
      # g_desktop_app_info_get_nodisplay: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_nodisplay(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if the application info should be shown in menus that list available
    # applications for a specific name of the desktop, based on the
    # `OnlyShowIn` and `NotShowIn` keys.
    #
    # @desktop_env should typically be given as %NULL, in which case the
    # `XDG_CURRENT_DESKTOP` environment variable is consulted.  If you want
    # to override the default mechanism then you may specify @desktop_env,
    # but this is not recommended.
    #
    # Note that g_app_info_should_show() for @info will include this check (with
    # %NULL for @desktop_env) as well as additional checks.
    def show_in(desktop_env : ::String?) : Bool
      # g_desktop_app_info_get_show_in: (Method)
      # @desktop_env: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      desktop_env = if desktop_env.nil?
                      Pointer(LibC::Char).null
                    else
                      desktop_env.to_unsafe
                    end

      # C call
      _retval = LibGio.g_desktop_app_info_get_show_in(self, desktop_env)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the StartupWMClass field from @info. This represents the
    # WM_CLASS property of the main window of the application, if launched
    # through @info.
    def startup_wm_class : ::String?
      # g_desktop_app_info_get_startup_wm_class: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_get_startup_wm_class(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Looks up a string value in the keyfile backing @info.
    #
    # The @key is looked up in the "Desktop Entry" group.
    def string(key : ::String) : ::String?
      # g_desktop_app_info_get_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_get_string(self, key)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Looks up a string list value in the keyfile backing @info.
    #
    # The @key is looked up in the "Desktop Entry" group.
    def string_list(key : ::String) : Enumerable(::String)
      # g_desktop_app_info_get_string_list: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full) (array length=length zero-terminated=1 element-type Utf8)

      # Generator::OutArgUsedInReturnPlan
      length = 0_u64
      # C call
      _retval = LibGio.g_desktop_app_info_get_string_list(self, key, pointerof(length))

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Returns whether @key exists in the "Desktop Entry" group
    # of the keyfile backing @info.
    def has_key(key : ::String) : Bool
      # g_desktop_app_info_has_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_desktop_app_info_has_key(self, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Activates the named application action.
    #
    # You may only call this function on action names that were
    # returned from g_desktop_app_info_list_actions().
    #
    # Note that if the main entry of the desktop file indicates that the
    # application supports startup notification, and @launch_context is
    # non-%NULL, then startup notification will be used when activating the
    # action (and as such, invocation of the action on the receiving side
    # must signal the end of startup notification when it is completed).
    # This is the expected behaviour of applications declaring additional
    # actions, as per the desktop file specification.
    #
    # As with g_app_info_launch() there is no way to detect failures that
    # occur while using this function.
    def launch_action(action_name : ::String, launch_context : Gio::AppLaunchContext?) : Nil
      # g_desktop_app_info_launch_action: (Method)
      # @launch_context: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end

      # C call
      LibGio.g_desktop_app_info_launch_action(self, action_name, launch_context)

      # Return value handling
    end

    # This function performs the equivalent of g_app_info_launch_uris(),
    # but is intended primarily for operating system components that
    # launch applications.  Ordinary applications should use
    # g_app_info_launch_uris().
    #
    # If the application is launched via GSpawn, then @spawn_flags, @user_setup
    # and @user_setup_data are used for the call to g_spawn_async().
    # Additionally, @pid_callback (with @pid_callback_data) will be called to
    # inform about the PID of the created process. See g_spawn_async_with_pipes()
    # for information on certain parameter conditions that can enable an
    # optimized posix_spawn() codepath to be used.
    #
    # If application launching occurs via some other mechanism (eg: D-Bus
    # activation) then @spawn_flags, @user_setup, @user_setup_data,
    # @pid_callback and @pid_callback_data are ignored.
    def launch_uris_as_manager(uris : GLib::List, launch_context : Gio::AppLaunchContext?, spawn_flags : GLib::SpawnFlags, user_setup : GLib::SpawnChildSetupFunc?, user_setup_data : Pointer(Void)?, pid_callback : Gio::DesktopAppLaunchCallback?, pid_callback_data : Pointer(Void)?) : Bool
      # g_desktop_app_info_launch_uris_as_manager: (Method | Throws)
      # @launch_context: (nullable)
      # @user_setup: (nullable)
      # @user_setup_data: (nullable)
      # @pid_callback: (nullable)
      # @pid_callback_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end
      # Generator::NullableArrayPlan
      user_setup_data = if user_setup_data.nil?
                          Pointer(Void).null
                        else
                          user_setup_data.to_unsafe
                        end
      # Generator::NullableArrayPlan
      pid_callback_data = if pid_callback_data.nil?
                            Pointer(Void).null
                          else
                            pid_callback_data.to_unsafe
                          end

      # C call
      _retval = LibGio.g_desktop_app_info_launch_uris_as_manager(self, uris, launch_context, spawn_flags, user_setup, user_setup_data, pid_callback, pid_callback_data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Equivalent to g_desktop_app_info_launch_uris_as_manager() but allows
    # you to pass in file descriptors for the stdin, stdout and stderr streams
    # of the launched process.
    #
    # If application launching occurs via some non-spawn mechanism (e.g. D-Bus
    # activation) then @stdin_fd, @stdout_fd and @stderr_fd are ignored.
    def launch_uris_as_manager_with_fds(uris : GLib::List, launch_context : Gio::AppLaunchContext?, spawn_flags : GLib::SpawnFlags, user_setup : GLib::SpawnChildSetupFunc?, user_setup_data : Pointer(Void)?, pid_callback : Gio::DesktopAppLaunchCallback?, pid_callback_data : Pointer(Void)?, stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32) : Bool
      # g_desktop_app_info_launch_uris_as_manager_with_fds: (Method | Throws)
      # @launch_context: (nullable)
      # @user_setup: (nullable)
      # @user_setup_data: (nullable)
      # @pid_callback: (nullable)
      # @pid_callback_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      launch_context = if launch_context.nil?
                         Pointer(Void).null
                       else
                         launch_context.to_unsafe
                       end
      # Generator::NullableArrayPlan
      user_setup_data = if user_setup_data.nil?
                          Pointer(Void).null
                        else
                          user_setup_data.to_unsafe
                        end
      # Generator::NullableArrayPlan
      pid_callback_data = if pid_callback_data.nil?
                            Pointer(Void).null
                          else
                            pid_callback_data.to_unsafe
                          end

      # C call
      _retval = LibGio.g_desktop_app_info_launch_uris_as_manager_with_fds(self, uris, launch_context, spawn_flags, user_setup, user_setup_data, pid_callback, pid_callback_data, stdin_fd, stdout_fd, stderr_fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the list of "additional application actions" supported on the
    # desktop file, as per the desktop file specification.
    #
    # As per the specification, this is the list of actions that are
    # explicitly listed in the "Actions" key of the [Desktop Entry] group.
    def list_actions : Enumerable(::String)
      # g_desktop_app_info_list_actions: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_desktop_app_info_list_actions(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end
  end
end
