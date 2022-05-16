require "../g_object-2.0/object"

module Gio
  # #GApplicationCommandLine represents a command-line invocation of
  # an application.  It is created by #GApplication and emitted
  # in the #GApplication::command-line signal and virtual function.
  #
  # The class contains the list of arguments that the program was invoked
  # with.  It is also possible to query if the commandline invocation was
  # local (ie: the current process is running in direct response to the
  # invocation) or remote (ie: some other process forwarded the
  # commandline to this process).
  #
  # The GApplicationCommandLine object can provide the @argc and @argv
  # parameters for use with the #GOptionContext command-line parsing API,
  # with the g_application_command_line_get_arguments() function. See
  # [gapplication-example-cmdline3.c][gapplication-example-cmdline3]
  # for an example.
  #
  # The exit status of the originally-invoked process may be set and
  # messages can be printed to stdout or stderr of that process.  The
  # lifecycle of the originally-invoked process is tied to the lifecycle
  # of this object (ie: the process exits when the last reference is
  # dropped).
  #
  # The main use for #GApplicationCommandLine (and the
  # #GApplication::command-line signal) is 'Emacs server' like use cases:
  # You can set the `EDITOR` environment variable to have e.g. git use
  # your favourite editor to edit commit messages, and if you already
  # have an instance of the editor running, the editing will happen
  # in the running instance, instead of opening a new one. An important
  # aspect of this use case is that the process that gets started by git
  # does not return until the editing is done.
  #
  # Normally, the commandline is completely handled in the
  # #GApplication::command-line handler. The launching instance exits
  # once the signal handler in the primary instance has returned, and
  # the return value of the signal handler becomes the exit status
  # of the launching instance.
  # |[<!-- language="C" -->
  # static int
  # command_line (GApplication            *application,
  #               GApplicationCommandLine *cmdline)
  # {
  #   gchar **argv;
  #   gint argc;
  #   gint i;
  #
  #   argv = g_application_command_line_get_arguments (cmdline, &argc);
  #
  #   g_application_command_line_print (cmdline,
  #                                     "This text is written back\n"
  #                                     "to stdout of the caller\n");
  #
  #   for (i = 0; i < argc; i++)
  #     g_print ("argument %d: %s\n", i, argv[i]);
  #
  #   g_strfreev (argv);
  #
  #   return 0;
  # }
  # ]|
  # The complete example can be found here:
  # [gapplication-example-cmdline.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline.c)
  #
  # In more complicated cases, the handling of the commandline can be
  # split between the launcher and the primary instance.
  # |[<!-- language="C" -->
  # static gboolean
  #  test_local_cmdline (GApplication   *application,
  #                      gchar        ***arguments,
  #                      gint           *exit_status)
  # {
  #   gint i, j;
  #   gchar **argv;
  #
  #   argv = *arguments;
  #
  #   if (argv[0] == NULL)
  #     {
  #       *exit_status = 0;
  #       return FALSE;
  #     }
  #
  #   i = 1;
  #   while (argv[i])
  #     {
  #       if (g_str_has_prefix (argv[i], "--local-"))
  #         {
  #           g_print ("handling argument %s locally\n", argv[i]);
  #           g_free (argv[i]);
  #           for (j = i; argv[j]; j++)
  #             argv[j] = argv[j + 1];
  #         }
  #       else
  #         {
  #           g_print ("not handling argument %s locally\n", argv[i]);
  #           i++;
  #         }
  #     }
  #
  #   *exit_status = 0;
  #
  #   return FALSE;
  # }
  #
  # static void
  # test_application_class_init (TestApplicationClass *class)
  # {
  #   G_APPLICATION_CLASS (class)->local_command_line = test_local_cmdline;
  #
  #   ...
  # }
  # ]|
  # In this example of split commandline handling, options that start
  # with `--local-` are handled locally, all other options are passed
  # to the #GApplication::command-line handler which runs in the primary
  # instance.
  #
  # The complete example can be found here:
  # [gapplication-example-cmdline2.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c)
  #
  # If handling the commandline requires a lot of work, it may
  # be better to defer it.
  # |[<!-- language="C" -->
  # static gboolean
  # my_cmdline_handler (gpointer data)
  # {
  #   GApplicationCommandLine *cmdline = data;
  #
  #   // do the heavy lifting in an idle
  #
  #   g_application_command_line_set_exit_status (cmdline, 0);
  #   g_object_unref (cmdline); // this releases the application
  #
  #   return G_SOURCE_REMOVE;
  # }
  #
  # static int
  # command_line (GApplication            *application,
  #               GApplicationCommandLine *cmdline)
  # {
  #   // keep the application running until we are done with this commandline
  #   g_application_hold (application);
  #
  #   g_object_set_data_full (G_OBJECT (cmdline),
  #                           "application", application,
  #                           (GDestroyNotify)g_application_release);
  #
  #   g_object_ref (cmdline);
  #   g_idle_add (my_cmdline_handler, cmdline);
  #
  #   return 0;
  # }
  # ]|
  # In this example the commandline is not completely handled before
  # the #GApplication::command-line handler returns. Instead, we keep
  # a reference to the #GApplicationCommandLine object and handle it
  # later (in this example, in an idle). Note that it is necessary to
  # hold the application until you are done with the commandline.
  #
  # The complete example can be found here:
  # [gapplication-example-cmdline3.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline3.c)
  @[GObject::GeneratedWrapper]
  class ApplicationCommandLine < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ApplicationCommandLineClass), class_init,
        sizeof(LibGio::ApplicationCommandLine), instance_init, 0)
    end

    GICrystal.define_new_method(ApplicationCommandLine, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ApplicationCommandLine`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, arguments : GLib::Variant? = nil, is_remote : Bool? = nil, options : GLib::Variant? = nil, platform_data : GLib::Variant? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !arguments.nil?
        (_names.to_unsafe + _n).value = "arguments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, arguments)
        _n += 1
      end
      if !is_remote.nil?
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if !options.nil?
        (_names.to_unsafe + _n).value = "options".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, options)
        _n += 1
      end
      if !platform_data.nil?
        (_names.to_unsafe + _n).value = "platform-data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, platform_data)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ApplicationCommandLine.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_command_line_get_type
    end

    def arguments=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "arguments", unsafe_value, Pointer(Void).null)
      value
    end

    def is_remote? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-remote", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def options=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "options", unsafe_value, Pointer(Void).null)
      value
    end

    def platform_data=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "platform-data", unsafe_value, Pointer(Void).null)
      value
    end

    # Creates a #GFile corresponding to a filename that was given as part
    # of the invocation of @cmdline.
    #
    # This differs from g_file_new_for_commandline_arg() in that it
    # resolves relative pathnames using the current working directory of
    # the invoking process rather than the local process.
    def create_file_for_arg(arg : ::String) : Gio::File
      # g_application_command_line_create_file_for_arg: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_application_command_line_create_file_for_arg(@pointer, arg)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the list of arguments that was passed on the command line.
    #
    # The strings in the array may contain non-UTF-8 data on UNIX (such as
    # filenames or arguments given in the system locale) but are always in
    # UTF-8 on Windows.
    #
    # If you wish to use the return value with #GOptionContext, you must
    # use g_option_context_parse_strv().
    #
    # The return value is %NULL-terminated and should be freed using
    # g_strfreev().
    def arguments : Enumerable(::String)
      # g_application_command_line_get_arguments: (Method)
      # @argc: (out) (transfer full) (optional)
      # Returns: (transfer full) (array length=argc element-type Filename)

      # Generator::OutArgUsedInReturnPlan
      argc = 0
      # C call
      _retval = LibGio.g_application_command_line_get_arguments(@pointer, pointerof(argc))

      # Return value handling

      GICrystal.transfer_array(_retval, argc, GICrystal::Transfer::Full)
    end

    # Gets the working directory of the command line invocation.
    # The string may contain non-utf8 data.
    #
    # It is possible that the remote application did not send a working
    # directory, so this may be %NULL.
    #
    # The return value should not be modified or freed and is valid for as
    # long as @cmdline exists.
    def cwd : ::Path?
      # g_application_command_line_get_cwd: (Method)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGio.g_application_command_line_get_cwd(@pointer)

      # Return value handling

      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    # Gets the contents of the 'environ' variable of the command line
    # invocation, as would be returned by g_get_environ(), ie as a
    # %NULL-terminated list of strings in the form 'NAME=VALUE'.
    # The strings may contain non-utf8 data.
    #
    # The remote application usually does not send an environment.  Use
    # %G_APPLICATION_SEND_ENVIRONMENT to affect that.  Even with this flag
    # set it is possible that the environment is still not available (due
    # to invocation messages from other applications).
    #
    # The return value should not be modified or freed and is valid for as
    # long as @cmdline exists.
    #
    # See g_application_command_line_getenv() if you are only interested
    # in the value of a single environment variable.
    def environ : Enumerable(::String)
      # g_application_command_line_get_environ: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Filename)

      # C call
      _retval = LibGio.g_application_command_line_get_environ(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Gets the exit status of @cmdline.  See
    # g_application_command_line_set_exit_status() for more information.
    def exit_status : Int32
      # g_application_command_line_get_exit_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_command_line_get_exit_status(@pointer)

      # Return value handling

      _retval
    end

    # Determines if @cmdline represents a remote invocation.
    def is_remote : Bool
      # g_application_command_line_get_is_remote: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_command_line_get_is_remote(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the options there were passed to g_application_command_line().
    #
    # If you did not override local_command_line() then these are the same
    # options that were parsed according to the #GOptionEntrys added to the
    # application with g_application_add_main_option_entries() and possibly
    # modified from your GApplication::handle-local-options handler.
    #
    # If no options were sent then an empty dictionary is returned so that
    # you don't need to check for %NULL.
    def options_dict : GLib::VariantDict
      # g_application_command_line_get_options_dict: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_command_line_get_options_dict(@pointer)

      # Return value handling

      GLib::VariantDict.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the platform data associated with the invocation of @cmdline.
    #
    # This is a #GVariant dictionary containing information about the
    # context in which the invocation occurred.  It typically contains
    # information like the current working directory and the startup
    # notification ID.
    #
    # For local invocation, it will be %NULL.
    def platform_data : GLib::Variant?
      # g_application_command_line_get_platform_data: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_application_command_line_get_platform_data(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the stdin of the invoking process.
    #
    # The #GInputStream can be used to read data passed to the standard
    # input of the invoking process.
    # This doesn't work on all platforms.  Presently, it is only available
    # on UNIX when using a D-Bus daemon capable of passing file descriptors.
    # If stdin is not available then %NULL will be returned.  In the
    # future, support may be expanded to other platforms.
    #
    # You must only call this function once per commandline invocation.
    def stdin : Gio::InputStream?
      # g_application_command_line_get_stdin: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_application_command_line_get_stdin(@pointer)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the value of a particular environment variable of the command
    # line invocation, as would be returned by g_getenv().  The strings may
    # contain non-utf8 data.
    #
    # The remote application usually does not send an environment.  Use
    # %G_APPLICATION_SEND_ENVIRONMENT to affect that.  Even with this flag
    # set it is possible that the environment is still not available (due
    # to invocation messages from other applications).
    #
    # The return value should not be modified or freed and is valid for as
    # long as @cmdline exists.
    def getenv(name : ::String) : ::String?
      # g_application_command_line_getenv: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_application_command_line_getenv(@pointer, name)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets the exit status that will be used when the invoking process
    # exits.
    #
    # The return value of the #GApplication::command-line signal is
    # passed to this function when the handler returns.  This is the usual
    # way of setting the exit status.
    #
    # In the event that you want the remote invocation to continue running
    # and want to decide on the exit status in the future, you can use this
    # call.  For the case of a remote invocation, the remote process will
    # typically exit when the last reference is dropped on @cmdline.  The
    # exit status of the remote process will be equal to the last value
    # that was set with this function.
    #
    # In the case that the commandline invocation is local, the situation
    # is slightly more complicated.  If the commandline invocation results
    # in the mainloop running (ie: because the use-count of the application
    # increased to a non-zero value) then the application is considered to
    # have been 'successful' in a certain sense, and the exit status is
    # always zero.  If the application use count is zero, though, the exit
    # status of the local #GApplicationCommandLine is used.
    def exit_status=(exit_status : Int32) : Nil
      # g_application_command_line_set_exit_status: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_application_command_line_set_exit_status(@pointer, exit_status)

      # Return value handling
    end
  end
end
