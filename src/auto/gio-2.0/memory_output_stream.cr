require "./output_stream"
require "./pollable_output_stream"

require "./seekable"

module Gio
  # #GMemoryOutputStream is a class for using arbitrary
  # memory chunks as output for GIO streaming output operations.
  #
  # As of GLib 2.34, #GMemoryOutputStream trivially implements
  # #GPollableOutputStream: it always polls as ready.
  class MemoryOutputStream < OutputStream
    include PollableOutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, data : Pointer(Nil)? = nil, data_size : UInt64? = nil, size : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if data
        (_names.to_unsafe + _n).value = "data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, data)
        _n += 1
      end
      if data_size
        (_names.to_unsafe + _n).value = "data-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, data_size)
        _n += 1
      end
      if size
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MemoryOutputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_memory_output_stream_get_type
    end

    def data=(value : Pointer(Nil)) : Pointer(Nil)
      unsafe_value = value

      LibGObject.g_object_set(self, "data", unsafe_value, Pointer(Void).null)
      value
    end

    def size=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "size", unsafe_value, Pointer(Void).null)
      value
    end

    def self.new_resizable : Gio::OutputStream
      # g_memory_output_stream_new_resizable: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_memory_output_stream_new_resizable
      Gio::MemoryOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def data : Pointer(Nil)?
      # g_memory_output_stream_get_data: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_memory_output_stream_get_data(self)
      Pointer(Void) unless _retval.null?
    end

    def data_size : UInt64
      # g_memory_output_stream_get_data_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_memory_output_stream_get_data_size(self)
      _retval
    end

    def size : UInt64
      # g_memory_output_stream_get_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_memory_output_stream_get_size(self)
      _retval
    end

    def steal_as_bytes : GLib::Bytes
      # g_memory_output_stream_steal_as_bytes: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_memory_output_stream_steal_as_bytes(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def steal_data : Pointer(Nil)?
      # g_memory_output_stream_steal_data: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_memory_output_stream_steal_data(self)
      Pointer(Void) unless _retval.null?
    end
  end
end
