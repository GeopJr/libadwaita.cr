module Gtk
  # The `GtkOrientable` interface is implemented by all widgets that can be
  # oriented horizontally or vertically.
  #
  # `GtkOrientable` is more flexible in that it allows the orientation to be
  # changed at runtime, allowing the widgets to “flip”.
  module Orientable
    def orientation=(value : Gtk::Orientation) : Gtk::Orientation
      unsafe_value = value

      LibGObject.g_object_set(self, "orientation", unsafe_value, Pointer(Void).null)
      value
    end

    def orientation : Gtk::Orientation
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "orientation", pointerof(value), Pointer(Void).null)
      Gtk::Orientation.new(value)
    end

    def orientation : Gtk::Orientation
      # gtk_orientable_get_orientation: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_orientable_get_orientation(self)

      # Return value handling

      Gtk::Orientation.new(_retval)
    end

    def orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_orientable_set_orientation: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_orientable_set_orientation(self, orientation)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class Orientable__Impl < GObject::Object
    include Orientable

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_orientable_get_type
    end

    # Cast a `GObject::Object` to `Orientable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Orientable")
    end

    # Cast a `GObject::Object` to `Orientable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
