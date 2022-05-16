require "../g_object-2.0/initially_unowned"
require "./buildable"

require "./cell_layout"

module Gtk
  # A visible column in a `Gtk#TreeView` widget
  #
  # The `GtkTreeViewColumn` object represents a visible column in a `GtkTreeView` widget.
  # It allows to set properties of the column header, and functions as a holding pen
  # for the cell renderers which determine how the data in the column is displayed.
  #
  # Please refer to the [tree widget conceptual overview](section-tree-widget.html)
  # for an overview of all the objects and data types related to the tree widget and
  # how they work together, and to the `Gtk#TreeView` documentation for specifics
  # about the CSS node structure for treeviews and their headers.
  @[GObject::GeneratedWrapper]
  class TreeViewColumn < GObject::InitiallyUnowned
    include Buildable
    include CellLayout

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::TreeViewColumn), instance_init, 0)
    end

    GICrystal.define_new_method(TreeViewColumn, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeViewColumn`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, alignment : Float32? = nil, cell_area : Gtk::CellArea? = nil, clickable : Bool? = nil, expand : Bool? = nil, fixed_width : Int32? = nil, max_width : Int32? = nil, min_width : Int32? = nil, reorderable : Bool? = nil, resizable : Bool? = nil, sizing : Gtk::TreeViewColumnSizing? = nil, sort_column_id : Int32? = nil, sort_indicator : Bool? = nil, sort_order : Gtk::SortType? = nil, spacing : Int32? = nil, title : ::String? = nil, visible : Bool? = nil, widget : Gtk::Widget? = nil, width : Int32? = nil, x_offset : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[19]
      _values = StaticArray(LibGObject::Value, 19).new(LibGObject::Value.new)
      _n = 0

      if !alignment.nil?
        (_names.to_unsafe + _n).value = "alignment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alignment)
        _n += 1
      end
      if !cell_area.nil?
        (_names.to_unsafe + _n).value = "cell-area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area)
        _n += 1
      end
      if !clickable.nil?
        (_names.to_unsafe + _n).value = "clickable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, clickable)
        _n += 1
      end
      if !expand.nil?
        (_names.to_unsafe + _n).value = "expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expand)
        _n += 1
      end
      if !fixed_width.nil?
        (_names.to_unsafe + _n).value = "fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_width)
        _n += 1
      end
      if !max_width.nil?
        (_names.to_unsafe + _n).value = "max-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width)
        _n += 1
      end
      if !min_width.nil?
        (_names.to_unsafe + _n).value = "min-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_width)
        _n += 1
      end
      if !reorderable.nil?
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if !resizable.nil?
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
        _n += 1
      end
      if !sizing.nil?
        (_names.to_unsafe + _n).value = "sizing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sizing)
        _n += 1
      end
      if !sort_column_id.nil?
        (_names.to_unsafe + _n).value = "sort-column-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_column_id)
        _n += 1
      end
      if !sort_indicator.nil?
        (_names.to_unsafe + _n).value = "sort-indicator".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_indicator)
        _n += 1
      end
      if !sort_order.nil?
        (_names.to_unsafe + _n).value = "sort-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_order)
        _n += 1
      end
      if !spacing.nil?
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if !x_offset.nil?
        (_names.to_unsafe + _n).value = "x-offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, x_offset)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeViewColumn.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_view_column_get_type
    end

    def alignment=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "alignment", unsafe_value, Pointer(Void).null)
      value
    end

    def alignment : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "alignment", pointerof(value), Pointer(Void).null)
      value
    end

    def cell_area=(value : Gtk::CellArea?) : Gtk::CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_area : Gtk::CellArea?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cell-area", pointerof(value), Pointer(Void).null)
      Gtk::CellArea.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def clickable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "clickable", unsafe_value, Pointer(Void).null)
      value
    end

    def clickable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "clickable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expand", unsafe_value, Pointer(Void).null)
      value
    end

    def expand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fixed_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "fixed-width", unsafe_value, Pointer(Void).null)
      value
    end

    def fixed_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "fixed-width", pointerof(value), Pointer(Void).null)
      value
    end

    def max_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-width", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-width", pointerof(value), Pointer(Void).null)
      value
    end

    def min_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-width", unsafe_value, Pointer(Void).null)
      value
    end

    def min_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-width", pointerof(value), Pointer(Void).null)
      value
    end

    def reorderable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reorderable", unsafe_value, Pointer(Void).null)
      value
    end

    def reorderable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reorderable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def resizable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resizable", unsafe_value, Pointer(Void).null)
      value
    end

    def resizable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resizable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def sizing=(value : Gtk::TreeViewColumnSizing) : Gtk::TreeViewColumnSizing
      unsafe_value = value

      LibGObject.g_object_set(self, "sizing", unsafe_value, Pointer(Void).null)
      value
    end

    def sizing : Gtk::TreeViewColumnSizing
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "sizing", pointerof(value), Pointer(Void).null)
      Gtk::TreeViewColumnSizing.new(value)
    end

    def sort_column_id=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "sort-column-id", unsafe_value, Pointer(Void).null)
      value
    end

    def sort_column_id : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "sort-column-id", pointerof(value), Pointer(Void).null)
      value
    end

    def sort_indicator=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "sort-indicator", unsafe_value, Pointer(Void).null)
      value
    end

    def sort_indicator? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "sort-indicator", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def sort_order=(value : Gtk::SortType) : Gtk::SortType
      unsafe_value = value

      LibGObject.g_object_set(self, "sort-order", unsafe_value, Pointer(Void).null)
      value
    end

    def sort_order : Gtk::SortType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "sort-order", pointerof(value), Pointer(Void).null)
      Gtk::SortType.new(value)
    end

    def spacing=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def spacing : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "spacing", pointerof(value), Pointer(Void).null)
      value
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "widget", unsafe_value, Pointer(Void).null)
      value
    end

    def widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width", pointerof(value), Pointer(Void).null)
      value
    end

    def x_offset : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "x-offset", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkTreeViewColumn`.
    def initialize
      # gtk_tree_view_column_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkTreeViewColumn` using @area to render its cells.
    def self.new_with_area(area : Gtk::CellArea) : self
      # gtk_tree_view_column_new_with_area: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_new_with_area(area)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds an attribute mapping to the list in @tree_column.
    #
    # The @column is the
    # column of the model to get a value from, and the @attribute is the
    # parameter on @cell_renderer to be set from the value. So for example
    # if column 2 of the model contains strings, you could have the
    # “text” attribute of a `GtkCellRendererText` get its values from
    # column 2.
    def add_attribute(cell_renderer : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_tree_view_column_add_attribute: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_add_attribute(@pointer, cell_renderer, attribute, column)

      # Return value handling
    end

    # Obtains the horizontal position and size of a cell in a column.
    #
    # If the  cell is not found in the column, @start_pos and @width
    # are not changed and %FALSE is returned.
    def cell_get_position(cell_renderer : Gtk::CellRenderer) : Bool
      # gtk_tree_view_column_cell_get_position: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      x_offset = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_tree_view_column_cell_get_position(@pointer, cell_renderer, x_offset, width)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Obtains the width and height needed to render the column.  This is used
    # primarily by the `GtkTreeView`.
    def cell_get_size : Nil
      # gtk_tree_view_column_cell_get_size: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @y_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      x_offset = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      y_offset = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null    # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null
      # C call
      LibGtk.gtk_tree_view_column_cell_get_size(@pointer, x_offset, y_offset, width, height)

      # Return value handling
    end

    # Returns %TRUE if any of the cells packed into the @tree_column are visible.
    # For this to be meaningful, you must first initialize the cells with
    # gtk_tree_view_column_cell_set_cell_data()
    def cell_is_visible : Bool
      # gtk_tree_view_column_cell_is_visible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_cell_is_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the cell renderer based on the @tree_model and @iter.  That is, for
    # every attribute mapping in @tree_column, it will get a value from the set
    # column on the @iter, and use that value to set the attribute on the cell
    # renderer.  This is used primarily by the `GtkTreeView`.
    def cell_set_cell_data(tree_model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
      # gtk_tree_view_column_cell_set_cell_data: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_cell_set_cell_data(@pointer, tree_model, iter, is_expander, is_expanded)

      # Return value handling
    end

    # Unsets all the mappings on all renderers on the @tree_column.
    def clear : Nil
      # gtk_tree_view_column_clear: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_clear(@pointer)

      # Return value handling
    end

    # Clears all existing attributes previously set with
    # gtk_tree_view_column_set_attributes().
    def clear_attributes(cell_renderer : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_clear_attributes: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_clear_attributes(@pointer, cell_renderer)

      # Return value handling
    end

    # Emits the “clicked” signal on the column.  This function will only work if
    # @tree_column is clickable.
    def clicked : Nil
      # gtk_tree_view_column_clicked: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_clicked(@pointer)

      # Return value handling
    end

    # Sets the current keyboard focus to be at @cell, if the column contains
    # 2 or more editable and activatable cells.
    def focus_cell(cell : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_focus_cell: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_focus_cell(@pointer, cell)

      # Return value handling
    end

    # Returns the current x alignment of @tree_column.  This value can range
    # between 0.0 and 1.0.
    def alignment : Float32
      # gtk_tree_view_column_get_alignment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_alignment(@pointer)

      # Return value handling

      _retval
    end

    # Returns the button used in the treeview column header
    def button : Gtk::Widget
      # gtk_tree_view_column_get_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_button(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Returns %TRUE if the user can click on the header for the column.
    def clickable : Bool
      # gtk_tree_view_column_get_clickable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_clickable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the column expands to fill available space.
    def expand : Bool
      # gtk_tree_view_column_get_expand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_expand(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the fixed width of the column.  This may not be the actual displayed
    # width of the column; for that, use gtk_tree_view_column_get_width().
    def fixed_width : Int32
      # gtk_tree_view_column_get_fixed_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_fixed_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns the maximum width in pixels of the @tree_column, or -1 if no maximum
    # width is set.
    def max_width : Int32
      # gtk_tree_view_column_get_max_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_max_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns the minimum width in pixels of the @tree_column, or -1 if no minimum
    # width is set.
    def min_width : Int32
      # gtk_tree_view_column_get_min_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_min_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns %TRUE if the @tree_column can be reordered by the user.
    def reorderable : Bool
      # gtk_tree_view_column_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_reorderable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the @tree_column can be resized by the end user.
    def resizable : Bool
      # gtk_tree_view_column_get_resizable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_resizable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the current type of @tree_column.
    def sizing : Gtk::TreeViewColumnSizing
      # gtk_tree_view_column_get_sizing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sizing(@pointer)

      # Return value handling

      Gtk::TreeViewColumnSizing.new(_retval)
    end

    # Gets the logical @sort_column_id that the model sorts on
    # when this column is selected for sorting.
    #
    # See `Gtk::TreeViewColumn#sort_column_id=`.
    def sort_column_id : Int32
      # gtk_tree_view_column_get_sort_column_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_column_id(@pointer)

      # Return value handling

      _retval
    end

    # Gets the value set by gtk_tree_view_column_set_sort_indicator().
    def sort_indicator : Bool
      # gtk_tree_view_column_get_sort_indicator: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_indicator(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value set by gtk_tree_view_column_set_sort_order().
    def sort_order : Gtk::SortType
      # gtk_tree_view_column_get_sort_order: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_order(@pointer)

      # Return value handling

      Gtk::SortType.new(_retval)
    end

    # Returns the spacing of @tree_column.
    def spacing : Int32
      # gtk_tree_view_column_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_spacing(@pointer)

      # Return value handling

      _retval
    end

    # Returns the title of the widget.
    def title : ::String
      # gtk_tree_view_column_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_title(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns the `GtkTreeView` wherein @tree_column has been inserted.
    # If @column is currently not inserted in any tree view, %NULL is
    # returned.
    def tree_view : Gtk::Widget?
      # gtk_tree_view_column_get_tree_view: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_tree_view(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns %TRUE if @tree_column is visible.
    def visible : Bool
      # gtk_tree_view_column_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the `GtkWidget` in the button on the column header.
    #
    # If a custom widget has not been set then %NULL is returned.
    def widget : Gtk::Widget?
      # gtk_tree_view_column_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the current size of @tree_column in pixels.
    def width : Int32
      # gtk_tree_view_column_get_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns the current X offset of @tree_column in pixels.
    def x_offset : Int32
      # gtk_tree_view_column_get_x_offset: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_x_offset(@pointer)

      # Return value handling

      _retval
    end

    # Adds the @cell to end of the column. If @expand is %FALSE, then the @cell
    # is allocated no more space than it needs. Any unused space is divided
    # evenly between cells for which @expand is %TRUE.
    def pack_end(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_end: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_pack_end(@pointer, cell, expand)

      # Return value handling
    end

    # Packs the @cell into the beginning of the column. If @expand is %FALSE, then
    # the @cell is allocated no more space than it needs. Any unused space is divided
    # evenly between cells for which @expand is %TRUE.
    def pack_start(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_pack_start(@pointer, cell, expand)

      # Return value handling
    end

    # Flags the column, and the cell renderers added to this column, to have
    # their sizes renegotiated.
    def queue_resize : Nil
      # gtk_tree_view_column_queue_resize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_queue_resize(@pointer)

      # Return value handling
    end

    # Sets the alignment of the title or custom widget inside the column header.
    # The alignment determines its location inside the button -- 0.0 for left, 0.5
    # for center, 1.0 for right.
    def alignment=(xalign : Float32) : Nil
      # gtk_tree_view_column_set_alignment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_alignment(@pointer, xalign)

      # Return value handling
    end

    # Sets the `GtkTreeCellDataFunc` to use for the column.
    #
    # This
    # function is used instead of the standard attributes mapping for
    # setting the column value, and should set the value of @tree_column's
    # cell renderer as appropriate.  @func may be %NULL to remove an
    # older one.
    def set_cell_data_func(cell_renderer : Gtk::CellRenderer, func : Gtk::TreeCellDataFunc?) : Nil
      # gtk_tree_view_column_set_cell_data_func: (Method)
      # @func: (nullable)
      # @func_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_tree_column : Pointer(Void), lib_cell : Pointer(Void), lib_tree_model : Pointer(Void), lib_iter : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tree_column = Gtk::TreeViewColumn.new(lib_tree_column, :none)
          # Generator::BuiltInTypeArgPlan
          cell = Gtk::CellRenderer.new(lib_cell, :none)
          # Generator::BuiltInTypeArgPlan
          tree_model = Gtk::TreeModel.new(lib_tree_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          ::Box(Proc(Gtk::TreeViewColumn, Gtk::CellRenderer, Gtk::TreeModel, Gtk::TreeIter, Nil)).unbox(lib_data).call(tree_column, cell, tree_model, iter)
        }.pointer
        func_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = func_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_view_column_set_cell_data_func(@pointer, cell_renderer, func, func_data, destroy)

      # Return value handling
    end

    # Sets the header to be active if @clickable is %TRUE.  When the header is
    # active, then it can take keyboard focus, and can be clicked.
    def clickable=(clickable : Bool) : Nil
      # gtk_tree_view_column_set_clickable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_clickable(@pointer, clickable)

      # Return value handling
    end

    # Sets the column to take available extra space.  This space is shared equally
    # amongst all columns that have the expand set to %TRUE.  If no column has this
    # option set, then the last column gets all extra space.  By default, every
    # column is created with this %FALSE.
    #
    # Along with “fixed-width”, the “expand” property changes when the column is
    # resized by the user.
    def expand=(expand : Bool) : Nil
      # gtk_tree_view_column_set_expand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_expand(@pointer, expand)

      # Return value handling
    end

    # If @fixed_width is not -1, sets the fixed width of @tree_column; otherwise
    # unsets it.  The effective value of @fixed_width is clamped between the
    # minimum and maximum width of the column; however, the value stored in the
    # “fixed-width” property is not clamped.  If the column sizing is
    # %GTK_TREE_VIEW_COLUMN_GROW_ONLY or %GTK_TREE_VIEW_COLUMN_AUTOSIZE, setting
    # a fixed width overrides the automatically calculated width.  Note that
    # @fixed_width is only a hint to GTK; the width actually allocated to the
    # column may be greater or less than requested.
    #
    # Along with “expand”, the “fixed-width” property changes when the column is
    # resized by the user.
    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_tree_view_column_set_fixed_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_fixed_width(@pointer, fixed_width)

      # Return value handling
    end

    # Sets the maximum width of the @tree_column.  If @max_width is -1, then the
    # maximum width is unset.  Note, the column can actually be wider than max
    # width if it’s the last column in a view.  In this case, the column expands to
    # fill any extra space.
    def max_width=(max_width : Int32) : Nil
      # gtk_tree_view_column_set_max_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_max_width(@pointer, max_width)

      # Return value handling
    end

    # Sets the minimum width of the @tree_column.  If @min_width is -1, then the
    # minimum width is unset.
    def min_width=(min_width : Int32) : Nil
      # gtk_tree_view_column_set_min_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_min_width(@pointer, min_width)

      # Return value handling
    end

    # If @reorderable is %TRUE, then the column can be reordered by the end user
    # dragging the header.
    def reorderable=(reorderable : Bool) : Nil
      # gtk_tree_view_column_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_reorderable(@pointer, reorderable)

      # Return value handling
    end

    # If @resizable is %TRUE, then the user can explicitly resize the column by
    # grabbing the outer edge of the column button.
    #
    # If resizable is %TRUE and
    # sizing mode of the column is %GTK_TREE_VIEW_COLUMN_AUTOSIZE, then the sizing
    # mode is changed to %GTK_TREE_VIEW_COLUMN_GROW_ONLY.
    def resizable=(resizable : Bool) : Nil
      # gtk_tree_view_column_set_resizable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_resizable(@pointer, resizable)

      # Return value handling
    end

    # Sets the growth behavior of @tree_column to @type.
    def sizing=(type : Gtk::TreeViewColumnSizing) : Nil
      # gtk_tree_view_column_set_sizing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_sizing(@pointer, type)

      # Return value handling
    end

    # Sets the logical @sort_column_id that this column sorts on when this column
    # is selected for sorting.  Doing so makes the column header clickable.
    def sort_column_id=(sort_column_id : Int32) : Nil
      # gtk_tree_view_column_set_sort_column_id: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_sort_column_id(@pointer, sort_column_id)

      # Return value handling
    end

    # Call this function with a @setting of %TRUE to display an arrow in
    # the header button indicating the column is sorted. Call
    # gtk_tree_view_column_set_sort_order() to change the direction of
    # the arrow.
    def sort_indicator=(setting : Bool) : Nil
      # gtk_tree_view_column_set_sort_indicator: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_sort_indicator(@pointer, setting)

      # Return value handling
    end

    # Changes the appearance of the sort indicator.
    #
    # This does not actually sort the model.  Use
    # gtk_tree_view_column_set_sort_column_id() if you want automatic sorting
    # support.  This function is primarily for custom sorting behavior, and should
    # be used in conjunction with gtk_tree_sortable_set_sort_column_id() to do
    # that. For custom models, the mechanism will vary.
    #
    # The sort indicator changes direction to indicate normal sort or reverse sort.
    # Note that you must have the sort indicator enabled to see anything when
    # calling this function; see gtk_tree_view_column_set_sort_indicator().
    def sort_order=(order : Gtk::SortType) : Nil
      # gtk_tree_view_column_set_sort_order: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_sort_order(@pointer, order)

      # Return value handling
    end

    # Sets the spacing field of @tree_column, which is the number of pixels to
    # place between cell renderers packed into it.
    def spacing=(spacing : Int32) : Nil
      # gtk_tree_view_column_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_spacing(@pointer, spacing)

      # Return value handling
    end

    # Sets the title of the @tree_column.  If a custom widget has been set, then
    # this value is ignored.
    def title=(title : ::String) : Nil
      # gtk_tree_view_column_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_title(@pointer, title)

      # Return value handling
    end

    # Sets the visibility of @tree_column.
    def visible=(visible : Bool) : Nil
      # gtk_tree_view_column_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_view_column_set_visible(@pointer, visible)

      # Return value handling
    end

    # Sets the widget in the header to be @widget.  If widget is %NULL, then the
    # header button is set with a `GtkLabel` set to the title of @tree_column.
    def widget=(widget : Gtk::Widget?) : Nil
      # gtk_tree_view_column_set_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_view_column_set_widget(@pointer, widget)

      # Return value handling
    end

    # Emitted when the column's header has been clicked.
    struct ClickedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "clicked::#{@detail}" : "clicked"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TreeViewColumn, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeViewColumn.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeViewColumn, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreeViewColumn, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TreeViewColumn.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeViewColumn, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "clicked")
      end
    end

    def clicked_signal
      ClickedSignal.new(self)
    end
  end
end
