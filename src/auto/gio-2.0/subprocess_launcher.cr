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
  class SubprocessLauncher < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, flags : Gio::SubprocessFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SubprocessLauncher.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_subprocess_launcher_get_type
    end

    def flags=(value : SubprocessFlags) : SubprocessFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(flags : Gio::SubprocessFlags)
      # g_subprocess_launcher_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_subprocess_launcher_new(flags)
      @pointer = _retval
    end

    def close : Nil
      # g_subprocess_launcher_close: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_close(self)
    end

    def getenv(variable : ::String) : ::Path?
      # g_subprocess_launcher_getenv: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_subprocess_launcher_getenv(self, variable)
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def cwd=(cwd : ::String) : Nil
      # g_subprocess_launcher_set_cwd: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_set_cwd(self, cwd)
    end

    def environ=(env : Enumerable(::String)) : Nil
      # g_subprocess_launcher_set_environ: (Method)
      # @env: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer none)

      env = env.to_a.map(&.to_unsafe).to_unsafe

      LibGio.g_subprocess_launcher_set_environ(self, env)
    end

    def flags=(flags : Gio::SubprocessFlags) : Nil
      # g_subprocess_launcher_set_flags: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_set_flags(self, flags)
    end

    def stderr_file_path=(path : ::String?) : Nil
      # g_subprocess_launcher_set_stderr_file_path: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(LibC::Char).null
             else
               path.to_unsafe
             end

      LibGio.g_subprocess_launcher_set_stderr_file_path(self, path)
    end

    def stdin_file_path=(path : ::String) : Nil
      # g_subprocess_launcher_set_stdin_file_path: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_set_stdin_file_path(self, path)
    end

    def stdout_file_path=(path : ::String?) : Nil
      # g_subprocess_launcher_set_stdout_file_path: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(LibC::Char).null
             else
               path.to_unsafe
             end

      LibGio.g_subprocess_launcher_set_stdout_file_path(self, path)
    end

    def setenv(variable : ::String, value : ::String, overwrite : Bool) : Nil
      # g_subprocess_launcher_setenv: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_setenv(self, variable, value, overwrite)
    end

    def spawnv(argv : Enumerable(::String)) : Gio::Subprocess
      # g_subprocess_launcher_spawnv: (Method | Throws)
      # @argv: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer full)

      argv = argv.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGio.g_subprocess_launcher_spawnv(self, argv)
      Gio::Subprocess.new(_retval, GICrystal::Transfer::Full)
    end

    def spawnv(*argv : ::String)
      spawnv(argv)
    end

    def take_fd(source_fd : Int32, target_fd : Int32) : Nil
      # g_subprocess_launcher_take_fd: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_take_fd(self, source_fd, target_fd)
    end

    def take_stderr_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stderr_fd: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_take_stderr_fd(self, fd)
    end

    def take_stdin_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stdin_fd: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_take_stdin_fd(self, fd)
    end

    def take_stdout_fd(fd : Int32) : Nil
      # g_subprocess_launcher_take_stdout_fd: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_take_stdout_fd(self, fd)
    end

    def unsetenv(variable : ::String) : Nil
      # g_subprocess_launcher_unsetenv: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_launcher_unsetenv(self, variable)
    end
  end
end
