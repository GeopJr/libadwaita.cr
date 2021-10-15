module Gtk
  # Interface for Drag-and-Drop destinations in `GtkTreeView`.
  module TreeDragDest
    def drag_data_received(dest : Gtk::TreePath, value : _) : Bool
      # gtk_tree_drag_dest_drag_data_received: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_tree_drag_dest_drag_data_received(self, dest, value)
      GICrystal.to_bool(_retval)
    end

    def row_drop_possible(dest_path : Gtk::TreePath, value : _) : Bool
      # gtk_tree_drag_dest_row_drop_possible: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_tree_drag_dest_row_drop_possible(self, dest_path, value)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TreeDragDest__Impl
    include TreeDragDest

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
      LibGtk.gtk_tree_drag_dest_get_type
    end

    # Cast a `GObject::Object` to `TreeDragDest`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TreeDragDest")
    end

    # Cast a `GObject::Object` to `TreeDragDest`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
