require "../g_object-2.0/initially_unowned"
require "./buildable"

require "./cell_layout"

module Gtk
  # A visible column in a GtkTreeView widget
  #
  # The GtkTreeViewColumn object represents a visible column in a `GtkTreeView` widget.
  # It allows to set properties of the column header, and functions as a holding pen
  # for the cell renderers which determine how the data in the column is displayed.
  #
  # Please refer to the [tree widget conceptual overview][TreeWidget]
  # for an overview of all the objects and data types related to the tree widget and
  # how they work together, and to the `GtkTreeView` documentation for specifics about
  # the CSS node structure for treeviews and their headers.
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

    def cell_area=(value : CellArea?) : CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize
      # gtk_tree_view_column_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_new
      @pointer = _retval
    end

    def self.new_with_area(area : Gtk::CellArea) : Gtk::TreeViewColumn
      # gtk_tree_view_column_new_with_area: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_new_with_area(area)
      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::Full)
    end

    def add_attribute(cell_renderer : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_tree_view_column_add_attribute: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_add_attribute(self, cell_renderer, attribute, column)
    end

    def cell_get_position(cell_renderer : Gtk::CellRenderer) : Bool
      # gtk_tree_view_column_cell_get_position: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      x_offset = Pointer(Int32).null
      width = Pointer(Int32).null

      _retval = LibGtk.gtk_tree_view_column_cell_get_position(self, cell_renderer, x_offset, width)
      GICrystal.to_bool(_retval)
    end

    def cell_get_size : Nil
      # gtk_tree_view_column_cell_get_size: (Method)
      # @x_offset: (out) (transfer full) (optional)
      # @y_offset: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      x_offset = Pointer(Int32).null
      y_offset = Pointer(Int32).null
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibGtk.gtk_tree_view_column_cell_get_size(self, x_offset, y_offset, width, height)
    end

    def cell_is_visible : Bool
      # gtk_tree_view_column_cell_is_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_cell_is_visible(self)
      GICrystal.to_bool(_retval)
    end

    def cell_set_cell_data(tree_model : Gtk::TreeModel, iter : Gtk::TreeIter, is_expander : Bool, is_expanded : Bool) : Nil
      # gtk_tree_view_column_cell_set_cell_data: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_cell_set_cell_data(self, tree_model, iter, is_expander, is_expanded)
    end

    def clear : Nil
      # gtk_tree_view_column_clear: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_clear(self)
    end

    def clear_attributes(cell_renderer : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_clear_attributes: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_clear_attributes(self, cell_renderer)
    end

    def clicked : Nil
      # gtk_tree_view_column_clicked: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_clicked(self)
    end

    def focus_cell(cell : Gtk::CellRenderer) : Nil
      # gtk_tree_view_column_focus_cell: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_focus_cell(self, cell)
    end

    def alignment : Float32
      # gtk_tree_view_column_get_alignment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_alignment(self)
      _retval
    end

    def button : Gtk::Widget
      # gtk_tree_view_column_get_button: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_button(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def clickable? : Bool
      # gtk_tree_view_column_get_clickable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_clickable(self)
      GICrystal.to_bool(_retval)
    end

    def expand? : Bool
      # gtk_tree_view_column_get_expand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_expand(self)
      GICrystal.to_bool(_retval)
    end

    def fixed_width : Int32
      # gtk_tree_view_column_get_fixed_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_fixed_width(self)
      _retval
    end

    def max_width : Int32
      # gtk_tree_view_column_get_max_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_max_width(self)
      _retval
    end

    def min_width : Int32
      # gtk_tree_view_column_get_min_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_min_width(self)
      _retval
    end

    def reorderable? : Bool
      # gtk_tree_view_column_get_reorderable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_reorderable(self)
      GICrystal.to_bool(_retval)
    end

    def resizable? : Bool
      # gtk_tree_view_column_get_resizable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_resizable(self)
      GICrystal.to_bool(_retval)
    end

    def sizing : Gtk::TreeViewColumnSizing
      # gtk_tree_view_column_get_sizing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_sizing(self)
      Gtk::TreeViewColumnSizing.from_value(_retval)
    end

    def sort_column_id : Int32
      # gtk_tree_view_column_get_sort_column_id: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_sort_column_id(self)
      _retval
    end

    def sort_indicator? : Bool
      # gtk_tree_view_column_get_sort_indicator: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_sort_indicator(self)
      GICrystal.to_bool(_retval)
    end

    def sort_order : Gtk::SortType
      # gtk_tree_view_column_get_sort_order: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_sort_order(self)
      Gtk::SortType.from_value(_retval)
    end

    def spacing : Int32
      # gtk_tree_view_column_get_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_spacing(self)
      _retval
    end

    def title : ::String
      # gtk_tree_view_column_get_title: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_title(self)
      ::String.new(_retval)
    end

    def tree_view : Gtk::Widget?
      # gtk_tree_view_column_get_tree_view: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_tree_view(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def visible? : Bool
      # gtk_tree_view_column_get_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def widget : Gtk::Widget?
      # gtk_tree_view_column_get_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def width : Int32
      # gtk_tree_view_column_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_width(self)
      _retval
    end

    def x_offset : Int32
      # gtk_tree_view_column_get_x_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_column_get_x_offset(self)
      _retval
    end

    def pack_end(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_end: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_pack_end(self, cell, expand)
    end

    def pack_start(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_tree_view_column_pack_start: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_pack_start(self, cell, expand)
    end

    def queue_resize : Nil
      # gtk_tree_view_column_queue_resize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_queue_resize(self)
    end

    def alignment=(xalign : Float32) : Nil
      # gtk_tree_view_column_set_alignment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_alignment(self, xalign)
    end

    def set_cell_data_func(cell_renderer : Gtk::CellRenderer, func : Pointer(Void)?, func_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_tree_view_column_set_cell_data_func: (Method)
      # @func: (nullable)
      # @func_data: (nullable)
      # Returns: (transfer none)

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

      LibGtk.gtk_tree_view_column_set_cell_data_func(self, cell_renderer, func, func_data, destroy)
    end

    def clickable=(clickable : Bool) : Nil
      # gtk_tree_view_column_set_clickable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_clickable(self, clickable)
    end

    def expand=(expand : Bool) : Nil
      # gtk_tree_view_column_set_expand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_expand(self, expand)
    end

    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_tree_view_column_set_fixed_width: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_fixed_width(self, fixed_width)
    end

    def max_width=(max_width : Int32) : Nil
      # gtk_tree_view_column_set_max_width: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_max_width(self, max_width)
    end

    def min_width=(min_width : Int32) : Nil
      # gtk_tree_view_column_set_min_width: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_min_width(self, min_width)
    end

    def reorderable=(reorderable : Bool) : Nil
      # gtk_tree_view_column_set_reorderable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_reorderable(self, reorderable)
    end

    def resizable=(resizable : Bool) : Nil
      # gtk_tree_view_column_set_resizable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_resizable(self, resizable)
    end

    def sizing=(type : Gtk::TreeViewColumnSizing) : Nil
      # gtk_tree_view_column_set_sizing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_sizing(self, type)
    end

    def sort_column_id=(sort_column_id : Int32) : Nil
      # gtk_tree_view_column_set_sort_column_id: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_sort_column_id(self, sort_column_id)
    end

    def sort_indicator=(setting : Bool) : Nil
      # gtk_tree_view_column_set_sort_indicator: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_sort_indicator(self, setting)
    end

    def sort_order=(order : Gtk::SortType) : Nil
      # gtk_tree_view_column_set_sort_order: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_sort_order(self, order)
    end

    def spacing=(spacing : Int32) : Nil
      # gtk_tree_view_column_set_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_spacing(self, spacing)
    end

    def title=(title : ::String) : Nil
      # gtk_tree_view_column_set_title: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_title(self, title)
    end

    def visible=(visible : Bool) : Nil
      # gtk_tree_view_column_set_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_column_set_visible(self, visible)
    end

    def widget=(widget : Gtk::Widget?) : Nil
      # gtk_tree_view_column_set_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_tree_view_column_set_widget(self, widget)
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
