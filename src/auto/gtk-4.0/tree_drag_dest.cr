module Gtk
  # Interface for Drag-and-Drop destinations in `GtkTreeView`.
  module TreeDragDest
    def drag_data_received(dest : Gtk::TreePath, value : _) : Bool
      # gtk_tree_drag_dest_drag_data_received: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_tree_drag_dest_drag_data_received(self, dest, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def row_drop_possible(dest_path : Gtk::TreePath, value : _) : Bool
      # gtk_tree_drag_dest_row_drop_possible: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_tree_drag_dest_row_drop_possible(self, dest_path, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class TreeDragDest__Impl < GObject::Object
    include TreeDragDest

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_drag_dest_get_type
    end

    # Cast a `GObject::Object` to `TreeDragDest`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TreeDragDest")
    end

    # Cast a `GObject::Object` to `TreeDragDest`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
