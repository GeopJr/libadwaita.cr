module Gtk
  # Interface for widgets that can be used for editing cells
  #
  # The `GtkCellEditable` interface must be implemented for widgets to be usable
  # to edit the contents of a `GtkTreeView` cell. It provides a way to specify how
  # temporary widgets should be configured for editing, get the new value, etc.
  module CellEditable
    def editing_canceled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editing-canceled", unsafe_value, Pointer(Void).null)
      value
    end

    def editing_canceled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editing-canceled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editing_done : Nil
      # gtk_cell_editable_editing_done: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_editable_editing_done(self)

      # Return value handling
    end

    def remove_widget : Nil
      # gtk_cell_editable_remove_widget: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_editable_remove_widget(self)

      # Return value handling
    end

    def start_editing(event : Gdk::Event?) : Nil
      # gtk_cell_editable_start_editing: (Method)
      # @event: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      event = if event.nil?
                Pointer(Void).null
              else
                event.to_unsafe
              end

      # C call
      LibGtk.gtk_cell_editable_start_editing(self, event)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class CellEditable__Impl < GObject::Object
    include CellEditable

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_editable_get_type
    end

    # Cast a `GObject::Object` to `CellEditable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to CellEditable")
    end

    # Cast a `GObject::Object` to `CellEditable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
