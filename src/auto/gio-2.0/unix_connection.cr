require "./socket_connection"

module Gio
  # This is the subclass of #GSocketConnection that is created
  # for UNIX domain sockets.
  #
  # It contains functions to do some of the UNIX socket specific
  # functionality like passing file descriptors.
  #
  # Since GLib 2.72, #GUnixConnection is available on all platforms. It requires
  # underlying system support (such as Windows 10 with `AF_UNIX`) at run time.
  #
  # Before GLib 2.72, `<gio/gunixconnection.h>` belonged to the UNIX-specific GIO
  # interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file when
  # using it. This is no longer necessary since GLib 2.72.
  @[GObject::GeneratedWrapper]
  class UnixConnection < SocketConnection
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixConnectionClass), class_init,
        sizeof(LibGio::UnixConnection), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !output_stream.nil?
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end
      if !socket.nil?
        (_names.to_unsafe + _n).value = "socket".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, socket)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixConnection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_connection_get_type
    end

    # Receives credentials from the sending end of the connection.  The
    # sending end has to call g_unix_connection_send_credentials() (or
    # similar) for this to work.
    #
    # As well as reading the credentials this also reads (and discards) a
    # single byte from the stream, as this is required for credentials
    # passing to work on some implementations.
    #
    # This method can be expected to be available on the following platforms:
    #
    # - Linux since GLib 2.26
    # - FreeBSD since GLib 2.26
    # - GNU/kFreeBSD since GLib 2.36
    # - Solaris, Illumos and OpenSolaris since GLib 2.40
    # - GNU/Hurd since GLib 2.40
    #
    # Other ways to exchange credentials with a foreign peer includes the
    # #GUnixCredentialsMessage type and g_socket_get_credentials() function.
    def receive_credentials(cancellable : Gio::Cancellable?) : Gio::Credentials
      # g_unix_connection_receive_credentials: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_unix_connection_receive_credentials(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Credentials.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously receive credentials.
    #
    # For more details, see g_unix_connection_receive_credentials() which is
    # the synchronous version of this call.
    #
    # When the operation is finished, @callback will be called. You can then call
    # g_unix_connection_receive_credentials_finish() to get the result of the operation.
    def receive_credentials_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_unix_connection_receive_credentials_async: (Method)
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
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_unix_connection_receive_credentials_async(self, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous receive credentials operation started with
    # g_unix_connection_receive_credentials_async().
    def receive_credentials_finish(result : Gio::AsyncResult) : Gio::Credentials
      # g_unix_connection_receive_credentials_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_unix_connection_receive_credentials_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Credentials.new(_retval, GICrystal::Transfer::Full)
    end

    # Receives a file descriptor from the sending end of the connection.
    # The sending end has to call g_unix_connection_send_fd() for this
    # to work.
    #
    # As well as reading the fd this also reads a single byte from the
    # stream, as this is required for fd passing to work on some
    # implementations.
    def receive_fd(cancellable : Gio::Cancellable?) : Int32
      # g_unix_connection_receive_fd: (Method | Throws)
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
      _retval = LibGio.g_unix_connection_receive_fd(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Passes the credentials of the current user the receiving side
    # of the connection. The receiving end has to call
    # g_unix_connection_receive_credentials() (or similar) to accept the
    # credentials.
    #
    # As well as sending the credentials this also writes a single NUL
    # byte to the stream, as this is required for credentials passing to
    # work on some implementations.
    #
    # This method can be expected to be available on the following platforms:
    #
    # - Linux since GLib 2.26
    # - FreeBSD since GLib 2.26
    # - GNU/kFreeBSD since GLib 2.36
    # - Solaris, Illumos and OpenSolaris since GLib 2.40
    # - GNU/Hurd since GLib 2.40
    #
    # Other ways to exchange credentials with a foreign peer includes the
    # #GUnixCredentialsMessage type and g_socket_get_credentials() function.
    def send_credentials(cancellable : Gio::Cancellable?) : Bool
      # g_unix_connection_send_credentials: (Method | Throws)
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
      _retval = LibGio.g_unix_connection_send_credentials(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously send credentials.
    #
    # For more details, see g_unix_connection_send_credentials() which is
    # the synchronous version of this call.
    #
    # When the operation is finished, @callback will be called. You can then call
    # g_unix_connection_send_credentials_finish() to get the result of the operation.
    def send_credentials_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_unix_connection_send_credentials_async: (Method)
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
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_unix_connection_send_credentials_async(self, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous send credentials operation started with
    # g_unix_connection_send_credentials_async().
    def send_credentials_finish(result : Gio::AsyncResult) : Bool
      # g_unix_connection_send_credentials_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_unix_connection_send_credentials_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Passes a file descriptor to the receiving side of the
    # connection. The receiving end has to call g_unix_connection_receive_fd()
    # to accept the file descriptor.
    #
    # As well as sending the fd this also writes a single byte to the
    # stream, as this is required for fd passing to work on some
    # implementations.
    def send_fd(fd : Int32, cancellable : Gio::Cancellable?) : Bool
      # g_unix_connection_send_fd: (Method | Throws)
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
      _retval = LibGio.g_unix_connection_send_fd(self, fd, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
