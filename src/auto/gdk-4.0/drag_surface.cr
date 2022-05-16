module Gdk
  # A `GdkDragSurface` is an interface for surfaces used during DND.
  module DragSurface
    def present(width : Int32, height : Int32) : Bool
      # gdk_drag_surface_present: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_drag_surface_present(@pointer, width, height)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDragSurface < GObject::Object
    include DragSurface

    GICrystal.define_new_method(Gdk::AbstractDragSurface, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_drag_surface_get_type
    end

    # Cast a `GObject::Object` to `DragSurface`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DragSurface")
    end

    # Cast a `GObject::Object` to `DragSurface`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
