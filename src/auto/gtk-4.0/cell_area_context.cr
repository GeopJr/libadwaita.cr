require "../g_object-2.0/object"

module Gtk
  # Stores geometrical information for a series of rows in a GtkCellArea
  #
  # The `GtkCellAreaContext` object is created by a given `GtkCellArea`
  # implementation via its `GtkCellAreaClass.create_context()` virtual
  # method and is used to store cell sizes and alignments for a series of
  # `GtkTreeModel` rows that are requested and rendered in the same context.
  #
  # `GtkCellLayout` widgets can create any number of contexts in which to
  # request and render groups of data rows. However, it’s important that the
  # same context which was used to request sizes for a given `GtkTreeModel`
  # row also be used for the same row when calling other `GtkCellArea` APIs
  # such as gtk_cell_area_render() and gtk_cell_area_event().
  class CellAreaContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, area : Gtk::CellArea? = nil, minimum_height : Int32? = nil, minimum_width : Int32? = nil, natural_height : Int32? = nil, natural_width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if area
        (_names.to_unsafe + _n).value = "area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, area)
        _n += 1
      end
      if minimum_height
        (_names.to_unsafe + _n).value = "minimum-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, minimum_height)
        _n += 1
      end
      if minimum_width
        (_names.to_unsafe + _n).value = "minimum-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, minimum_width)
        _n += 1
      end
      if natural_height
        (_names.to_unsafe + _n).value = "natural-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, natural_height)
        _n += 1
      end
      if natural_width
        (_names.to_unsafe + _n).value = "natural-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, natural_width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellAreaContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_context_get_type
    end

    def area=(value : Gtk::CellArea?) : Gtk::CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "area", unsafe_value, Pointer(Void).null)
      value
    end

    def area : Gtk::CellArea?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "area", pointerof(value), Pointer(Void).null)
      Gtk::CellArea.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def minimum_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "minimum-height", pointerof(value), Pointer(Void).null)
      value
    end

    def minimum_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "minimum-width", pointerof(value), Pointer(Void).null)
      value
    end

    def natural_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "natural-height", pointerof(value), Pointer(Void).null)
      value
    end

    def natural_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "natural-width", pointerof(value), Pointer(Void).null)
      value
    end

    def allocate(width : Int32, height : Int32) : Nil
      # gtk_cell_area_context_allocate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_area_context_allocate(self, width, height)

      # Return value handling
    end

    def allocation : Nil
      # gtk_cell_area_context_get_allocation: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_area_context_get_allocation(self, width, height)

      # Return value handling
    end

    def area : Gtk::CellArea
      # gtk_cell_area_context_get_area: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_area_context_get_area(self)

      # Return value handling
      Gtk::CellArea.new(_retval, GICrystal::Transfer::None)
    end

    def preferred_height : Nil
      # gtk_cell_area_context_get_preferred_height: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_height = Pointer(Int32).null
      natural_height = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_area_context_get_preferred_height(self, minimum_height, natural_height)

      # Return value handling
    end

    def preferred_height_for_width(width : Int32) : Nil
      # gtk_cell_area_context_get_preferred_height_for_width: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_height = Pointer(Int32).null
      natural_height = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_area_context_get_preferred_height_for_width(self, width, minimum_height, natural_height)

      # Return value handling
    end

    def preferred_width : Nil
      # gtk_cell_area_context_get_preferred_width: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_width = Pointer(Int32).null
      natural_width = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_area_context_get_preferred_width(self, minimum_width, natural_width)

      # Return value handling
    end

    def preferred_width_for_height(height : Int32) : Nil
      # gtk_cell_area_context_get_preferred_width_for_height: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_width = Pointer(Int32).null
      natural_width = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_area_context_get_preferred_width_for_height(self, height, minimum_width, natural_width)

      # Return value handling
    end

    def push_preferred_height(minimum_height : Int32, natural_height : Int32) : Nil
      # gtk_cell_area_context_push_preferred_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_area_context_push_preferred_height(self, minimum_height, natural_height)

      # Return value handling
    end

    def push_preferred_width(minimum_width : Int32, natural_width : Int32) : Nil
      # gtk_cell_area_context_push_preferred_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_area_context_push_preferred_width(self, minimum_width, natural_width)

      # Return value handling
    end

    def reset : Nil
      # gtk_cell_area_context_reset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_area_context_reset(self)

      # Return value handling
    end
  end
end
