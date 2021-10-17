module Gio
  # #GPollableInputStream is implemented by #GInputStreams that
  # can be polled for readiness to read. This can be used when
  # interfacing with a non-GIO API that expects
  # UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
  module PollableInputStream
    def can_poll : Bool
      # g_pollable_input_stream_can_poll: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_pollable_input_stream_can_poll(self)
      GICrystal.to_bool(_retval)
    end

    def create_source(cancellable : Gio::Cancellable?) : GLib::Source
      # g_pollable_input_stream_create_source: (Method)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_pollable_input_stream_create_source(self, cancellable)
      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    def is_readable : Bool
      # g_pollable_input_stream_is_readable: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_pollable_input_stream_is_readable(self)
      GICrystal.to_bool(_retval)
    end

    def read_nonblocking(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_pollable_input_stream_read_nonblocking: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      count = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      _retval = LibGio.g_pollable_input_stream_read_nonblocking(self, buffer, count, cancellable)
      _retval
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class PollableInputStream__Impl
    include PollableInputStream

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_pollable_input_stream_get_type
    end

    # Cast a `GObject::Object` to `PollableInputStream`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to PollableInputStream")
    end

    # Cast a `GObject::Object` to `PollableInputStream`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end