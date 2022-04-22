require "./filter_output_stream"
require "./seekable"

module Gio
  # Buffered output stream implements #GFilterOutputStream and provides
  # for buffered writes.
  #
  # By default, #GBufferedOutputStream's buffer size is set at 4 kilobytes.
  #
  # To create a buffered output stream, use g_buffered_output_stream_new(),
  # or g_buffered_output_stream_new_sized() to specify the buffer's size
  # at construction.
  #
  # To get the size of a buffer within a buffered input stream, use
  # g_buffered_output_stream_get_buffer_size(). To change the size of a
  # buffered output stream's buffer, use
  # g_buffered_output_stream_set_buffer_size(). Note that the buffer's
  # size cannot be reduced below the size of the data within the buffer.
  @[GObject::GeneratedWrapper]
  class BufferedOutputStream < FilterOutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::BufferedOutputStreamClass), class_init,
        sizeof(LibGio::BufferedOutputStream), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, auto_grow : Bool? = nil, base_stream : Gio::OutputStream? = nil, buffer_size : UInt32? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !auto_grow.nil?
        (_names.to_unsafe + _n).value = "auto-grow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, auto_grow)
        _n += 1
      end
      if !base_stream.nil?
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
        _n += 1
      end
      if !buffer_size.nil?
        (_names.to_unsafe + _n).value = "buffer-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer_size)
        _n += 1
      end
      if !close_base_stream.nil?
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BufferedOutputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_buffered_output_stream_get_type
    end

    def auto_grow=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "auto-grow", unsafe_value, Pointer(Void).null)
      value
    end

    def auto_grow? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "auto-grow", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def buffer_size=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "buffer-size", unsafe_value, Pointer(Void).null)
      value
    end

    def buffer_size : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "buffer-size", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new buffered output stream for a base stream.
    def initialize(base_stream : Gio::OutputStream)
      # g_buffered_output_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_buffered_output_stream_new(base_stream)

      # Return value handling

      @pointer = _retval
    end

    # Creates a new buffered output stream with a given buffer size.
    def self.new_sized(base_stream : Gio::OutputStream, size : UInt64) : self
      # g_buffered_output_stream_new_sized: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_buffered_output_stream_new_sized(base_stream, size)

      # Return value handling

      Gio::BufferedOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks if the buffer automatically grows as data is added.
    def auto_grow : Bool
      # g_buffered_output_stream_get_auto_grow: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_buffered_output_stream_get_auto_grow(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the size of the buffer in the @stream.
    def buffer_size : UInt64
      # g_buffered_output_stream_get_buffer_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_buffered_output_stream_get_buffer_size(self)

      # Return value handling

      _retval
    end

    # Sets whether or not the @stream's buffer should automatically grow.
    # If @auto_grow is true, then each write will just make the buffer
    # larger, and you must manually flush the buffer to actually write out
    # the data to the underlying stream.
    def auto_grow=(auto_grow : Bool) : Nil
      # g_buffered_output_stream_set_auto_grow: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_buffered_output_stream_set_auto_grow(self, auto_grow)

      # Return value handling
    end

    # Sets the size of the internal buffer to @size.
    def buffer_size=(size : UInt64) : Nil
      # g_buffered_output_stream_set_buffer_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_buffered_output_stream_set_buffer_size(self, size)

      # Return value handling
    end
  end
end
