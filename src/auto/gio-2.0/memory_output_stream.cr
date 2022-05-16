require "./output_stream"
require "./pollable_output_stream"

require "./seekable"

module Gio
  # #GMemoryOutputStream is a class for using arbitrary
  # memory chunks as output for GIO streaming output operations.
  #
  # As of GLib 2.34, #GMemoryOutputStream trivially implements
  # #GPollableOutputStream: it always polls as ready.
  @[GObject::GeneratedWrapper]
  class MemoryOutputStream < OutputStream
    include PollableOutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::MemoryOutputStreamClass), class_init,
        sizeof(LibGio::MemoryOutputStream), instance_init, 0)
    end

    GICrystal.define_new_method(MemoryOutputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MemoryOutputStream`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, data : Pointer(Void)? = nil, data_size : UInt64? = nil, size : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !data.nil?
        (_names.to_unsafe + _n).value = "data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, data)
        _n += 1
      end
      if !data_size.nil?
        (_names.to_unsafe + _n).value = "data-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, data_size)
        _n += 1
      end
      if !size.nil?
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MemoryOutputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_memory_output_stream_get_type
    end

    def data=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "data", unsafe_value, Pointer(Void).null)
      value
    end

    def data : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "data", pointerof(value), Pointer(Void).null)
      value
    end

    def data_size : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "data-size", pointerof(value), Pointer(Void).null)
      value
    end

    def size=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "size", unsafe_value, Pointer(Void).null)
      value
    end

    def size : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "size", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new #GMemoryOutputStream, using g_realloc() and g_free()
    # for memory allocation.
    def self.new_resizable : self
      # g_memory_output_stream_new_resizable: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_memory_output_stream_new_resizable

      # Return value handling

      Gio::MemoryOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets any loaded data from the @ostream.
    #
    # Note that the returned pointer may become invalid on the next
    # write or truncate operation on the stream.
    def data : Pointer(Void)?
      # g_memory_output_stream_get_data: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_memory_output_stream_get_data(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Returns the number of bytes from the start up to including the last
    # byte written in the stream that has not been truncated away.
    def data_size : UInt64
      # g_memory_output_stream_get_data_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_memory_output_stream_get_data_size(@pointer)

      # Return value handling

      _retval
    end

    # Gets the size of the currently allocated data area (available from
    # g_memory_output_stream_get_data()).
    #
    # You probably don't want to use this function on resizable streams.
    # See g_memory_output_stream_get_data_size() instead.  For resizable
    # streams the size returned by this function is an implementation
    # detail and may be change at any time in response to operations on the
    # stream.
    #
    # If the stream is fixed-sized (ie: no realloc was passed to
    # g_memory_output_stream_new()) then this is the maximum size of the
    # stream and further writes will return %G_IO_ERROR_NO_SPACE.
    #
    # In any case, if you want the number of bytes currently written to the
    # stream, use g_memory_output_stream_get_data_size().
    def size : UInt64
      # g_memory_output_stream_get_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_memory_output_stream_get_size(@pointer)

      # Return value handling

      _retval
    end

    # Returns data from the @ostream as a #GBytes. @ostream must be
    # closed before calling this function.
    def steal_as_bytes : GLib::Bytes
      # g_memory_output_stream_steal_as_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_memory_output_stream_steal_as_bytes(@pointer)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets any loaded data from the @ostream. Ownership of the data
    # is transferred to the caller; when no longer needed it must be
    # freed using the free function set in @ostream's
    # #GMemoryOutputStream:destroy-function property.
    #
    # @ostream must be closed before calling this function.
    def steal_data : Pointer(Void)?
      # g_memory_output_stream_steal_data: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_memory_output_stream_steal_data(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end
  end
end
