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
  @[GObject::GeneratedWrapper]
  class UnixFDList < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixFDListClass), class_init,
        sizeof(LibGio::UnixFDList), instance_init, 0)
    end

    GICrystal.define_new_method(UnixFDList, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `UnixFDList`.
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
      LibGio.g_unix_fd_list_get_type
    end

    # Creates a new #GUnixFDList containing no file descriptors.
    def initialize
      # g_unix_fd_list_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_fd_list_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new #GUnixFDList containing the file descriptors given in
    # @fds.  The file descriptors become the property of the new list and
    # may no longer be used by the caller.  The array itself is owned by
    # the caller.
    #
    # Each file descriptor in the array should be set to close-on-exec.
    #
    # If @n_fds is -1 then @fds must be terminated with -1.
    def self.new_from_array(fds : Enumerable(Int32)) : self
      # g_unix_fd_list_new_from_array: (Constructor)
      # @fds: (array length=n_fds element-type Int32)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_fds = fds.size # Generator::ArrayArgPlan
      fds = fds.to_a.to_unsafe

      # C call
      _retval = LibGio.g_unix_fd_list_new_from_array(fds, n_fds)

      # Return value handling

      Gio::UnixFDList.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_array(*fds : Int32)
      self.new_from_array(fds)
    end

    # Adds a file descriptor to @list.
    #
    # The file descriptor is duplicated using dup(). You keep your copy
    # of the descriptor and the copy contained in @list will be closed
    # when @list is finalized.
    #
    # A possible cause of failure is exceeding the per-process or
    # system-wide file descriptor limit.
    #
    # The index of the file descriptor in the list is returned.  If you use
    # this index with g_unix_fd_list_get() then you will receive back a
    # duplicated copy of the same file descriptor.
    def append(fd : Int32) : Int32
      # g_unix_fd_list_append: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_unix_fd_list_append(@pointer, fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Gets a file descriptor out of @list.
    #
    # @index_ specifies the index of the file descriptor to get.  It is a
    # programmer error for @index_ to be out of range; see
    # g_unix_fd_list_get_length().
    #
    # The file descriptor is duplicated using dup() and set as
    # close-on-exec before being returned.  You must call close() on it
    # when you are done.
    #
    # A possible cause of failure is exceeding the per-process or
    # system-wide file descriptor limit.
    def get(index_ : Int32) : Int32
      # g_unix_fd_list_get: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_unix_fd_list_get(@pointer, index_, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Gets the length of @list (ie: the number of file descriptors
    # contained within).
    def length : Int32
      # g_unix_fd_list_get_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_fd_list_get_length(@pointer)

      # Return value handling

      _retval
    end
  end
end
