require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkGridLayout`.
  @[GObject::GeneratedWrapper]
  class GridLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GridLayoutChildClass), class_init,
        sizeof(LibGtk::GridLayoutChild), instance_init, 0)
    end

    GICrystal.define_new_method(GridLayoutChild, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GridLayoutChild`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, column : Int32? = nil, column_span : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, row : Int32? = nil, row_span : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !child_widget.nil?
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if !column.nil?
        (_names.to_unsafe + _n).value = "column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column)
        _n += 1
      end
      if !column_span.nil?
        (_names.to_unsafe + _n).value = "column-span".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_span)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !row.nil?
        (_names.to_unsafe + _n).value = "row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row)
        _n += 1
      end
      if !row_span.nil?
        (_names.to_unsafe + _n).value = "row-span".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_span)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GridLayoutChild.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Retrieves the column number to which @child attaches its left side.
    def column : Int32
      # gtk_grid_layout_child_get_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_child_get_column(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the number of columns that @child spans to.
    def column_span : Int32
      # gtk_grid_layout_child_get_column_span: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_child_get_column_span(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the row number to which @child attaches its top side.
    def row : Int32
      # gtk_grid_layout_child_get_row: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_child_get_row(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the number of rows that @child spans to.
    def row_span : Int32
      # gtk_grid_layout_child_get_row_span: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_child_get_row_span(@pointer)

      # Return value handling

      _retval
    end

    # Sets the column number to attach the left side of @child.
    def column=(column : Int32) : Nil
      # gtk_grid_layout_child_set_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_child_set_column(@pointer, column)

      # Return value handling
    end

    # Sets the number of columns @child spans to.
    def column_span=(span : Int32) : Nil
      # gtk_grid_layout_child_set_column_span: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_child_set_column_span(@pointer, span)

      # Return value handling
    end

    # Sets the row to place @child in.
    def row=(row : Int32) : Nil
      # gtk_grid_layout_child_set_row: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_child_set_row(@pointer, row)

      # Return value handling
    end

    # Sets the number of rows @child spans to.
    def row_span=(span : Int32) : Nil
      # gtk_grid_layout_child_set_row_span: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_child_set_row_span(@pointer, span)

      # Return value handling
    end
  end
end
