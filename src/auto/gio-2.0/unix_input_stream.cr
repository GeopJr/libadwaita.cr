require "./input_stream"
require "./file_descriptor_based"

require "./pollable_input_stream"

module Gio
  # #GUnixInputStream implements #GInputStream for reading from a UNIX
  # file descriptor, including asynchronous operations. (If the file
  # descriptor refers to a socket or pipe, this will use poll() to do
  # asynchronous I/O. If it refers to a regular file, it will fall back
  # to doing asynchronous I/O in another thread.)
  #
  # Note that `<gio/gunixinputstream.h>` belongs to the UNIX-specific GIO
  # interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  @[GObject::GeneratedWrapper]
  class UnixInputStream < InputStream
    include FileDescriptorBased
    include PollableInputStream

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixInputStreamClass), class_init,
        sizeof(LibGio::UnixInputStream), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, close_fd : Bool? = nil, fd : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !close_fd.nil?
        (_names.to_unsafe + _n).value = "close-fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_fd)
        _n += 1
      end
      if !fd.nil?
        (_names.to_unsafe + _n).value = "fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fd)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(UnixInputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_input_stream_get_type
    end

    def close_fd=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "close-fd", unsafe_value, Pointer(Void).null)
      value
    end

    def close_fd? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "close-fd", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fd=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "fd", unsafe_value, Pointer(Void).null)
      value
    end

    def fd : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "fd", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new #GUnixInputStream for the given @fd.
    #
    # If @close_fd is %TRUE, the file descriptor will be closed
    # when the stream is closed.
    def initialize(fd : Int32, close_fd : Bool)
      # g_unix_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_input_stream_new(fd, close_fd)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns whether the file descriptor of @stream will be
    # closed when the stream is closed.
    def close_fd : Bool
      # g_unix_input_stream_get_close_fd: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_input_stream_get_close_fd(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Return the UNIX file descriptor that the stream reads from.
    def fd : Int32
      # g_unix_input_stream_get_fd: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_unix_input_stream_get_fd(self)

      # Return value handling

      _retval
    end

    # Sets whether the file descriptor of @stream shall be closed
    # when the stream is closed.
    def close_fd=(close_fd : Bool) : Nil
      # g_unix_input_stream_set_close_fd: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_unix_input_stream_set_close_fd(self, close_fd)

      # Return value handling
    end
  end
end
