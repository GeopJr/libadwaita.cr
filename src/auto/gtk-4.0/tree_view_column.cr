require "../g_object-2.0/initially_unowned"
require "./buildable"

require "./cell_layout"

module Gtk
  # A visible column in a [class@Gtk.TreeView] widget
  #
  # The `GtkTreeViewColumn` object represents a visible column in a `GtkTreeView` widget.
  # It allows to set properties of the column header, and functions as a holding pen
  # for the cell renderers which determine how the data in the column is displayed.
  #
  # Please refer to the [tree widget conceptual overview](section-tree-widget.html)
  # for an overview of all the objects and data types related to the tree widget and
  # how they work together, and to the [class@Gtk.TreeView] documentation for specifics
  # about the CSS node structure for treeviews and their headers.
  class TreeViewColumn < GObject::InitiallyUnowned
    include Buildable
    include CellLayout

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, alignment : Float32? = nil, cell_area : Gtk::CellArea? = nil, clickable : Bool? = nil, expand : Bool? = nil, fixed_width : Int32? = nil, max_width : Int32? = nil, min_width : Int32? = nil, reorderable : Bool? = nil, resizable : Bool? = nil, sizing : Gtk::TreeViewColumnSizing? = nil, sort_column_id : Int32? = nil, sort_indicator : Bool? = nil, sort_order : Gtk::SortType? = nil, spacing : Int32? = nil, title : ::String? = nil, visible : Bool? = nil, widget : Gtk::Widget? = nil, width : Int32? = nil, x_offset : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[19]
      _values = StaticArray(LibGObject::Value, 19).new(LibGObject::Value.new)
      _n = 0

      if alignment
        (_names.to_unsafe + _n).value = "alignment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alignment)
        _n += 1
      end
      if cell_area
        (_names.to_unsafe + _n).value = "cell-area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area)
        _n += 1
      end
      if clickable
        (_names.to_unsafe + _n).value = "clickable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, clickable)
        _n += 1
      end
      if expand
        (_names.to_unsafe + _n).value = "expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expand)
        _n += 1
      end
      if fixed_width
        (_names.to_unsafe + _n).value = "fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_width)
        _n += 1
      end
      if max_width
        (_names.to_unsafe + _n).value = "max-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width)
        _n += 1
      end
      if min_width
        (_names.to_unsafe + _n).value = "min-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_width)
        _n += 1
      end
      if reorderable
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if resizable
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
        _n += 1
      end
      if sizing
        (_names.to_unsafe + _n).value = "sizing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sizing)
        _n += 1
      end
      if sort_column_id
        (_names.to_unsafe + _n).value = "sort-column-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_column_id)
        _n += 1
      end
      if sort_indicator
        (_names.to_unsafe + _n).value = "sort-indicator".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_indicator)
        _n += 1
      end
      if sort_order
        (_names.to_unsafe + _n).value = "sort-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sort_order)
        _n += 1
      end
      if spacing
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if x_offset
        (_names.to_unsafe + _n).value = "x-offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, x_offset)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeViewColumn.g_type, _n, _names, _values)
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
      Gtk::TreeViewColumnSizing.from_value(value)
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
      Gtk::SortType.from_value(value)
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

    def initialize
      # gtk_tree_view_column_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def self.new_with_area(area : Gtk::CellArea) : self
      # gtk_tree_view_column_new_with_area: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_new_with_area(area)

      # Return value handling
      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::Full)
    end

    def add_attribute(cell_renderer : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_tree_view_column_add_attribute: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_add_attribute(self, cell_renderer, attribute, column)

      # Return value handling
    end

    def cell_get_position(cell_renderer : Gtk::CellRenderer) : Bool
      # gtk_tree_view_column_cell_get_position: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      x_offset = Pointer(Int32).null
      width = Pointer(Int32).null

      # C call
      _retval = LibGtk.gtk_tree_view_column_cell_get_position(self, cell_renderer, x_offset, width)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def cell_get_size : Nil
      # gtk_tree_view_column_cell_get_size: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @y_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      x_offset = Pointer(Int32).null
      y_offset = Pointer(Int32).null
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_tree_view_column_cell_get_size(self, x_offset, y_offset, width, height)

      # Return value handling
    end

    def cell_is_visible : Bool
      # gtk_tree_view_column_cell_is_visible: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_cell_is_visible(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def cell_set_cell_data(tree_model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
      # gtk_tree_view_column_cell_set_cell_data: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_cell_set_cell_data(self, tree_model, iter, is_expander, is_expanded)

      # Return value handling
    end

    def clear : Nil
      # gtk_tree_view_column_clear: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_clear(self)

      # Return value handling
    end

    def clear_attributes(cell_renderer : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_clear_attributes: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_clear_attributes(self, cell_renderer)

      # Return value handling
    end

    def clicked : Nil
      # gtk_tree_view_column_clicked: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_clicked(self)

      # Return value handling
    end

    def focus_cell(cell : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_focus_cell: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_focus_cell(self, cell)

      # Return value handling
    end

    def alignment : Float32
      # gtk_tree_view_column_get_alignment: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_alignment(self)

      # Return value handling
      _retval
    end

    def button : Gtk::Widget
      # gtk_tree_view_column_get_button: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_button(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def clickable : Bool
      # gtk_tree_view_column_get_clickable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_clickable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def expand : Bool
      # gtk_tree_view_column_get_expand: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_expand(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def fixed_width : Int32
      # gtk_tree_view_column_get_fixed_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_fixed_width(self)

      # Return value handling
      _retval
    end

    def max_width : Int32
      # gtk_tree_view_column_get_max_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_max_width(self)

      # Return value handling
      _retval
    end

    def min_width : Int32
      # gtk_tree_view_column_get_min_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_min_width(self)

      # Return value handling
      _retval
    end

    def reorderable : Bool
      # gtk_tree_view_column_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_reorderable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def resizable : Bool
      # gtk_tree_view_column_get_resizable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_resizable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def sizing : Gtk::TreeViewColumnSizing
      # gtk_tree_view_column_get_sizing: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sizing(self)

      # Return value handling
      Gtk::TreeViewColumnSizing.from_value(_retval)
    end

    def sort_column_id : Int32
      # gtk_tree_view_column_get_sort_column_id: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_column_id(self)

      # Return value handling
      _retval
    end

    def sort_indicator : Bool
      # gtk_tree_view_column_get_sort_indicator: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_indicator(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def sort_order : Gtk::SortType
      # gtk_tree_view_column_get_sort_order: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_sort_order(self)

      # Return value handling
      Gtk::SortType.from_value(_retval)
    end

    def spacing : Int32
      # gtk_tree_view_column_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_spacing(self)

      # Return value handling
      _retval
    end

    def title : ::String
      # gtk_tree_view_column_get_title: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_title(self)

      # Return value handling
      ::String.new(_retval)
    end

    def tree_view : Gtk::Widget?
      # gtk_tree_view_column_get_tree_view: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_tree_view(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def visible : Bool
      # gtk_tree_view_column_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_visible(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def widget : Gtk::Widget?
      # gtk_tree_view_column_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_widget(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def width : Int32
      # gtk_tree_view_column_get_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_width(self)

      # Return value handling
      _retval
    end

    def x_offset : Int32
      # gtk_tree_view_column_get_x_offset: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_view_column_get_x_offset(self)

      # Return value handling
      _retval
    end

    def pack_end(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_pack_end(self, cell, expand)

      # Return value handling
    end

    def pack_start(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_pack_start(self, cell, expand)

      # Return value handling
    end

    def queue_resize : Nil
      # gtk_tree_view_column_queue_resize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_queue_resize(self)

      # Return value handling
    end

    def alignment=(xalign : Float32) : Nil
      # gtk_tree_view_column_set_alignment: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_alignment(self, xalign)

      # Return value handling
    end

    def set_cell_data_func(cell_renderer : Gtk::CellRenderer, func : Pointer(Void)?, func_data : Pointer(Void)?, destroy : Pointer(Void)) : Nil
      # gtk_tree_view_column_set_cell_data_func: (Method)
      # @func: (nullable)
      # @func_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      func = if func.nil?
               LibGtk::TreeCellDataFunc.null
             else
               func.to_unsafe
             end
      func_data = if func_data.nil?
                    Pointer(Void).null
                  else
                    func_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_tree_view_column_set_cell_data_func(self, cell_renderer, func, func_data, destroy)

      # Return value handling
    end

    def clickable=(clickable : Bool) : Nil
      # gtk_tree_view_column_set_clickable: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_clickable(self, clickable)

      # Return value handling
    end

    def expand=(expand : Bool) : Nil
      # gtk_tree_view_column_set_expand: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_expand(self, expand)

      # Return value handling
    end

    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_tree_view_column_set_fixed_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_fixed_width(self, fixed_width)

      # Return value handling
    end

    def max_width=(max_width : Int32) : Nil
      # gtk_tree_view_column_set_max_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_max_width(self, max_width)

      # Return value handling
    end

    def min_width=(min_width : Int32) : Nil
      # gtk_tree_view_column_set_min_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_min_width(self, min_width)

      # Return value handling
    end

    def reorderable=(reorderable : Bool) : Nil
      # gtk_tree_view_column_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_reorderable(self, reorderable)

      # Return value handling
    end

    def resizable=(resizable : Bool) : Nil
      # gtk_tree_view_column_set_resizable: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_resizable(self, resizable)

      # Return value handling
    end

    def sizing=(type : Gtk::TreeViewColumnSizing) : Nil
      # gtk_tree_view_column_set_sizing: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_sizing(self, type)

      # Return value handling
    end

    def sort_column_id=(sort_column_id : Int32) : Nil
      # gtk_tree_view_column_set_sort_column_id: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_sort_column_id(self, sort_column_id)

      # Return value handling
    end

    def sort_indicator=(setting : Bool) : Nil
      # gtk_tree_view_column_set_sort_indicator: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_sort_indicator(self, setting)

      # Return value handling
    end

    def sort_order=(order : Gtk::SortType) : Nil
      # gtk_tree_view_column_set_sort_order: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_sort_order(self, order)

      # Return value handling
    end

    def spacing=(spacing : Int32) : Nil
      # gtk_tree_view_column_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_spacing(self, spacing)

      # Return value handling
    end

    def title=(title : ::String) : Nil
      # gtk_tree_view_column_set_title: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_title(self, title)

      # Return value handling
    end

    def visible=(visible : Bool) : Nil
      # gtk_tree_view_column_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_view_column_set_visible(self, visible)

      # Return value handling
    end

    def widget=(widget : Gtk::Widget?) : Nil
      # gtk_tree_view_column_set_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_view_column_set_widget(self, widget)

      # Return value handling
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeViewColumn.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeViewColumn, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeViewColumn.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeViewColumn, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
