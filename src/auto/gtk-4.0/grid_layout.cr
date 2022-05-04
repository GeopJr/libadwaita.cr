require "./layout_manager"

module Gtk
  # `GtkGridLayout` is a layout manager which arranges child widgets in
  # rows and columns.
  #
  # Children have an "attach point" defined by the horizontal and vertical
  # index of the cell they occupy; children can span multiple rows or columns.
  # The layout properties for setting the attach points and spans are set
  # using the `Gtk#GridLayoutChild` associated to each child widget.
  #
  # The behaviour of `GtkGridLayout` when several children occupy the same
  # grid cell is undefined.
  #
  # `GtkGridLayout` can be used like a `GtkBoxLayout` if all children are
  # attached to the same row or column; however, if you only ever need a
  # single row or column, you should consider using `GtkBoxLayout`.
  @[GObject::GeneratedWrapper]
  class GridLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GridLayoutClass), class_init,
        sizeof(LibGtk::GridLayout), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, baseline_row : Int32? = nil, column_homogeneous : Bool? = nil, column_spacing : Int32? = nil, row_homogeneous : Bool? = nil, row_spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !baseline_row.nil?
        (_names.to_unsafe + _n).value = "baseline-row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_row)
        _n += 1
      end
      if !column_homogeneous.nil?
        (_names.to_unsafe + _n).value = "column-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_homogeneous)
        _n += 1
      end
      if !column_spacing.nil?
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
        _n += 1
      end
      if !row_homogeneous.nil?
        (_names.to_unsafe + _n).value = "row-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_homogeneous)
        _n += 1
      end
      if !row_spacing.nil?
        (_names.to_unsafe + _n).value = "row-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_spacing)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GridLayout.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_grid_layout_get_type
    end

    def baseline_row=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "baseline-row", unsafe_value, Pointer(Void).null)
      value
    end

    def baseline_row : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "baseline-row", pointerof(value), Pointer(Void).null)
      value
    end

    def column_homogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "column-homogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def column_homogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "column-homogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def column_spacing=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "column-spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def column_spacing : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "column-spacing", pointerof(value), Pointer(Void).null)
      value
    end

    def row_homogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "row-homogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def row_homogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "row-homogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def row_spacing=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "row-spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def row_spacing : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "row-spacing", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkGridLayout`.
    def initialize
      # gtk_grid_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_grid_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the row set with gtk_grid_layout_set_baseline_row().
    def baseline_row : Int32
      # gtk_grid_layout_get_baseline_row: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_baseline_row(self)

      # Return value handling

      _retval
    end

    # Checks whether all columns of @grid should have the same width.
    def column_homogeneous : Bool
      # gtk_grid_layout_get_column_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_column_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the spacing set with gtk_grid_layout_set_column_spacing().
    def column_spacing : UInt32
      # gtk_grid_layout_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_column_spacing(self)

      # Return value handling

      _retval
    end

    # Returns the baseline position of @row.
    #
    # If no value has been set with
    # `Gtk::GridLayout#row_baseline_position=`,
    # the default value of %GTK_BASELINE_POSITION_CENTER
    # is returned.
    def row_baseline_position(row : Int32) : Gtk::BaselinePosition
      # gtk_grid_layout_get_row_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_row_baseline_position(self, row)

      # Return value handling

      Gtk::BaselinePosition.new(_retval)
    end

    # Checks whether all rows of @grid should have the same height.
    def row_homogeneous : Bool
      # gtk_grid_layout_get_row_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_row_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the spacing set with gtk_grid_layout_set_row_spacing().
    def row_spacing : UInt32
      # gtk_grid_layout_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_layout_get_row_spacing(self)

      # Return value handling

      _retval
    end

    # Sets which row defines the global baseline for the entire grid.
    #
    # Each row in the grid can have its own local baseline, but only
    # one of those is global, meaning it will be the baseline in the
    # parent of the @grid.
    def baseline_row=(row : Int32) : Nil
      # gtk_grid_layout_set_baseline_row: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_baseline_row(self, row)

      # Return value handling
    end

    # Sets whether all columns of @grid should have the same width.
    def column_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_layout_set_column_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_column_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the amount of space to insert between consecutive columns.
    def column_spacing=(spacing : UInt32) : Nil
      # gtk_grid_layout_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_column_spacing(self, spacing)

      # Return value handling
    end

    # Sets how the baseline should be positioned on @row of the
    # grid, in case that row is assigned more space than is requested.
    def set_row_baseline_position(row : Int32, pos : Gtk::BaselinePosition) : Nil
      # gtk_grid_layout_set_row_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_row_baseline_position(self, row, pos)

      # Return value handling
    end

    # Sets whether all rows of @grid should have the same height.
    def row_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_layout_set_row_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_row_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the amount of space to insert between consecutive rows.
    def row_spacing=(spacing : UInt32) : Nil
      # gtk_grid_layout_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_layout_set_row_spacing(self, spacing)

      # Return value handling
    end
  end
end
