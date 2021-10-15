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
  # In more complicated cases, the handling of the comandline can be
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
  class ApplicationCommandLine < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, arguments : GLib::Variant? = nil, is_remote : Bool? = nil, options : GLib::Variant? = nil, platform_data : GLib::Variant? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if arguments
        (_names.to_unsafe + _n).value = "arguments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, arguments)
        _n += 1
      end
      if is_remote
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if options
        (_names.to_unsafe + _n).value = "options".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, options)
        _n += 1
      end
      if platform_data
        (_names.to_unsafe + _n).value = "platform-data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, platform_data)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ApplicationCommandLine.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_command_line_get_type
    end

    def arguments=(value : Variant?) : Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "arguments", unsafe_value, Pointer(Void).null)
      value
    end

    def options=(value : Variant?) : Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "options", unsafe_value, Pointer(Void).null)
      value
    end

    def platform_data=(value : Variant?) : Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "platform-data", unsafe_value, Pointer(Void).null)
      value
    end

    def create_file_for_arg(arg : ::String) : Gio::File
      # g_application_command_line_create_file_for_arg: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_application_command_line_create_file_for_arg(self, arg)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def arguments : Enumerable(::String)
      # g_application_command_line_get_arguments: (Method)
      # @argc: (out) (transfer full) (optional)
      # Returns: (transfer full)

      argc = Pointer(Int32).null

      _retval = LibGio.g_application_command_line_get_arguments(self, argc)
      _retval
    end

    def cwd : ::Path?
      # g_application_command_line_get_cwd: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_application_command_line_get_cwd(self)
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def environ : Enumerable(::String)
      # g_application_command_line_get_environ: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_command_line_get_environ(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def exit_status : Int32
      # g_application_command_line_get_exit_status: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_command_line_get_exit_status(self)
      _retval
    end

    def is_remote? : Bool
      # g_application_command_line_get_is_remote: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_application_command_line_get_is_remote(self)
      GICrystal.to_bool(_retval)
    end

    def options_dict : GLib::VariantDict
      # g_application_command_line_get_options_dict: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_command_line_get_options_dict(self)
      GLib::VariantDict.new(_retval, GICrystal::Transfer::None)
    end

    def platform_data : GLib::Variant?
      # g_application_command_line_get_platform_data: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_application_command_line_get_platform_data(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def stdin : Gio::InputStream?
      # g_application_command_line_get_stdin: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_application_command_line_get_stdin(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def getenv(name : ::String) : ::String?
      # g_application_command_line_getenv: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_application_command_line_getenv(self, name)
      ::String.new(_retval) unless _retval.null?
    end

    def exit_status=(exit_status : Int32) : Nil
      # g_application_command_line_set_exit_status: (Method)
      # Returns: (transfer none)

      LibGio.g_application_command_line_set_exit_status(self, exit_status)
    end
  end
end
