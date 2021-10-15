require "./layout_manager"

module Gtk
  # `GtkGridLayout` is a layout manager which arranges child widgets in
  # rows and columns.
  #
  # Children have an "attach point" defined by the horizontal and vertical
  # index of the cell they occupy; children can span multiple rows or columns.
  # The layout properties for setting the attach points and spans are set
  # using the [class@Gtk.GridLayoutChild] associated to each child widget.
  #
  # The behaviour of `GtkGridLayout` when several children occupy the same
  # grid cell is undefined.
  #
  # `GtkGridLayout` can be used like a `GtkBoxLayout` if all children are
  # attached to the same row or column; however, if you only ever need a
  # single row or column, you should consider using `GtkBoxLayout`.
  class GridLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, baseline_row : Int32? = nil, column_homogeneous : Bool? = nil, column_spacing : Int32? = nil, row_homogeneous : Bool? = nil, row_spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if baseline_row
        (_names.to_unsafe + _n).value = "baseline-row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_row)
        _n += 1
      end
      if column_homogeneous
        (_names.to_unsafe + _n).value = "column-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_homogeneous)
        _n += 1
      end
      if column_spacing
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
        _n += 1
      end
      if row_homogeneous
        (_names.to_unsafe + _n).value = "row-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_homogeneous)
        _n += 1
      end
      if row_spacing
        (_names.to_unsafe + _n).value = "row-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_spacing)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GridLayout.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_grid_layout_get_type
    end

    def initialize
      # gtk_grid_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_grid_layout_new
      @pointer = _retval
    end

    def baseline_row : Int32
      # gtk_grid_layout_get_baseline_row: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_baseline_row(self)
      _retval
    end

    def column_homogeneous? : Bool
      # gtk_grid_layout_get_column_homogeneous: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_column_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def column_spacing : UInt32
      # gtk_grid_layout_get_column_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_column_spacing(self)
      _retval
    end

    def row_baseline_position(row : Int32) : Gtk::BaselinePosition
      # gtk_grid_layout_get_row_baseline_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_row_baseline_position(self, row)
      Gtk::BaselinePosition.from_value(_retval)
    end

    def row_homogeneous? : Bool
      # gtk_grid_layout_get_row_homogeneous: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_row_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def row_spacing : UInt32
      # gtk_grid_layout_get_row_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_get_row_spacing(self)
      _retval
    end

    def baseline_row=(row : Int32) : Nil
      # gtk_grid_layout_set_baseline_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_baseline_row(self, row)
    end

    def column_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_layout_set_column_homogeneous: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_column_homogeneous(self, homogeneous)
    end

    def column_spacing=(spacing : UInt32) : Nil
      # gtk_grid_layout_set_column_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_column_spacing(self, spacing)
    end

    def set_row_baseline_position(row : Int32, pos : Gtk::BaselinePosition) : Nil
      # gtk_grid_layout_set_row_baseline_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_row_baseline_position(self, row, pos)
    end

    def row_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_layout_set_row_homogeneous: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_row_homogeneous(self, homogeneous)
    end

    def row_spacing=(spacing : UInt32) : Nil
      # gtk_grid_layout_set_row_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_set_row_spacing(self, spacing)
    end
  end
end
