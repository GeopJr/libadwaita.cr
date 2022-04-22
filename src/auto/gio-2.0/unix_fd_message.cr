require "./socket_control_message"

module Gio
  # This #GSocketControlMessage contains a #GUnixFDList.
  # It may be sent using g_socket_send_message() and received using
  # g_socket_receive_message() over UNIX sockets (ie: sockets in the
  # %G_SOCKET_FAMILY_UNIX family). The file descriptors are copied
  # between processes by the kernel.
  #
  # For an easier way to send and receive file descriptors over
  # stream-oriented UNIX sockets, see g_unix_connection_send_fd() and
  # g_unix_connection_receive_fd().
  #
  # Note that `<gio/gunixfdmessage.h>` belongs to the UNIX-specific GIO
  # interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  @[GObject::GeneratedWrapper]
  class UnixFDMessage < SocketControlMessage
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixFDMessageClass), class_init,
        sizeof(LibGio::UnixFDMessage), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, fd_list : Gio::UnixFDList? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !fd_list.nil?
        (_names.to_unsafe + _n).value = "fd-list".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fd_list)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixFDMessage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_fd_message_get_type
    end

    def fd_list=(value : Gio::UnixFDList?) : Gio::UnixFDList?
      unsafe_value = value

      LibGObject.g_object_set(self, "fd-list", unsafe_value, Pointer(Void).null)
      value
    end

    def fd_list : Gio::UnixFDList?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "fd-list", pointerof(value), Pointer(Void).null)
      Gio::UnixFDList.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new #GUnixFDMessage containing an empty file descriptor
    # list.
    def initialize
      # g_unix_fd_message_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_fd_message_new

      # Return value handling

      @pointer = _retval
    end

    # Creates a new #GUnixFDMessage containing @list.
    def self.new_with_fd_list(fd_list : Gio::UnixFDList) : self
      # g_unix_fd_message_new_with_fd_list: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_fd_message_new_with_fd_list(fd_list)

      # Return value handling

      Gio::UnixFDMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a file descriptor to @message.
    #
    # The file descriptor is duplicated using dup(). You keep your copy
    # of the descriptor and the copy contained in @message will be closed
    # when @message is finalized.
    #
    # A possible cause of failure is exceeding the per-process or
    # system-wide file descriptor limit.
    def append_fd(fd : Int32) : Bool
      # g_unix_fd_message_append_fd: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_unix_fd_message_append_fd(self, fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the #GUnixFDList contained in @message.  This function does not
    # return a reference to the caller, but the returned list is valid for
    # the lifetime of @message.
    def fd_list : Gio::UnixFDList
      # g_unix_fd_message_get_fd_list: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_fd_message_get_fd_list(self)

      # Return value handling

      Gio::UnixFDList.new(_retval, GICrystal::Transfer::None)
    end
  end
end
