module Gtk
  # The `GtkConstraintTarget` interface is implemented by objects that
  # can be used as source or target in `GtkConstraint`s.
  #
  # Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
  module ConstraintTarget
    abstract def to_unsafe
  end

  # :nodoc:
  class ConstraintTarget__Impl
    include ConstraintTarget

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
      LibGtk.gtk_constraint_target_get_type
    end

    # Cast a `GObject::Object` to `ConstraintTarget`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ConstraintTarget")
    end

    # Cast a `GObject::Object` to `ConstraintTarget`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
