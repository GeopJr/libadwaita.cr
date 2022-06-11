require "./input_stream"
require "./pollable_input_stream"

require "./seekable"

module Gio
  # #GMemoryInputStream is a class for using arbitrary
  # memory chunks as input for GIO streaming input operations.
  #
  # As of GLib 2.34, #GMemoryInputStream implements
  # #GPollableInputStream.
  @[GObject::GeneratedWrapper]
  class MemoryInputStream < InputStream
    include PollableInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::MemoryInputStreamClass), class_init,
        sizeof(LibGio::MemoryInputStream), instance_init, 0)
    end

    GICrystal.define_new_method(MemoryInputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MemoryInputStream`.
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
      LibGio.g_memory_input_stream_get_type
    end

    # Creates a new #GMemoryInputStream with data from the given @bytes.
    def self.new_from_bytes(bytes : GLib::Bytes) : self
      # g_memory_input_stream_new_from_bytes: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_memory_input_stream_new_from_bytes(bytes)

      # Return value handling

      Gio::MemoryInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GMemoryInputStream with data in memory of a given size.
    def self.new_from_data(data : Enumerable(UInt8), destroy : GLib::DestroyNotify?) : self
      # g_memory_input_stream_new_from_data: (Constructor)
      # @data: (transfer full) (array length=len element-type UInt8)
      # @destroy: (nullable)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      len = data.size # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_memory_input_stream_new_from_data(data, len, destroy)

      # Return value handling

      Gio::MemoryInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Appends @bytes to data that can be read from the input stream.
    def add_bytes(bytes : GLib::Bytes) : Nil
      # g_memory_input_stream_add_bytes: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_memory_input_stream_add_bytes(@pointer, bytes)

      # Return value handling
    end

    # Appends @data to data that can be read from the input stream
    def add_data(data : Enumerable(UInt8), destroy : GLib::DestroyNotify?) : Nil
      # g_memory_input_stream_add_data: (Method)
      # @data: (transfer full) (array length=len element-type UInt8)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      len = data.size # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      LibGio.g_memory_input_stream_add_data(@pointer, data, len, destroy)

      # Return value handling
    end
  end
end
