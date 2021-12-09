module Gtk
  # `GtkSymbolicPaintable` is an interface that support symbolic colors in
  # paintables.
  #
  # `GdkPaintable`s implementing the interface will have the
  # [vfunc@Gtk.SymbolicPaintable.snapshot_symbolic] function called and
  # have the colors for drawing symbolic icons passed. At least 4 colors are guaranteed
  # to be passed every time.
  #
  # These 4 colors are the foreground color, and the colors to use for errors, warnings
  # and success information in that order.
  #
  # More colors may be added in the future.
  module SymbolicPaintable
    def snapshot_symbolic(snapshot : Gdk::Snapshot, width : Float64, height : Float64, colors : Enumerable(Gdk::RGBA)) : Nil
      # gtk_symbolic_paintable_snapshot_symbolic: (Method)
      # @colors: (array length=n_colors element-type Interface)
      # Returns: (transfer none)

      n_colors = colors.size
      colors = colors.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_symbolic_paintable_snapshot_symbolic(self, snapshot, width, height, colors, n_colors)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class SymbolicPaintable__Impl
    include SymbolicPaintable

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
      LibGtk.gtk_symbolic_paintable_get_type
    end

    # Cast a `GObject::Object` to `SymbolicPaintable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to SymbolicPaintable")
    end

    # Cast a `GObject::Object` to `SymbolicPaintable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
