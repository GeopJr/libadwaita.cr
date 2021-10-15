require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./scrollable"

module Gtk
  # A widget for displaying both trees and lists
  #
  # Widget that displays any object that implements the [iface@Gtk.TreeModel] interface.
  #
  # Please refer to the [tree widget conceptual overview](section-tree-widget.html)
  # for an overview of all the objects and data types related to the tree
  # widget and how they work together.
  #
  # ## Coordinate systems in GtkTreeView API
  #
  # Several different coordinate systems are exposed in the `GtkTreeView` API.
  # These are:
  #
  # ![](tree-view-coordinates.png)
  #
  # - Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
  #
  # - Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
  #
  # - Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
  #   coordinates start at (0, 0) for row 0 of the tree.
  #
  # Several functions are available for converting between the different
  # coordinate systems.  The most common translations are between widget and bin
  # window coordinates and between bin window and tree coordinates. For the
  # former you can use [method@Gtk.TreeView.convert_widget_to_bin_window_coords]
  # (and vice versa), for the latter [method@Gtk.TreeView.convert_bin_window_to_tree_coords]
  # (and vice versa).
  #
  # ## `GtkTreeView` as `GtkBuildable`
  #
  # The `GtkTreeView` implementation of the `GtkBuildable` interface accepts
  # [class@Gtk.TreeViewColumn] objects as `<child>` elements and exposes the
  # internal [class@Gtk.TreeSelection] in UI definitions.
  #
  # An example of a UI definition fragment with `GtkTreeView`:
  #
  # ```xml
  # <object class="GtkTreeView" id="treeview">
  #   <property name="model">liststore1</property>
  #   <child>
  #     <object class="GtkTreeViewColumn" id="test-column">
  #       <property name="title">Test</property>
  #       <child>
  #         <object class="GtkCellRendererText" id="test-renderer"/>
  #         <attributes>
  #           <attribute name="text">1</attribute>
  #         </attributes>
  #       </child>
  #     </object>
  #   </child>
  #   <child internal-child="selection">
  #     <object class="GtkTreeSelection" id="selection">
  #       <signal name="changed" handler="on_treeview_selection_changed"/>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # ## CSS nodes
  #
  # ```
  # treeview.view
  # ├── header
  # │ ├── button
  # │ │ ╰── [sort - indicator]
  # ┊ ┊
  # │ ╰── button
  # │ ╰── [sort - indicator]
  # │
  # ├── [rubberband]
  # ╰── [dndtarget]
  # ```
  #
  # `GtkTreeView` has a main CSS node with name `treeview` and style class `.view`.
  # It has a subnode with name `header`, which is the parent for all the column
  # header widgets' CSS nodes.
  #
  # Each column header consists of a `button`, which among other content, has a
  # child with name `sort-indicator`, which carries the `.ascending` or `.descending`
  # style classes when the column header should show a sort indicator. The CSS
  # is expected to provide a suitable image using the `-gtk-icon-source` property.
  #
  # For rubberband selection, a subnode with name `rubberband` is used.
  #
  # For the drop target location during DND, a subnode with name `dndtarget` is used.
  class TreeView < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_grid_lines : Gtk::TreeViewGridLines? = nil, enable_search : Bool? = nil, enable_tree_lines : Bool? = nil, expander_column : Gtk::TreeViewColumn? = nil, fixed_height_mode : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, headers_clickable : Bool? = nil, headers_visible : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hover_expand : Bool? = nil, hover_selection : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, layout_manager : Gtk::LayoutManager? = nil, level_indentation : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reorderable : Bool? = nil, root : Gtk::Root? = nil, rubber_banding : Bool? = nil, scale_factor : Int32? = nil, search_column : Int32? = nil, sensitive : Bool? = nil, show_expanders : Bool? = nil, tooltip_column : Int32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[56]
      _values = StaticArray(LibGObject::Value, 56).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if activate_on_single_click
        (_names.to_unsafe + _n).value = "activate-on-single-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activate_on_single_click)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if enable_grid_lines
        (_names.to_unsafe + _n).value = "enable-grid-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_grid_lines)
        _n += 1
      end
      if enable_search
        (_names.to_unsafe + _n).value = "enable-search".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_search)
        _n += 1
      end
      if enable_tree_lines
        (_names.to_unsafe + _n).value = "enable-tree-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_tree_lines)
        _n += 1
      end
      if expander_column
        (_names.to_unsafe + _n).value = "expander-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expander_column)
        _n += 1
      end
      if fixed_height_mode
        (_names.to_unsafe + _n).value = "fixed-height-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_height_mode)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if hadjustment
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if headers_clickable
        (_names.to_unsafe + _n).value = "headers-clickable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, headers_clickable)
        _n += 1
      end
      if headers_visible
        (_names.to_unsafe + _n).value = "headers-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, headers_visible)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if hover_expand
        (_names.to_unsafe + _n).value = "hover-expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hover_expand)
        _n += 1
      end
      if hover_selection
        (_names.to_unsafe + _n).value = "hover-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hover_selection)
        _n += 1
      end
      if hscroll_policy
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if level_indentation
        (_names.to_unsafe + _n).value = "level-indentation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, level_indentation)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if reorderable
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if rubber_banding
        (_names.to_unsafe + _n).value = "rubber-banding".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rubber_banding)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if search_column
        (_names.to_unsafe + _n).value = "search-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_column)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_expanders
        (_names.to_unsafe + _n).value = "show-expanders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_expanders)
        _n += 1
      end
      if tooltip_column
        (_names.to_unsafe + _n).value = "tooltip-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_column)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if vadjustment
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if vscroll_policy
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeView.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_view_get_type
    end

    def initialize
      # gtk_tree_view_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_new
      @pointer = _retval
    end

    def self.new_with_model(model : Gtk::TreeModel) : Gtk::Widget
      # gtk_tree_view_new_with_model: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_new_with_model(model)
      Gtk::TreeView.new(_retval, GICrystal::Transfer::Full)
    end

    def append_column(column : Gtk::TreeViewColumn) : Int32
      # gtk_tree_view_append_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_append_column(self, column)
      _retval
    end

    def collapse_all : Nil
      # gtk_tree_view_collapse_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_collapse_all(self)
    end

    def collapse_row(path : Gtk::TreePath) : Bool
      # gtk_tree_view_collapse_row: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_collapse_row(self, path)
      GICrystal.to_bool(_retval)
    end

    def columns_autosize : Nil
      # gtk_tree_view_columns_autosize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_columns_autosize(self)
    end

    def convert_bin_window_to_tree_coords(bx : Int32, by : Int32, tx : Int32, ty : Int32) : Nil
      # gtk_tree_view_convert_bin_window_to_tree_coords: (Method)
      # @tx: (out) (transfer full)
      # @ty: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_bin_window_to_tree_coords(self, bx, by, tx, ty)
    end

    def convert_bin_window_to_widget_coords(bx : Int32, by : Int32, wx : Int32, wy : Int32) : Nil
      # gtk_tree_view_convert_bin_window_to_widget_coords: (Method)
      # @wx: (out) (transfer full)
      # @wy: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_bin_window_to_widget_coords(self, bx, by, wx, wy)
    end

    def convert_tree_to_bin_window_coords(tx : Int32, ty : Int32, bx : Int32, by : Int32) : Nil
      # gtk_tree_view_convert_tree_to_bin_window_coords: (Method)
      # @bx: (out) (transfer full)
      # @by: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_tree_to_bin_window_coords(self, tx, ty, bx, by)
    end

    def convert_tree_to_widget_coords(tx : Int32, ty : Int32, wx : Int32, wy : Int32) : Nil
      # gtk_tree_view_convert_tree_to_widget_coords: (Method)
      # @wx: (out) (transfer full)
      # @wy: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_tree_to_widget_coords(self, tx, ty, wx, wy)
    end

    def convert_widget_to_bin_window_coords(wx : Int32, wy : Int32, bx : Int32, by : Int32) : Nil
      # gtk_tree_view_convert_widget_to_bin_window_coords: (Method)
      # @bx: (out) (transfer full)
      # @by: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_widget_to_bin_window_coords(self, wx, wy, bx, by)
    end

    def convert_widget_to_tree_coords(wx : Int32, wy : Int32, tx : Int32, ty : Int32) : Nil
      # gtk_tree_view_convert_widget_to_tree_coords: (Method)
      # @tx: (out) (transfer full)
      # @ty: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_convert_widget_to_tree_coords(self, wx, wy, tx, ty)
    end

    def create_row_drag_icon(path : Gtk::TreePath) : Gdk::Paintable?
      # gtk_tree_view_create_row_drag_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_view_create_row_drag_icon(self, path)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def enable_model_drag_dest(formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_tree_view_enable_model_drag_dest: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_enable_model_drag_dest(self, formats, actions)
    end

    def enable_model_drag_source(start_button_mask : Gdk::ModifierType, formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_tree_view_enable_model_drag_source: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_enable_model_drag_source(self, start_button_mask, formats, actions)
    end

    def expand_all : Nil
      # gtk_tree_view_expand_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_expand_all(self)
    end

    def expand_row(path : Gtk::TreePath, open_all : Bool) : Bool
      # gtk_tree_view_expand_row: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_expand_row(self, path, open_all)
      GICrystal.to_bool(_retval)
    end

    def expand_to_path(path : Gtk::TreePath) : Nil
      # gtk_tree_view_expand_to_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_expand_to_path(self, path)
    end

    def activate_on_single_click? : Bool
      # gtk_tree_view_get_activate_on_single_click: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_activate_on_single_click(self)
      GICrystal.to_bool(_retval)
    end

    def background_area(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?) : Gdk::Rectangle
      # gtk_tree_view_get_background_area: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      rect = Gdk::Rectangle.new

      LibGtk.gtk_tree_view_get_background_area(self, path, column, rect)
      rect
    end

    def cell_area(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?) : Gdk::Rectangle
      # gtk_tree_view_get_cell_area: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      rect = Gdk::Rectangle.new

      LibGtk.gtk_tree_view_get_cell_area(self, path, column, rect)
      rect
    end

    def column(n : Int32) : Gtk::TreeViewColumn?
      # gtk_tree_view_get_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_column(self, n)
      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def columns : GLib::List
      # gtk_tree_view_get_columns: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_tree_view_get_columns(self)
      GLib::List(Gtk::TreeViewColumn).new(_retval, GICrystal::Transfer::Container)
    end

    def cursor : Nil
      # gtk_tree_view_get_cursor: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @focus_column: (out) (nullable) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      focus_column = Pointer(Pointer(Void)).null
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      focus_column = if focus_column.nil?
                       Pointer(Void).null
                     else
                       focus_column.to_unsafe
                     end

      LibGtk.gtk_tree_view_get_cursor(self, path, focus_column)
    end

    def dest_row_at_pos(drag_x : Int32, drag_y : Int32) : Bool
      # gtk_tree_view_get_dest_row_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      pos = Pointer(UInt32).null
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      _retval = LibGtk.gtk_tree_view_get_dest_row_at_pos(self, drag_x, drag_y, path, pos)
      GICrystal.to_bool(_retval)
    end

    def drag_dest_row : Nil
      # gtk_tree_view_get_drag_dest_row: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      pos = Pointer(UInt32).null
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      LibGtk.gtk_tree_view_get_drag_dest_row(self, path, pos)
    end

    def enable_search? : Bool
      # gtk_tree_view_get_enable_search: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_enable_search(self)
      GICrystal.to_bool(_retval)
    end

    def enable_tree_lines? : Bool
      # gtk_tree_view_get_enable_tree_lines: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_enable_tree_lines(self)
      GICrystal.to_bool(_retval)
    end

    def expander_column : Gtk::TreeViewColumn?
      # gtk_tree_view_get_expander_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_expander_column(self)
      Gtk::TreeViewColumn.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def fixed_height_mode? : Bool
      # gtk_tree_view_get_fixed_height_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_fixed_height_mode(self)
      GICrystal.to_bool(_retval)
    end

    def grid_lines : Gtk::TreeViewGridLines
      # gtk_tree_view_get_grid_lines: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_grid_lines(self)
      Gtk::TreeViewGridLines.from_value(_retval)
    end

    def headers_clickable? : Bool
      # gtk_tree_view_get_headers_clickable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_headers_clickable(self)
      GICrystal.to_bool(_retval)
    end

    def headers_visible? : Bool
      # gtk_tree_view_get_headers_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_headers_visible(self)
      GICrystal.to_bool(_retval)
    end

    def hover_expand? : Bool
      # gtk_tree_view_get_hover_expand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_hover_expand(self)
      GICrystal.to_bool(_retval)
    end

    def hover_selection? : Bool
      # gtk_tree_view_get_hover_selection: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_hover_selection(self)
      GICrystal.to_bool(_retval)
    end

    def level_indentation : Int32
      # gtk_tree_view_get_level_indentation: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_level_indentation(self)
      _retval
    end

    def model : Gtk::TreeModel?
      # gtk_tree_view_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_model(self)
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def n_columns : UInt32
      # gtk_tree_view_get_n_columns: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_n_columns(self)
      _retval
    end

    def path_at_pos(x : Int32, y : Int32) : Bool
      # gtk_tree_view_get_path_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @column: (out) (nullable) (optional)
      # @cell_x: (out) (transfer full) (optional)
      # @cell_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      column = Pointer(Pointer(Void)).null
      cell_x = Pointer(Int32).null
      cell_y = Pointer(Int32).null
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      _retval = LibGtk.gtk_tree_view_get_path_at_pos(self, x, y, path, column, cell_x, cell_y)
      GICrystal.to_bool(_retval)
    end

    def reorderable? : Bool
      # gtk_tree_view_get_reorderable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_reorderable(self)
      GICrystal.to_bool(_retval)
    end

    def rubber_banding? : Bool
      # gtk_tree_view_get_rubber_banding: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_rubber_banding(self)
      GICrystal.to_bool(_retval)
    end

    def search_column : Int32
      # gtk_tree_view_get_search_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_search_column(self)
      _retval
    end

    def search_entry : Gtk::Editable?
      # gtk_tree_view_get_search_entry: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_search_entry(self)
      Gtk::Editable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def selection : Gtk::TreeSelection
      # gtk_tree_view_get_selection: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_selection(self)
      Gtk::TreeSelection.new(_retval, GICrystal::Transfer::None)
    end

    def show_expanders? : Bool
      # gtk_tree_view_get_show_expanders: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_show_expanders(self)
      GICrystal.to_bool(_retval)
    end

    def tooltip_column : Int32
      # gtk_tree_view_get_tooltip_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_get_tooltip_column(self)
      _retval
    end

    def tooltip_context(x : Int32, y : Int32, keyboard_tip : Bool) : Gtk::TreeIter
      # gtk_tree_view_get_tooltip_context: (Method)
      # @model: (out) (nullable) (optional)
      # @path: (out) (transfer full) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      model = Pointer(Pointer(Void)).null
      path = Pointer(Pointer(Void)).null
      iter = Pointer(Void).null
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      iter = Gtk::TreeIter.new

      _retval = LibGtk.gtk_tree_view_get_tooltip_context(self, x, y, keyboard_tip, model, path, iter)
      iter
    end

    def visible_range : Bool
      # gtk_tree_view_get_visible_range: (Method)
      # @start_path: (out) (transfer full) (optional)
      # @end_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      start_path = Pointer(Pointer(Void)).null
      end_path = Pointer(Pointer(Void)).null

      _retval = LibGtk.gtk_tree_view_get_visible_range(self, start_path, end_path)
      GICrystal.to_bool(_retval)
    end

    def visible_rect : Gdk::Rectangle
      # gtk_tree_view_get_visible_rect: (Method)
      # @visible_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      visible_rect = Gdk::Rectangle.new

      LibGtk.gtk_tree_view_get_visible_rect(self, visible_rect)
      visible_rect
    end

    def insert_column(column : Gtk::TreeViewColumn, position : Int32) : Int32
      # gtk_tree_view_insert_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_insert_column(self, column, position)
      _retval
    end

    def insert_column_with_data_func(position : Int32, title : ::String, cell : Gtk::CellRenderer, func : Pointer(Void), data : Pointer(Nil)?, dnotify : Pointer(Void)) : Int32
      # gtk_tree_view_insert_column_with_data_func: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      _retval = LibGtk.gtk_tree_view_insert_column_with_data_func(self, position, title, cell, func, data, dnotify)
      _retval
    end

    def is_blank_at_pos(x : Int32, y : Int32) : Bool
      # gtk_tree_view_is_blank_at_pos: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @column: (out) (nullable) (optional)
      # @cell_x: (out) (transfer full) (optional)
      # @cell_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      column = Pointer(Pointer(Void)).null
      cell_x = Pointer(Int32).null
      cell_y = Pointer(Int32).null
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      _retval = LibGtk.gtk_tree_view_is_blank_at_pos(self, x, y, path, column, cell_x, cell_y)
      GICrystal.to_bool(_retval)
    end

    def is_rubber_banding_active : Bool
      # gtk_tree_view_is_rubber_banding_active: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_is_rubber_banding_active(self)
      GICrystal.to_bool(_retval)
    end

    def map_expanded_rows(func : Pointer(Void), data : Pointer(Nil)?) : Nil
      # gtk_tree_view_map_expanded_rows: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGtk.gtk_tree_view_map_expanded_rows(self, func, data)
    end

    def move_column_after(column : Gtk::TreeViewColumn, base_column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_move_column_after: (Method)
      # @base_column: (nullable)
      # Returns: (transfer none)

      base_column = if base_column.nil?
                      Pointer(Void).null
                    else
                      base_column.to_unsafe
                    end

      LibGtk.gtk_tree_view_move_column_after(self, column, base_column)
    end

    def remove_column(column : Gtk::TreeViewColumn) : Int32
      # gtk_tree_view_remove_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_remove_column(self, column)
      _retval
    end

    def row_activated(path : Gtk::TreePath, column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_row_activated: (Method)
      # @column: (nullable)
      # Returns: (transfer none)

      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      LibGtk.gtk_tree_view_row_activated(self, path, column)
    end

    def row_expanded(path : Gtk::TreePath) : Bool
      # gtk_tree_view_row_expanded: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_view_row_expanded(self, path)
      GICrystal.to_bool(_retval)
    end

    def scroll_to_cell(path : Gtk::TreePath?, column : Gtk::TreeViewColumn?, use_align : Bool, row_align : Float32, col_align : Float32) : Nil
      # gtk_tree_view_scroll_to_cell: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      LibGtk.gtk_tree_view_scroll_to_cell(self, path, column, use_align, row_align, col_align)
    end

    def scroll_to_point(tree_x : Int32, tree_y : Int32) : Nil
      # gtk_tree_view_scroll_to_point: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_scroll_to_point(self, tree_x, tree_y)
    end

    def activate_on_single_click=(single : Bool) : Nil
      # gtk_tree_view_set_activate_on_single_click: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_activate_on_single_click(self, single)
    end

    def set_column_drag_function(func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_view_set_column_drag_function: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      func = if func.nil?
               LibGtk::TreeViewColumnDropFunc.null
             else
               func.to_unsafe
             end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      LibGtk.gtk_tree_view_set_column_drag_function(self, func, user_data, destroy)
    end

    def set_cursor(path : Gtk::TreePath, focus_column : Gtk::TreeViewColumn?, start_editing : Bool) : Nil
      # gtk_tree_view_set_cursor: (Method)
      # @focus_column: (nullable)
      # Returns: (transfer none)

      focus_column = if focus_column.nil?
                       Pointer(Void).null
                     else
                       focus_column.to_unsafe
                     end

      LibGtk.gtk_tree_view_set_cursor(self, path, focus_column, start_editing)
    end

    def set_cursor_on_cell(path : Gtk::TreePath, focus_column : Gtk::TreeViewColumn?, focus_cell : Gtk::CellRenderer?, start_editing : Bool) : Nil
      # gtk_tree_view_set_cursor_on_cell: (Method)
      # @focus_column: (nullable)
      # @focus_cell: (nullable)
      # Returns: (transfer none)

      focus_column = if focus_column.nil?
                       Pointer(Void).null
                     else
                       focus_column.to_unsafe
                     end
      focus_cell = if focus_cell.nil?
                     Pointer(Void).null
                   else
                     focus_cell.to_unsafe
                   end

      LibGtk.gtk_tree_view_set_cursor_on_cell(self, path, focus_column, focus_cell, start_editing)
    end

    def set_drag_dest_row(path : Gtk::TreePath?, pos : Gtk::TreeViewDropPosition) : Nil
      # gtk_tree_view_set_drag_dest_row: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      LibGtk.gtk_tree_view_set_drag_dest_row(self, path, pos)
    end

    def enable_search=(enable_search : Bool) : Nil
      # gtk_tree_view_set_enable_search: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_enable_search(self, enable_search)
    end

    def enable_tree_lines=(enabled : Bool) : Nil
      # gtk_tree_view_set_enable_tree_lines: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_enable_tree_lines(self, enabled)
    end

    def expander_column=(column : Gtk::TreeViewColumn?) : Nil
      # gtk_tree_view_set_expander_column: (Method)
      # @column: (nullable)
      # Returns: (transfer none)

      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      LibGtk.gtk_tree_view_set_expander_column(self, column)
    end

    def fixed_height_mode=(enable : Bool) : Nil
      # gtk_tree_view_set_fixed_height_mode: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_fixed_height_mode(self, enable)
    end

    def grid_lines=(grid_lines : Gtk::TreeViewGridLines) : Nil
      # gtk_tree_view_set_grid_lines: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_grid_lines(self, grid_lines)
    end

    def headers_clickable=(setting : Bool) : Nil
      # gtk_tree_view_set_headers_clickable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_headers_clickable(self, setting)
    end

    def headers_visible=(headers_visible : Bool) : Nil
      # gtk_tree_view_set_headers_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_headers_visible(self, headers_visible)
    end

    def hover_expand=(expand : Bool) : Nil
      # gtk_tree_view_set_hover_expand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_hover_expand(self, expand)
    end

    def hover_selection=(hover : Bool) : Nil
      # gtk_tree_view_set_hover_selection: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_hover_selection(self, hover)
    end

    def level_indentation=(indentation : Int32) : Nil
      # gtk_tree_view_set_level_indentation: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_level_indentation(self, indentation)
    end

    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_tree_view_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_tree_view_set_model(self, model)
    end

    def reorderable=(reorderable : Bool) : Nil
      # gtk_tree_view_set_reorderable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_reorderable(self, reorderable)
    end

    def set_row_separator_func(func : Pointer(Void)?, data : Pointer(Nil)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_view_set_row_separator_func: (Method)
      # @func: (nullable)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      func = if func.nil?
               LibGtk::TreeViewRowSeparatorFunc.null
             else
               func.to_unsafe
             end
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      LibGtk.gtk_tree_view_set_row_separator_func(self, func, data, destroy)
    end

    def rubber_banding=(enable : Bool) : Nil
      # gtk_tree_view_set_rubber_banding: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_rubber_banding(self, enable)
    end

    def search_column=(column : Int32) : Nil
      # gtk_tree_view_set_search_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_search_column(self, column)
    end

    def search_entry=(entry : Gtk::Editable?) : Nil
      # gtk_tree_view_set_search_entry: (Method)
      # @entry: (nullable)
      # Returns: (transfer none)

      entry = if entry.nil?
                Pointer(Void).null
              else
                entry.to_unsafe
              end

      LibGtk.gtk_tree_view_set_search_entry(self, entry)
    end

    def set_search_equal_func(search_equal_func : Pointer(Void), search_user_data : Pointer(Nil)?, search_destroy : Pointer(Void)?) : Nil
      # gtk_tree_view_set_search_equal_func: (Method)
      # @search_user_data: (nullable)
      # @search_destroy: (nullable)
      # Returns: (transfer none)

      search_user_data = if search_user_data.nil?
                           Pointer(Void).null
                         else
                           search_user_data.to_unsafe
                         end
      search_destroy = if search_destroy.nil?
                         LibGLib::DestroyNotify.null
                       else
                         search_destroy.to_unsafe
                       end

      LibGtk.gtk_tree_view_set_search_equal_func(self, search_equal_func, search_user_data, search_destroy)
    end

    def show_expanders=(enabled : Bool) : Nil
      # gtk_tree_view_set_show_expanders: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_show_expanders(self, enabled)
    end

    def set_tooltip_cell(tooltip : Gtk::Tooltip, path : Gtk::TreePath?, column : Gtk::TreeViewColumn?, cell : Gtk::CellRenderer?) : Nil
      # gtk_tree_view_set_tooltip_cell: (Method)
      # @path: (nullable)
      # @column: (nullable)
      # @cell: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end
      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      LibGtk.gtk_tree_view_set_tooltip_cell(self, tooltip, path, column, cell)
    end

    def tooltip_column=(column : Int32) : Nil
      # gtk_tree_view_set_tooltip_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_tooltip_column(self, column)
    end

    def set_tooltip_row(tooltip : Gtk::Tooltip, path : Gtk::TreePath) : Nil
      # gtk_tree_view_set_tooltip_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_set_tooltip_row(self, tooltip, path)
    end

    def unset_rows_drag_dest : Nil
      # gtk_tree_view_unset_rows_drag_dest: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_unset_rows_drag_dest(self)
    end

    def unset_rows_drag_source : Nil
      # gtk_tree_view_unset_rows_drag_source: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_view_unset_rows_drag_source(self)
    end

    struct ColumnsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "columns-changed::#{@detail}" : "columns-changed"
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

      def connect(block : Proc(Gtk::TreeView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "columns-changed")
      end
    end

    def columns_changed_signal
      ColumnsChangedSignal.new(self)
    end

    struct CursorChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cursor-changed::#{@detail}" : "cursor-changed"
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

      def connect(block : Proc(Gtk::TreeView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cursor-changed")
      end
    end

    def cursor_changed_signal
      CursorChangedSignal.new(self)
    end

    struct ExpandCollapseCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "expand-collapse-cursor-row::#{@detail}" : "expand-collapse-cursor-row"
      end

      def connect(&block : Proc(Bool, Bool, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool, Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Bool, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : LibC::Int, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Bool, Bool, Bool, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : LibC::Int, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Bool, Bool, Bool, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : LibC::Int, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::TreeView, Bool, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : LibC::Int, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::TreeView, Bool, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Bool, p0 : Bool, p1 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "expand-collapse-cursor-row", object, p0, p1)
      end
    end

    def expand_collapse_cursor_row_signal
      ExpandCollapseCursorRowSignal.new(self)
    end

    struct MoveCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::TreeView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, direction : Int32, _extend : Bool, modify : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, direction, _extend, modify)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    struct RowActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-activated::#{@detail}" : "row-activated"
      end

      def connect(&block : Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeViewColumn.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeViewColumn.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreePath, Gtk::TreeViewColumn, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeViewColumn.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeViewColumn.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreePath, Gtk::TreeViewColumn, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : Gtk::TreePath, column : Gtk::TreeViewColumn) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-activated", path, column)
      end
    end

    def row_activated_signal
      RowActivatedSignal.new(self)
    end

    struct RowCollapsedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-collapsed::#{@detail}" : "row-collapsed"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-collapsed", iter, path)
      end
    end

    def row_collapsed_signal
      RowCollapsedSignal.new(self)
    end

    struct RowExpandedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-expanded::#{@detail}" : "row-expanded"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-expanded", iter, path)
      end
    end

    def row_expanded_signal
      RowExpandedSignal.new(self)
    end

    struct SelectAllSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-all::#{@detail}" : "select-all"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all")
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

    struct SelectCursorParentSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-cursor-parent::#{@detail}" : "select-cursor-parent"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-parent")
      end
    end

    def select_cursor_parent_signal
      SelectCursorParentSignal.new(self)
    end

    struct SelectCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-cursor-row::#{@detail}" : "select-cursor-row"
      end

      def connect(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::TreeView, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::TreeView, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-row", object)
      end
    end

    def select_cursor_row_signal
      SelectCursorRowSignal.new(self)
    end

    struct StartInteractiveSearchSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "start-interactive-search::#{@detail}" : "start-interactive-search"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "start-interactive-search")
      end
    end

    def start_interactive_search_signal
      StartInteractiveSearchSignal.new(self)
    end

    struct TestCollapseRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "test-collapse-row::#{@detail}" : "test-collapse-row"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "test-collapse-row", iter, path)
      end
    end

    def test_collapse_row_signal
      TestCollapseRowSignal.new(self)
    end

    struct TestExpandRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "test-expand-row::#{@detail}" : "test-expand-row"
      end

      def connect(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreePath.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Gtk::TreeIter, Gtk::TreePath, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(iter : Gtk::TreeIter, path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "test-expand-row", iter, path)
      end
    end

    def test_expand_row_signal
      TestExpandRowSignal.new(self)
    end

    struct ToggleCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-cursor-row::#{@detail}" : "toggle-cursor-row"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-row")
      end
    end

    def toggle_cursor_row_signal
      ToggleCursorRowSignal.new(self)
    end

    struct UnselectAllSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unselect-all::#{@detail}" : "unselect-all"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unselect-all")
      end
    end

    def unselect_all_signal
      UnselectAllSignal.new(self)
    end
  end
end
