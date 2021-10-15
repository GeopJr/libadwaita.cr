require "./output_stream"
require "./file_descriptor_based"

require "./pollable_output_stream"

module Gio
  # #GUnixOutputStream implements #GOutputStream for writing to a UNIX
  # file descriptor, including asynchronous operations. (If the file
  # descriptor refers to a socket or pipe, this will use poll() to do
  # asynchronous I/O. If it refers to a regular file, it will fall back
  # to doing asynchronous I/O in another thread.)
  #
  # Note that `<gio/gunixoutputstream.h>` belongs to the UNIX-specific GIO
  # interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
  # when using it.
  class UnixOutputStream < OutputStream
    include FileDescriptorBased
    include PollableOutputStream

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, close_fd : Bool? = nil, fd : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if close_fd
        (_names.to_unsafe + _n).value = "close-fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_fd)
        _n += 1
      end
      if fd
        (_names.to_unsafe + _n).value = "fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fd)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixOutputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_output_stream_get_type
    end

    def fd=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "fd", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(fd : Int32, close_fd : Bool)
      # g_unix_output_stream_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_unix_output_stream_new(fd, close_fd)
      @pointer = _retval
    end

    def close_fd? : Bool
      # g_unix_output_stream_get_close_fd: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_output_stream_get_close_fd(self)
      GICrystal.to_bool(_retval)
    end

    def fd : Int32
      # g_unix_output_stream_get_fd: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_unix_output_stream_get_fd(self)
      _retval
    end

    def close_fd=(close_fd : Bool) : Nil
      # g_unix_output_stream_set_close_fd: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_unix_output_stream_set_close_fd(self, close_fd)
    end
  end
end
