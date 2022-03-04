require "../g_object-2.0/object"

module Gio
  # A #GUnixFDList contains a list of file descriptors.  It owns the file
  # descriptors that it contains, closing them when finalized.
  #
  # It may be wrapped in a #GUnixFDMessage and sent over a #GSocket in
  # the %G_SOCKET_FAMILY_UNIX family by using g_socket_send_message()
  # and received using g_socket_receive_message().
  #
  # Note that `<gio/gunixfdlist.h>` belongs to the UNIX-specific GIO
  # interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  class UnixFDList < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_fd_list_get_type
    end

    def initialize
      # g_unix_fd_list_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_unix_fd_list_new

      # Return value handling
      @pointer = _retval
    end

    def self.new_from_array(fds : Enumerable(Int32)) : self
      # g_unix_fd_list_new_from_array: (Constructor)
      # @fds: (array length=n_fds element-type Int32)
      # Returns: (transfer full)

      # Handle parameters
      n_fds = fds.size
      fds = fds.to_a.to_unsafe

      # C call
      _retval = LibGio.g_unix_fd_list_new_from_array(fds, n_fds)

      # Return value handling
      Gio::UnixFDList.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_array(*fds : Int32)
      self.new_from_array(fds)
    end

    def append(fd : Int32) : Int32
      # g_unix_fd_list_append: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_unix_fd_list_append(self, fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def get(index_ : Int32) : Int32
      # g_unix_fd_list_get: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_unix_fd_list_get(self, index_, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def length : Int32
      # g_unix_fd_list_get_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_unix_fd_list_get_length(self)

      # Return value handling
      _retval
    end
  end
end
