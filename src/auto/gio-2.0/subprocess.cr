require "../g_object-2.0/object"
require "./initable"

module Gio
  # #GSubprocess allows the creation of and interaction with child
  # processes.
  #
  # Processes can be communicated with using standard GIO-style APIs (ie:
  # #GInputStream, #GOutputStream).  There are GIO-style APIs to wait for
  # process termination (ie: cancellable and with an asynchronous
  # variant).
  #
  # There is an API to force a process to terminate, as well as a
  # race-free API for sending UNIX signals to a subprocess.
  #
  # One major advantage that GIO brings over the core GLib library is
  # comprehensive API for asynchronous I/O, such
  # g_output_stream_splice_async().  This makes GSubprocess
  # significantly more powerful and flexible than equivalent APIs in
  # some other languages such as the `subprocess.py`
  # included with Python.  For example, using #GSubprocess one could
  # create two child processes, reading standard output from the first,
  # processing it, and writing to the input stream of the second, all
  # without blocking the main loop.
  #
  # A powerful g_subprocess_communicate() API is provided similar to the
  # `communicate()` method of `subprocess.py`. This enables very easy
  # interaction with a subprocess that has been opened with pipes.
  #
  # #GSubprocess defaults to tight control over the file descriptors open
  # in the child process, avoiding dangling-fd issues that are caused by
  # a simple fork()/exec().  The only open file descriptors in the
  # spawned process are ones that were explicitly specified by the
  # #GSubprocess API (unless %G_SUBPROCESS_FLAGS_INHERIT_FDS was
  # specified).
  #
  # #GSubprocess will quickly reap all child processes as they exit,
  # avoiding "zombie processes" remaining around for long periods of
  # time.  g_subprocess_wait() can be used to wait for this to happen,
  # but it will happen even without the call being explicitly made.
  #
  # As a matter of principle, #GSubprocess has no API that accepts
  # shell-style space-separated strings.  It will, however, match the
  # typical shell behaviour of searching the PATH for executables that do
  # not contain a directory separator in their name.
  #
  # #GSubprocess attempts to have a very simple API for most uses (ie:
  # spawning a subprocess with arguments and support for most typical
  # kinds of input and output redirection).  See g_subprocess_new(). The
  # #GSubprocessLauncher API is provided for more complicated cases
  # (advanced types of redirection, environment variable manipulation,
  # change of working directory, child setup functions, etc).
  #
  # A typical use of #GSubprocess will involve calling
  # g_subprocess_new(), followed by g_subprocess_wait_async() or
  # g_subprocess_wait().  After the process exits, the status can be
  # checked using functions such as g_subprocess_get_if_exited() (which
  # are similar to the familiar WIFEXITED-style POSIX macros).
  class Subprocess < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, argv : Enumerable(::String)? = nil, flags : Gio::SubprocessFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if argv
        (_names.to_unsafe + _n).value = "argv".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, argv)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Subprocess.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_subprocess_get_type
    end

    def argv=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "argv", unsafe_value, Pointer(Void).null)
      value
    end

    def flags=(value : SubprocessFlags) : SubprocessFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(argv : Enumerable(::String), flags : Gio::SubprocessFlags)
      # g_subprocess_newv: (Constructor | Throws)
      # @argv: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer full)

      argv = argv.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGio.g_subprocess_newv(argv, flags)
      @pointer = _retval
    end

    def communicate(stdin_buf : GLib::Bytes?, cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_communicate: (Method | Throws)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      stdout_buf = Pointer(Pointer(Void)).null
      stderr_buf = Pointer(Pointer(Void)).null
      stdin_buf = if stdin_buf.nil?
                    Pointer(Void).null
                  else
                    stdin_buf.to_unsafe
                  end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      stdout_buf = if stdout_buf.nil?
                     Pointer(Void).null
                   else
                     stdout_buf.to_unsafe
                   end
      stderr_buf = if stderr_buf.nil?
                     Pointer(Void).null
                   else
                     stderr_buf.to_unsafe
                   end

      _retval = LibGio.g_subprocess_communicate(self, stdin_buf, cancellable, stdout_buf, stderr_buf)
      GICrystal.to_bool(_retval)
    end

    def communicate_async(stdin_buf : GLib::Bytes?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_subprocess_communicate_async: (Method)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      stdin_buf = if stdin_buf.nil?
                    Pointer(Void).null
                  else
                    stdin_buf.to_unsafe
                  end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_subprocess_communicate_async(self, stdin_buf, cancellable, callback, user_data)
    end

    def communicate_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_communicate_finish: (Method | Throws)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      stdout_buf = Pointer(Pointer(Void)).null
      stderr_buf = Pointer(Pointer(Void)).null
      stdout_buf = if stdout_buf.nil?
                     Pointer(Void).null
                   else
                     stdout_buf.to_unsafe
                   end
      stderr_buf = if stderr_buf.nil?
                     Pointer(Void).null
                   else
                     stderr_buf.to_unsafe
                   end

      _retval = LibGio.g_subprocess_communicate_finish(self, result, stdout_buf, stderr_buf)
      GICrystal.to_bool(_retval)
    end

    def communicate_utf8(stdin_buf : ::String?, cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_communicate_utf8: (Method | Throws)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      stdout_buf = Pointer(Pointer(LibC::Char)).null
      stderr_buf = Pointer(Pointer(LibC::Char)).null
      stdin_buf = if stdin_buf.nil?
                    Pointer(LibC::Char).null
                  else
                    stdin_buf.to_unsafe
                  end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      stdout_buf = if stdout_buf.nil?
                     Pointer(LibC::Char).null
                   else
                     stdout_buf.to_unsafe
                   end
      stderr_buf = if stderr_buf.nil?
                     Pointer(LibC::Char).null
                   else
                     stderr_buf.to_unsafe
                   end

      _retval = LibGio.g_subprocess_communicate_utf8(self, stdin_buf, cancellable, stdout_buf, stderr_buf)
      GICrystal.to_bool(_retval)
    end

    def communicate_utf8_async(stdin_buf : ::String?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_subprocess_communicate_utf8_async: (Method)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      stdin_buf = if stdin_buf.nil?
                    Pointer(LibC::Char).null
                  else
                    stdin_buf.to_unsafe
                  end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_subprocess_communicate_utf8_async(self, stdin_buf, cancellable, callback, user_data)
    end

    def communicate_utf8_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_communicate_utf8_finish: (Method | Throws)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      stdout_buf = Pointer(Pointer(LibC::Char)).null
      stderr_buf = Pointer(Pointer(LibC::Char)).null
      stdout_buf = if stdout_buf.nil?
                     Pointer(LibC::Char).null
                   else
                     stdout_buf.to_unsafe
                   end
      stderr_buf = if stderr_buf.nil?
                     Pointer(LibC::Char).null
                   else
                     stderr_buf.to_unsafe
                   end

      _retval = LibGio.g_subprocess_communicate_utf8_finish(self, result, stdout_buf, stderr_buf)
      GICrystal.to_bool(_retval)
    end

    def force_exit : Nil
      # g_subprocess_force_exit: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_force_exit(self)
    end

    def exit_status : Int32
      # g_subprocess_get_exit_status: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_exit_status(self)
      _retval
    end

    def identifier : ::String?
      # g_subprocess_get_identifier: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_identifier(self)
      ::String.new(_retval) unless _retval.null?
    end

    def if_exited? : Bool
      # g_subprocess_get_if_exited: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_if_exited(self)
      GICrystal.to_bool(_retval)
    end

    def if_signaled? : Bool
      # g_subprocess_get_if_signaled: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_if_signaled(self)
      GICrystal.to_bool(_retval)
    end

    def status : Int32
      # g_subprocess_get_status: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_status(self)
      _retval
    end

    def stderr_pipe : Gio::InputStream?
      # g_subprocess_get_stderr_pipe: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_stderr_pipe(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def stdin_pipe : Gio::OutputStream?
      # g_subprocess_get_stdin_pipe: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_stdin_pipe(self)
      Gio::OutputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def stdout_pipe : Gio::InputStream?
      # g_subprocess_get_stdout_pipe: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_stdout_pipe(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def successful? : Bool
      # g_subprocess_get_successful: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_successful(self)
      GICrystal.to_bool(_retval)
    end

    def term_sig : Int32
      # g_subprocess_get_term_sig: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_get_term_sig(self)
      _retval
    end

    def send_signal(signal_num : Int32) : Nil
      # g_subprocess_send_signal: (Method)
      # Returns: (transfer none)

      LibGio.g_subprocess_send_signal(self, signal_num)
    end

    def wait(cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_subprocess_wait(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def wait_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_subprocess_wait_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_subprocess_wait_async(self, cancellable, callback, user_data)
    end

    def wait_check(cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_wait_check: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_subprocess_wait_check(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def wait_check_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_subprocess_wait_check_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_subprocess_wait_check_async(self, cancellable, callback, user_data)
    end

    def wait_check_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_wait_check_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_wait_check_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def wait_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_wait_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_subprocess_wait_finish(self, result)
      GICrystal.to_bool(_retval)
    end
  end
end
