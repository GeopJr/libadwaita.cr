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
  class Credentials < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_credentials_get_type
    end

    def initialize
      # g_credentials_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_new

      # Return value handling
      @pointer = _retval
    end

    def unix_pid : Int32
      # g_credentials_get_unix_pid: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_get_unix_pid(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def unix_user : UInt32
      # g_credentials_get_unix_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_get_unix_user(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def is_same_user(other_credentials : Gio::Credentials) : Bool
      # g_credentials_is_same_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_is_same_user(self, other_credentials, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_native(native_type : Gio::CredentialsType, native : Pointer(Void)) : Nil
      # g_credentials_set_native: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_credentials_set_native(self, native_type, native)

      # Return value handling
    end

    def unix_user=(uid : UInt32) : Bool
      # g_credentials_set_unix_user: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_set_unix_user(self, uid, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # g_credentials_to_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_credentials_to_string(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end
  end
end
