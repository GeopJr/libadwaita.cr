require "./input_stream"
require "./pollable_input_stream"

require "./seekable"

module Gio
  # #GMemoryInputStream is a class for using arbitrary
  # memory chunks as input for GIO streaming input operations.
  #
  # As of GLib 2.34, #GMemoryInputStream implements
  # #GPollableInputStream.
  class MemoryInputStream < InputStream
    include PollableInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_memory_input_stream_get_type
    end

    def initialize
      # g_memory_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_memory_input_stream_new

      # Return value handling
      @pointer = _retval
    end

    def self.new_from_bytes(bytes : GLib::Bytes) : self
      # g_memory_input_stream_new_from_bytes: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_memory_input_stream_new_from_bytes(bytes)

      # Return value handling
      Gio::MemoryInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_data(data : Enumerable(UInt8), destroy : Pointer(Void)?) : self
      # g_memory_input_stream_new_from_data: (Constructor)
      # @data: (transfer full) (array length=len element-type UInt8)
      # @destroy: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      len = data.size
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_memory_input_stream_new_from_data(data, len, destroy)

      # Return value handling
      Gio::MemoryInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def add_bytes(bytes : GLib::Bytes) : Nil
      # g_memory_input_stream_add_bytes: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_memory_input_stream_add_bytes(self, bytes)

      # Return value handling
    end

    def add_data(data : Enumerable(UInt8), destroy : Pointer(Void)?) : Nil
      # g_memory_input_stream_add_data: (Method)
      # @data: (transfer full) (array length=len element-type UInt8)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      len = data.size
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end
      data = data.to_a.to_unsafe

      # C call
      LibGio.g_memory_input_stream_add_data(self, data, len, destroy)

      # Return value handling
    end
  end
end
