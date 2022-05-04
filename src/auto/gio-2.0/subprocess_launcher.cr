require "../g_object-2.0/object"

module Gio
  # This class contains a set of options for launching child processes,
  # such as where its standard input and output will be directed, the
  # argument list, the environment, and more.
  #
  # While the #GSubprocess class has high level functions covering
  # popular cases, use of this class allows access to more advanced
  # options.  It can also be used to launch multiple subprocesses with
  # a similar configuration.
  @[GObject::GeneratedWrapper]
  class SubprocessLauncher < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::SubprocessLauncher), instance_init, 0)
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

    def initialize(*, flags : Gio::SubprocessFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SubprocessLauncher.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_subprocess_launcher_get_type
    end

    def flags=(value : Gio::SubprocessFlags) : Gio::SubprocessFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    # Creates a new #GSubprocessLauncher.
    #
    # The launcher is created with the default options.  A copy of the
    # environment of the calling process is made at the time of this call
    # and will be used as the environment that the process is launched in.
    def initialize(flags : Gio::SubprocessFlags)
      # g_subprocess_launcher_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_subprocess_launcher_new(flags)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Closes all the file descriptors previously passed to the object with
    # g_subprocess_launcher_take_fd(), g_subprocess_launcher_take_stderr_fd(), etc.
    #
    # After calling this method, any subsequent calls to g_subprocess_launcher_spawn() or g_subprocess_launcher_spawnv() will
    # return %G_IO_ERROR_CLOSED. This method is idempotent if
    # called more than once.
    #
    # This function is called automatically when the #GSubprocessLauncher
    # is disposed, but is provided separately so that garbage collected
    # language bindings can call it earlier to guarantee when FDs are closed.
    def close : Nil
      # g_subprocess_launcher_close: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_close(self)

      # Return value handling
    end

    # Returns the value of the environment variable @variable in the
    # environment of processes launched from this launcher.
    #
    # On UNIX, the returned string can be an arbitrary byte string.
    # On Windows, it will be UTF-8.
    def getenv(variable : ::String) : ::Path?
      # g_subprocess_launcher_getenv: (Method)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGio.g_subprocess_launcher_getenv(self, variable)

      # Return value handling

      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    # Sets the current working directory that processes will be launched
    # with.
    #
    # By default processes are launched with the current working directory
    # of the launching process at the time of launch.
    def cwd=(cwd : ::String) : Nil
      # g_subprocess_launcher_set_cwd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_set_cwd(self, cwd)

      # Return value handling
    end

    # Replace the entire environment of processes launched from this
    # launcher with the given 'environ' variable.
    #
    # Typically you will build this variable by using g_listenv() to copy
    # the process 'environ' and using the functions g_environ_setenv(),
    # g_environ_unsetenv(), etc.
    #
    # As an alternative, you can use g_subprocess_launcher_setenv(),
    # g_subprocess_launcher_unsetenv(), etc.
    #
    # Pass an empty array to set an empty environment. Pass %NULL to inherit the
    # parent process’ environment. As of GLib 2.54, the parent process’ environment
    # will be copied when g_subprocess_launcher_set_environ() is called.
    # Previously, it was copied when the subprocess was executed. This means the
    # copied environment may now be modified (using g_subprocess_launcher_setenv(),
    # etc.) before launching the subprocess.
    #
    # On UNIX, all strings in this array can be arbitrary byte strings.
    # On Windows, they should be in UTF-8.
    def environ=(env : Enumerable(::String)) : Nil
      # g_subprocess_launcher_set_environ: (Method)
      # @env: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      env = env.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_subprocess_launcher_set_environ(self, env)

      # Return value handling
    end

    # Sets the flags on the launcher.
    #
    # The default flags are %G_SUBPROCESS_FLAGS_NONE.
    #
    # You may not set flags that specify conflicting options for how to
    # handle a particular stdio stream (eg: specifying both
    # %G_SUBPROCESS_FLAGS_STDIN_PIPE and
    # %G_SUBPROCESS_FLAGS_STDIN_INHERIT).
    #
    # You may also not set a flag that conflicts with a previous call to a
    # function like g_subprocess_launcher_set_stdin_file_path() or
    # g_subprocess_launcher_take_stdout_fd().
    def flags=(flags : Gio::SubprocessFlags) : Nil
      # g_subprocess_launcher_set_flags: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_set_flags(self, flags)

      # Return value handling
    end

    # Sets the file path to use as the stderr for spawned processes.
    #
    # If @path is %NULL then any previously given path is unset.
    #
    # The file will be created or truncated when the process is spawned, as
    # would be the case if using '2>' at the shell.
    #
    # If you want to send both stdout and stderr to the same file then use
    # %G_SUBPROCESS_FLAGS_STDERR_MERGE.
    #
    # You may not set a stderr file path if a stderr fd is already set or
    # if the launcher flags contain any flags directing stderr elsewhere.
    #
    # This feature is only available on UNIX.
    def stderr_file_path=(path : ::String?) : Nil
      # g_subprocess_launcher_set_stderr_file_path: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(LibC::Char).null
             else
               path.to_unsafe
             end

      # C call
      LibGio.g_subprocess_launcher_set_stderr_file_path(self, path)

      # Return value handling
    end

    # Sets the file path to use as the stdin for spawned processes.
    #
    # If @path is %NULL then any previously given path is unset.
    #
    # The file must exist or spawning the process will fail.
    #
    # You may not set a stdin file path if a stdin fd is already set or if
    # the launcher flags contain any flags directing stdin elsewhere.
    #
    # This feature is only available on UNIX.
    def stdin_file_path=(path : ::String) : Nil
      # g_subprocess_launcher_set_stdin_file_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_set_stdin_file_path(self, path)

      # Return value handling
    end

    # Sets the file path to use as the stdout for spawned processes.
    #
    # If @path is %NULL then any previously given path is unset.
    #
    # The file will be created or truncated when the process is spawned, as
    # would be the case if using '>' at the shell.
    #
    # You may not set a stdout file path if a stdout fd is already set or
    # if the launcher flags contain any flags directing stdout elsewhere.
    #
    # This feature is only available on UNIX.
    def stdout_file_path=(path : ::String?) : Nil
      # g_subprocess_launcher_set_stdout_file_path: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(LibC::Char).null
             else
               path.to_unsafe
             end

      # C call
      LibGio.g_subprocess_launcher_set_stdout_file_path(self, path)

      # Return value handling
    end

    # Sets the environment variable @variable in the environment of
    # processes launched from this launcher.
    #
    # On UNIX, both the variable's name and value can be arbitrary byte
    # strings, except that the variable's name cannot contain '='.
    # On Windows, they should be in UTF-8.
    def setenv(variable : ::String, value : ::String, overwrite : Bool) : Nil
      # g_subprocess_launcher_setenv: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_setenv(self, variable, value, overwrite)

      # Return value handling
    end

    # Creates a #GSubprocess given a provided array of arguments.
    def spawnv(argv : Enumerable(::String)) : Gio::Subprocess
      # g_subprocess_launcher_spawnv: (Method | Throws)
      # @argv: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      argv = argv.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_subprocess_launcher_spawnv(self, argv, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Subprocess.new(_retval, GICrystal::Transfer::Full)
    end

    def spawnv(*argv : ::String)
      spawnv(argv)
    end

    # Transfer an arbitrary file descriptor from parent process to the
    # child.  This function takes ownership of the @source_fd; it will be closed
    # in the parent when @self is freed.
    #
    # By default, all file descriptors from the parent will be closed.
    # This function allows you to create (for example) a custom `pipe()` or
    # `socketpair()` before launching the process, and choose the target
    # descriptor in the child.
    #
    # An example use case is GNUPG, which has a command line argument
    # `--passphrase-fd` providing a file descriptor number where it expects
    # the passphrase to be written.
    def take_fd(source_fd : Int32, target_fd : Int32) : Nil
      # g_subprocess_launcher_take_fd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_take_fd(self, source_fd, target_fd)

      # Return value handling
    end

    # Sets the file descriptor to use as the stderr for spawned processes.
    #
    # If @fd is -1 then any previously given fd is unset.
    #
    # Note that the default behaviour is to pass stderr through to the
    # stderr of the parent process.
    #
    # The passed @fd belongs to the #GSubprocessLauncher.  It will be
    # automatically closed when the launcher is finalized.  The file
    # descriptor will also be closed on the child side when executing the
    # spawned process.
    #
    # You may not set a stderr fd if a stderr file path is already set or
    # if the launcher flags contain any flags directing stderr elsewhere.
    #
    # This feature is only available on UNIX.
    def take_stderr_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stderr_fd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_take_stderr_fd(self, fd)

      # Return value handling
    end

    # Sets the file descriptor to use as the stdin for spawned processes.
    #
    # If @fd is -1 then any previously given fd is unset.
    #
    # Note that if your intention is to have the stdin of the calling
    # process inherited by the child then %G_SUBPROCESS_FLAGS_STDIN_INHERIT
    # is a better way to go about doing that.
    #
    # The passed @fd is noted but will not be touched in the current
    # process.  It is therefore necessary that it be kept open by the
    # caller until the subprocess is spawned.  The file descriptor will
    # also not be explicitly closed on the child side, so it must be marked
    # O_CLOEXEC if that's what you want.
    #
    # You may not set a stdin fd if a stdin file path is already set or if
    # the launcher flags contain any flags directing stdin elsewhere.
    #
    # This feature is only available on UNIX.
    def take_stdin_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stdin_fd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_take_stdin_fd(self, fd)

      # Return value handling
    end

    # Sets the file descriptor to use as the stdout for spawned processes.
    #
    # If @fd is -1 then any previously given fd is unset.
    #
    # Note that the default behaviour is to pass stdout through to the
    # stdout of the parent process.
    #
    # The passed @fd is noted but will not be touched in the current
    # process.  It is therefore necessary that it be kept open by the
    # caller until the subprocess is spawned.  The file descriptor will
    # also not be explicitly closed on the child side, so it must be marked
    # O_CLOEXEC if that's what you want.
    #
    # You may not set a stdout fd if a stdout file path is already set or
    # if the launcher flags contain any flags directing stdout elsewhere.
    #
    # This feature is only available on UNIX.
    def take_stdout_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stdout_fd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_take_stdout_fd(self, fd)

      # Return value handling
    end

    # Removes the environment variable @variable from the environment of
    # processes launched from this launcher.
    #
    # On UNIX, the variable's name can be an arbitrary byte string not
    # containing '='. On Windows, it should be in UTF-8.
    def unsetenv(variable : ::String) : Nil
      # g_subprocess_launcher_unsetenv: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_launcher_unsetenv(self, variable)

      # Return value handling
    end
  end
end
