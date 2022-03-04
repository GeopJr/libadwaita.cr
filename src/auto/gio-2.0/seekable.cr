module Gio
  # #GSeekable is implemented by streams (implementations of
  # #GInputStream or #GOutputStream) that support seeking.
  #
  # Seekable streams largely fall into two categories: resizable and
  # fixed-size.
  #
  # #GSeekable on fixed-sized streams is approximately the same as POSIX
  # lseek() on a block device (for example: attempting to seek past the
  # end of the device is an error).  Fixed streams typically cannot be
  # truncated.
  #
  # #GSeekable on resizable streams is approximately the same as POSIX
  # lseek() on a normal file.  Seeking past the end and writing data will
  # usually cause the stream to resize by introducing zero bytes.
  module Seekable
    def can_seek : Bool
      # g_seekable_can_seek: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_seekable_can_seek(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def can_truncate : Bool
      # g_seekable_can_truncate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_seekable_can_truncate(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def seek(offset : Int64, type : GLib::SeekType, cancellable : Gio::Cancellable?) : Bool
      # g_seekable_seek: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_seekable_seek(self, offset, type, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def tell : Int64
      # g_seekable_tell: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_seekable_tell(self)

      # Return value handling
      _retval
    end

    def truncate(offset : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_seekable_truncate: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_seekable_truncate(self, offset, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Seekable__Impl < GObject::Object
    include Seekable

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_seekable_get_type
    end

    # Cast a `GObject::Object` to `Seekable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Seekable")
    end

    # Cast a `GObject::Object` to `Seekable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
