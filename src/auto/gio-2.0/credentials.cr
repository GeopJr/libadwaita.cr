require "../g_object-2.0/object"

module Gio
  # The #GCredentials type is a reference-counted wrapper for native
  # credentials. This information is typically used for identifying,
  # authenticating and authorizing other processes.
  #
  # Some operating systems supports looking up the credentials of the
  # remote peer of a communication endpoint - see e.g.
  # g_socket_get_credentials().
  #
  # Some operating systems supports securely sending and receiving
  # credentials over a Unix Domain Socket, see
  # #GUnixCredentialsMessage, g_unix_connection_send_credentials() and
  # g_unix_connection_receive_credentials() for details.
  #
  # On Linux, the native credential type is a `struct ucred` - see the
  # unix(7) man page for details. This corresponds to
  # %G_CREDENTIALS_TYPE_LINUX_UCRED.
  #
  # On Apple operating systems (including iOS, tvOS, and macOS),
  # the native credential type is a `struct xucred`.
  # This corresponds to %G_CREDENTIALS_TYPE_APPLE_XUCRED.
  #
  # On FreeBSD, Debian GNU/kFreeBSD, and GNU/Hurd, the native
  # credential type is a `struct cmsgcred`. This corresponds
  # to %G_CREDENTIALS_TYPE_FREEBSD_CMSGCRED.
  #
  # On NetBSD, the native credential type is a `struct unpcbid`.
  # This corresponds to %G_CREDENTIALS_TYPE_NETBSD_UNPCBID.
  #
  # On OpenBSD, the native credential type is a `struct sockpeercred`.
  # This corresponds to %G_CREDENTIALS_TYPE_OPENBSD_SOCKPEERCRED.
  #
  # On Solaris (including OpenSolaris and its derivatives), the native
  # credential type is a `ucred_t`. This corresponds to
  # %G_CREDENTIALS_TYPE_SOLARIS_UCRED.
  #
  # Since GLib 2.72, on Windows, the native credentials may contain the PID of a
  # process. This corresponds to %G_CREDENTIALS_TYPE_WIN32_PID.
  @[GObject::GeneratedWrapper]
  class Credentials < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::CredentialsClass), class_init,
        sizeof(LibGio::Credentials), instance_init, 0)
    end

    GICrystal.define_new_method(Credentials, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Credentials`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_credentials_get_type
    end

    # Tries to get the UNIX process identifier from @credentials. This
    # method is only available on UNIX platforms.
    #
    # This operation can fail if #GCredentials is not supported on the
    # OS or if the native credentials type does not contain information
    # about the UNIX process ID.
    def unix_pid : Int32
      # g_credentials_get_unix_pid: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_credentials_get_unix_pid(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to get the UNIX user identifier from @credentials. This
    # method is only available on UNIX platforms.
    #
    # This operation can fail if #GCredentials is not supported on the
    # OS or if the native credentials type does not contain information
    # about the UNIX user.
    def unix_user : UInt32
      # g_credentials_get_unix_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_credentials_get_unix_user(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Checks if @credentials and @other_credentials is the same user.
    #
    # This operation can fail if #GCredentials is not supported on the
    # the OS.
    def is_same_user(other_credentials : Gio::Credentials) : Bool
      # g_credentials_is_same_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_credentials_is_same_user(@pointer, other_credentials, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Copies the native credentials of type @native_type from @native
    # into @credentials.
    #
    # It is a programming error (which will cause a warning to be
    # logged) to use this method if there is no #GCredentials support for
    # the OS or if @native_type isn't supported by the OS.
    def set_native(native_type : Gio::CredentialsType, native : Pointer(Void)) : Nil
      # g_credentials_set_native: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_credentials_set_native(@pointer, native_type, native)

      # Return value handling
    end

    # Tries to set the UNIX user identifier on @credentials. This method
    # is only available on UNIX platforms.
    #
    # This operation can fail if #GCredentials is not supported on the
    # OS or if the native credentials type does not contain information
    # about the UNIX user. It can also fail if the OS does not allow the
    # use of "spoofed" credentials.
    def unix_user=(uid : UInt32) : Bool
      # g_credentials_set_unix_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_credentials_set_unix_user(@pointer, uid, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a human-readable textual representation of @credentials
    # that can be used in logging and debug messages. The format of the
    # returned string may change in future GLib release.
    def to_string : ::String
      # g_credentials_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_credentials_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end
  end
end
