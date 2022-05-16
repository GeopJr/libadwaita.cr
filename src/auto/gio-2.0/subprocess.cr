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
  # not contain a directory separator in their name. By default, the `PATH`
  # of the current process is used.  You can specify
  # %G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP to use the `PATH` of the
  # launcher environment instead.
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
  @[GObject::GeneratedWrapper]
  class Subprocess < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::Subprocess), instance_init, 0)
    end

    GICrystal.define_new_method(Subprocess, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Subprocess`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, argv : Enumerable(::String)? = nil, flags : Gio::SubprocessFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !argv.nil?
        (_names.to_unsafe + _n).value = "argv".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, argv)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Subprocess.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    def flags=(value : Gio::SubprocessFlags) : Gio::SubprocessFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    # Create a new process with the given flags and varargs argument
    # list.  By default, matching the g_spawn_async() defaults, the
    # child's stdin will be set to the system null device, and
    # stdout/stderr will be inherited from the parent.  You can use
    # @flags to control this behavior.
    #
    # The argument list must be terminated with %NULL.
    def initialize(argv : Enumerable(::String), flags : Gio::SubprocessFlags)
      # g_subprocess_newv: (Constructor | Throws)
      # @argv: (array zero-terminated=1 element-type Filename)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayArgPlan
      argv = argv.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_subprocess_newv(argv, flags, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Communicate with the subprocess until it terminates, and all input
    # and output has been completed.
    #
    # If @stdin_buf is given, the subprocess must have been created with
    # %G_SUBPROCESS_FLAGS_STDIN_PIPE.  The given data is fed to the
    # stdin of the subprocess and the pipe is closed (ie: EOF).
    #
    # At the same time (as not to cause blocking when dealing with large
    # amounts of data), if %G_SUBPROCESS_FLAGS_STDOUT_PIPE or
    # %G_SUBPROCESS_FLAGS_STDERR_PIPE were used, reads from those
    # streams.  The data that was read is returned in @stdout and/or
    # the @stderr.
    #
    # If the subprocess was created with %G_SUBPROCESS_FLAGS_STDOUT_PIPE,
    # @stdout_buf will contain the data read from stdout.  Otherwise, for
    # subprocesses not created with %G_SUBPROCESS_FLAGS_STDOUT_PIPE,
    # @stdout_buf will be set to %NULL.  Similar provisions apply to
    # @stderr_buf and %G_SUBPROCESS_FLAGS_STDERR_PIPE.
    #
    # As usual, any output variable may be given as %NULL to ignore it.
    #
    # If you desire the stdout and stderr data to be interleaved, create
    # the subprocess with %G_SUBPROCESS_FLAGS_STDOUT_PIPE and
    # %G_SUBPROCESS_FLAGS_STDERR_MERGE.  The merged result will be returned
    # in @stdout_buf and @stderr_buf will be set to %NULL.
    #
    # In case of any error (including cancellation), %FALSE will be
    # returned with @error set.  Some or all of the stdin data may have
    # been written.  Any stdout or stderr data that has been read will be
    # discarded. None of the out variables (aside from @error) will have
    # been set to anything in particular and should not be inspected.
    #
    # In the case that %TRUE is returned, the subprocess has exited and the
    # exit status inspection APIs (eg: g_subprocess_get_if_exited(),
    # g_subprocess_get_exit_status()) may be used.
    #
    # You should not attempt to use any of the subprocess pipes after
    # starting this function, since they may be left in strange states,
    # even if the operation was cancelled.  You should especially not
    # attempt to interact with the pipes while the operation is in progress
    # (either from another thread or if using the asynchronous version).
    def communicate(stdin_buf : GLib::Bytes?, cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_communicate: (Method | Throws)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      stdin_buf = if stdin_buf.nil?
                    Pointer(Void).null
                  else
                    stdin_buf.to_unsafe
                  end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::OutArgUsedInReturnPlan
      stdout_buf = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      stderr_buf = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_subprocess_communicate(@pointer, stdin_buf, cancellable, stdout_buf, stderr_buf, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronous version of g_subprocess_communicate().  Complete
    # invocation with g_subprocess_communicate_finish().
    def communicate_async(stdin_buf : GLib::Bytes?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_subprocess_communicate_async: (Method)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      stdin_buf = if stdin_buf.nil?
                    Pointer(Void).null
                  else
                    stdin_buf.to_unsafe
                  end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_subprocess_communicate_async(@pointer, stdin_buf, cancellable, callback, user_data)

      # Return value handling
    end

    # Complete an invocation of g_subprocess_communicate_async().
    def communicate_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_communicate_finish: (Method | Throws)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      stdout_buf = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      stderr_buf = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_subprocess_communicate_finish(@pointer, result, stdout_buf, stderr_buf, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Like g_subprocess_communicate(), but validates the output of the
    # process as UTF-8, and returns it as a regular NUL terminated string.
    #
    # On error, @stdout_buf and @stderr_buf will be set to undefined values and
    # should not be used.
    def communicate_utf8(stdin_buf : ::String?, cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_communicate_utf8: (Method | Throws)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      stdin_buf = if stdin_buf.nil?
                    Pointer(LibC::Char).null
                  else
                    stdin_buf.to_unsafe
                  end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::OutArgUsedInReturnPlan
      stdout_buf = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
      stderr_buf = Pointer(Pointer(LibC::Char)).null
      # C call
      _retval = LibGio.g_subprocess_communicate_utf8(@pointer, stdin_buf, cancellable, stdout_buf, stderr_buf, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronous version of g_subprocess_communicate_utf8().  Complete
    # invocation with g_subprocess_communicate_utf8_finish().
    def communicate_utf8_async(stdin_buf : ::String?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_subprocess_communicate_utf8_async: (Method)
      # @stdin_buf: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      stdin_buf = if stdin_buf.nil?
                    Pointer(LibC::Char).null
                  else
                    stdin_buf.to_unsafe
                  end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_subprocess_communicate_utf8_async(@pointer, stdin_buf, cancellable, callback, user_data)

      # Return value handling
    end

    # Complete an invocation of g_subprocess_communicate_utf8_async().
    def communicate_utf8_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_communicate_utf8_finish: (Method | Throws)
      # @stdout_buf: (out) (transfer full) (nullable) (optional)
      # @stderr_buf: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      stdout_buf = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
      stderr_buf = Pointer(Pointer(LibC::Char)).null
      # C call
      _retval = LibGio.g_subprocess_communicate_utf8_finish(@pointer, result, stdout_buf, stderr_buf, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Use an operating-system specific method to attempt an immediate,
    # forceful termination of the process.  There is no mechanism to
    # determine whether or not the request itself was successful;
    # however, you can use g_subprocess_wait() to monitor the status of
    # the process after calling this function.
    #
    # On Unix, this function sends %SIGKILL.
    def force_exit : Nil
      # g_subprocess_force_exit: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_force_exit(@pointer)

      # Return value handling
    end

    # Check the exit status of the subprocess, given that it exited
    # normally.  This is the value passed to the exit() system call or the
    # return value from main.
    #
    # This is equivalent to the system WEXITSTATUS macro.
    #
    # It is an error to call this function before g_subprocess_wait() and
    # unless g_subprocess_get_if_exited() returned %TRUE.
    def exit_status : Int32
      # g_subprocess_get_exit_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_exit_status(@pointer)

      # Return value handling

      _retval
    end

    # On UNIX, returns the process ID as a decimal string.
    # On Windows, returns the result of GetProcessId() also as a string.
    # If the subprocess has terminated, this will return %NULL.
    def identifier : ::String?
      # g_subprocess_get_identifier: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_identifier(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Check if the given subprocess exited normally (ie: by way of exit()
    # or return from main()).
    #
    # This is equivalent to the system WIFEXITED macro.
    #
    # It is an error to call this function before g_subprocess_wait() has
    # returned.
    def if_exited : Bool
      # g_subprocess_get_if_exited: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_if_exited(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Check if the given subprocess terminated in response to a signal.
    #
    # This is equivalent to the system WIFSIGNALED macro.
    #
    # It is an error to call this function before g_subprocess_wait() has
    # returned.
    def if_signaled : Bool
      # g_subprocess_get_if_signaled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_if_signaled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the raw status code of the process, as from waitpid().
    #
    # This value has no particular meaning, but it can be used with the
    # macros defined by the system headers such as WIFEXITED.  It can also
    # be used with g_spawn_check_wait_status().
    #
    # It is more likely that you want to use g_subprocess_get_if_exited()
    # followed by g_subprocess_get_exit_status().
    #
    # It is an error to call this function before g_subprocess_wait() has
    # returned.
    def status : Int32
      # g_subprocess_get_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_status(@pointer)

      # Return value handling

      _retval
    end

    # Gets the #GInputStream from which to read the stderr output of
    # @subprocess.
    #
    # The process must have been created with %G_SUBPROCESS_FLAGS_STDERR_PIPE,
    # otherwise %NULL will be returned.
    def stderr_pipe : Gio::InputStream?
      # g_subprocess_get_stderr_pipe: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_stderr_pipe(@pointer)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the #GOutputStream that you can write to in order to give data
    # to the stdin of @subprocess.
    #
    # The process must have been created with %G_SUBPROCESS_FLAGS_STDIN_PIPE and
    # not %G_SUBPROCESS_FLAGS_STDIN_INHERIT, otherwise %NULL will be returned.
    def stdin_pipe : Gio::OutputStream?
      # g_subprocess_get_stdin_pipe: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_stdin_pipe(@pointer)

      # Return value handling

      Gio::OutputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the #GInputStream from which to read the stdout output of
    # @subprocess.
    #
    # The process must have been created with %G_SUBPROCESS_FLAGS_STDOUT_PIPE,
    # otherwise %NULL will be returned.
    def stdout_pipe : Gio::InputStream?
      # g_subprocess_get_stdout_pipe: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_stdout_pipe(@pointer)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks if the process was "successful".  A process is considered
    # successful if it exited cleanly with an exit status of 0, either by
    # way of the exit() system call or return from main().
    #
    # It is an error to call this function before g_subprocess_wait() has
    # returned.
    def successful : Bool
      # g_subprocess_get_successful: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_successful(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Get the signal number that caused the subprocess to terminate, given
    # that it terminated due to a signal.
    #
    # This is equivalent to the system WTERMSIG macro.
    #
    # It is an error to call this function before g_subprocess_wait() and
    # unless g_subprocess_get_if_signaled() returned %TRUE.
    def term_sig : Int32
      # g_subprocess_get_term_sig: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_subprocess_get_term_sig(@pointer)

      # Return value handling

      _retval
    end

    # Sends the UNIX signal @signal_num to the subprocess, if it is still
    # running.
    #
    # This API is race-free.  If the subprocess has terminated, it will not
    # be signalled.
    #
    # This API is not available on Windows.
    def send_signal(signal_num : Int32) : Nil
      # g_subprocess_send_signal: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_subprocess_send_signal(@pointer, signal_num)

      # Return value handling
    end

    # Synchronously wait for the subprocess to terminate.
    #
    # After the process terminates you can query its exit status with
    # functions such as g_subprocess_get_if_exited() and
    # g_subprocess_get_exit_status().
    #
    # This function does not fail in the case of the subprocess having
    # abnormal termination.  See g_subprocess_wait_check() for that.
    #
    # Cancelling @cancellable doesn't kill the subprocess.  Call
    # g_subprocess_force_exit() if it is desirable.
    def wait(cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_wait: (Method | Throws)
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
      _retval = LibGio.g_subprocess_wait(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Wait for the subprocess to terminate.
    #
    # This is the asynchronous version of g_subprocess_wait().
    def wait_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_subprocess_wait_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_subprocess_wait_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Combines g_subprocess_wait() with g_spawn_check_wait_status().
    def wait_check(cancellable : Gio::Cancellable?) : Bool
      # g_subprocess_wait_check: (Method | Throws)
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
      _retval = LibGio.g_subprocess_wait_check(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Combines g_subprocess_wait_async() with g_spawn_check_wait_status().
    #
    # This is the asynchronous version of g_subprocess_wait_check().
    def wait_check_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_subprocess_wait_check_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_subprocess_wait_check_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Collects the result of a previous call to
    # g_subprocess_wait_check_async().
    def wait_check_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_wait_check_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_subprocess_wait_check_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Collects the result of a previous call to
    # g_subprocess_wait_async().
    def wait_finish(result : Gio::AsyncResult) : Bool
      # g_subprocess_wait_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_subprocess_wait_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
