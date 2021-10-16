module Gtk
  # Interface for Drag-and-Drop destinations in `GtkTreeView`.
  module TreeDragSource
    def drag_data_delete(path : Gtk::TreePath) : Bool
      # gtk_tree_drag_source_drag_data_delete: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_drag_source_drag_data_delete(self, path)
      GICrystal.to_bool(_retval)
    end

    def drag_data_get(path : Gtk::TreePath) : Gdk::ContentProvider?
      # gtk_tree_drag_source_drag_data_get: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_drag_source_drag_data_get(self, path)
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def row_draggable(path : Gtk::TreePath) : Bool
      # gtk_tree_drag_source_row_draggable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_drag_source_row_draggable(self, path)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TreeDragSource__Impl
    include TreeDragSource

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
      LibGtk.gtk_tree_drag_source_get_type
    end

    # Cast a `GObject::Object` to `TreeDragSource`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TreeDragSource")
    end

    # Cast a `GObject::Object` to `TreeDragSource`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
