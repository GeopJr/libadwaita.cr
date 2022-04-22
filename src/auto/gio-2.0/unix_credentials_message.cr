require "./socket_control_message"

module Gio
  # This #GSocketControlMessage contains a #GCredentials instance.  It
  # may be sent using g_socket_send_message() and received using
  # g_socket_receive_message() over UNIX sockets (ie: sockets in the
  # %G_SOCKET_FAMILY_UNIX family).
  #
  # For an easier way to send and receive credentials over
  # stream-oriented UNIX sockets, see
  # g_unix_connection_send_credentials() and
  # g_unix_connection_receive_credentials(). To receive credentials of
  # a foreign process connected to a socket, use
  # g_socket_get_credentials().
  #
  # Since GLib 2.72, #GUnixCredentialMessage is available on all platforms. It
  # requires underlying system support (such as Windows 10 with `AF_UNIX`) at run
  # time.
  #
  # Before GLib 2.72, `<gio/gunixcredentialsmessage.h>` belonged to the UNIX-specific
  # GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
  # when using it. This is no longer necessary since GLib 2.72.
  @[GObject::GeneratedWrapper]
  class UnixCredentialsMessage < SocketControlMessage
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixCredentialsMessageClass), class_init,
        sizeof(LibGio::UnixCredentialsMessage), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, credentials : Gio::Credentials? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !credentials.nil?
        (_names.to_unsafe + _n).value = "credentials".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, credentials)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixCredentialsMessage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_credentials_message_get_type
    end

    def credentials=(value : Gio::Credentials?) : Gio::Credentials?
      unsafe_value = value

      LibGObject.g_object_set(self, "credentials", unsafe_value, Pointer(Void).null)
      value
    end

    def credentials : Gio::Credentials?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "credentials", pointerof(value), Pointer(Void).null)
      Gio::Credentials.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new #GUnixCredentialsMessage with credentials matching the current processes.
    def initialize
      # g_unix_credentials_message_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_credentials_message_new

      # Return value handling

      @pointer = _retval
    end

    # Creates a new #GUnixCredentialsMessage holding @credentials.
    def self.new_with_credentials(credentials : Gio::Credentials) : self
      # g_unix_credentials_message_new_with_credentials: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_credentials_message_new_with_credentials(credentials)

      # Return value handling

      Gio::UnixCredentialsMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks if passing #GCredentials on a #GSocket is supported on this platform.
    def self.is_supported : Bool
      # g_unix_credentials_message_is_supported: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_credentials_message_is_supported

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the credentials stored in @message.
    def credentials : Gio::Credentials
      # g_unix_credentials_message_get_credentials: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_credentials_message_get_credentials(self)

      # Return value handling

      Gio::Credentials.new(_retval, GICrystal::Transfer::None)
    end
  end
end
