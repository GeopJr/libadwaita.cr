module Gio
  # #GPollableInputStream is implemented by #GInputStreams that
  # can be polled for readiness to read. This can be used when
  # interfacing with a non-GIO API that expects
  # UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
  module PollableInputStream
    def can_poll : Bool
      # g_pollable_input_stream_can_poll: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_pollable_input_stream_can_poll(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def create_source(cancellable : Gio::Cancellable?) : GLib::Source
      # g_pollable_input_stream_create_source: (Method)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_pollable_input_stream_create_source(@pointer, cancellable)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    def is_readable : Bool
      # g_pollable_input_stream_is_readable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_pollable_input_stream_is_readable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def read_nonblocking(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_pollable_input_stream_read_nonblocking: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_pollable_input_stream_read_nonblocking(@pointer, buffer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractPollableInputStream < GObject::Object
    include PollableInputStream

    GICrystal.define_new_method(Gio::AbstractPollableInputStream, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
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
