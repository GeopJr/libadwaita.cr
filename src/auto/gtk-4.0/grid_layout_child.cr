require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkGridLayout`.
  class GridLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, column : Int32? = nil, column_span : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, row : Int32? = nil, row_span : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if child_widget
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if column
        (_names.to_unsafe + _n).value = "column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column)
        _n += 1
      end
      if column_span
        (_names.to_unsafe + _n).value = "column-span".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_span)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if row
        (_names.to_unsafe + _n).value = "row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row)
        _n += 1
      end
      if row_span
        (_names.to_unsafe + _n).value = "row-span".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_span)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GridLayoutChild.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_grid_layout_child_get_type
    end

    def column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "column", unsafe_value, Pointer(Void).null)
      value
    end

    def column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "column", pointerof(value), Pointer(Void).null)
      value
    end

    def column_span=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "column-span", unsafe_value, Pointer(Void).null)
      value
    end

    def column_span : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "column-span", pointerof(value), Pointer(Void).null)
      value
    end

    def row=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "row", unsafe_value, Pointer(Void).null)
      value
    end

    def row : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "row", pointerof(value), Pointer(Void).null)
      value
    end

    def row_span=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "row-span", unsafe_value, Pointer(Void).null)
      value
    end

    def row_span : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "row-span", pointerof(value), Pointer(Void).null)
      value
    end

    def column : Int32
      # gtk_grid_layout_child_get_column: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_child_get_column(self)
      _retval
    end

    def column_span : Int32
      # gtk_grid_layout_child_get_column_span: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_child_get_column_span(self)
      _retval
    end

    def row : Int32
      # gtk_grid_layout_child_get_row: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_child_get_row(self)
      _retval
    end

    def row_span : Int32
      # gtk_grid_layout_child_get_row_span: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_layout_child_get_row_span(self)
      _retval
    end

    def column=(column : Int32) : Nil
      # gtk_grid_layout_child_set_column: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_child_set_column(self, column)
    end

    def column_span=(span : Int32) : Nil
      # gtk_grid_layout_child_set_column_span: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_child_set_column_span(self, span)
    end

    def row=(row : Int32) : Nil
      # gtk_grid_layout_child_set_row: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_child_set_row(self, row)
    end

    def row_span=(span : Int32) : Nil
      # gtk_grid_layout_child_set_row_span: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_layout_child_set_row_span(self, span)
    end
  end
end
