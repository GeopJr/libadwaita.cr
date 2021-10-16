module Gio
  # #GFileDescriptorBased is implemented by streams (implementations of
  # #GInputStream or #GOutputStream) that are based on file descriptors.
  #
  # Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
  # GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
  # file when using it.
  module FileDescriptorBased
    def fd : Int32
      # g_file_descriptor_based_get_fd: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_descriptor_based_get_fd(self)
      _retval
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class FileDescriptorBased__Impl
    include FileDescriptorBased

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
      LibGio.g_file_descriptor_based_get_type
    end

    # Cast a `GObject::Object` to `FileDescriptorBased`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to FileDescriptorBased")
    end

    # Cast a `GObject::Object` to `FileDescriptorBased`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
