require "./widget"
require "./accessible"

require "./buildable"

require "./cell_layout"

require "./constraint_target"

require "./scrollable"

module Gtk
  # `GtkIconView` is a widget which displays data in a grid of icons.
  #
  # `GtkIconView` provides an alternative view on a `GtkTreeModel`.
  # It displays the model as a grid of icons with labels. Like
  # [class@Gtk.TreeView], it allows to select one or multiple items
  # (depending on the selection mode, see [method@Gtk.IconView.set_selection_mode]).
  # In addition to selection with the arrow keys, `GtkIconView` supports
  # rubberband selection, which is controlled by dragging the pointer.
  #
  # Note that if the tree model is backed by an actual tree store (as
  # opposed to a flat list where the mapping to icons is obvious),
  # `GtkIconView` will only display the first level of the tree and
  # ignore the tree’s branches.
  #
  # # CSS nodes
  #
  # ```
  # iconview.view
  # ╰── [rubberband]
  # ```
  #
  # `GtkIconView` has a single CSS node with name iconview and style class .view.
  # For rubberband selection, a subnode with name rubberband is used.
  class IconView < Widget
    include Accessible
    include Buildable
    include CellLayout
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cell_area : Gtk::CellArea? = nil, column_spacing : Int32? = nil, columns : Int32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, item_orientation : Gtk::Orientation? = nil, item_padding : Int32? = nil, item_width : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, markup_column : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pixbuf_column : Int32? = nil, receives_default : Bool? = nil, reorderable : Bool? = nil, root : Gtk::Root? = nil, row_spacing : Int32? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, spacing : Int32? = nil, text_column : Int32? = nil, tooltip_column : Int32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
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
      if cell_area
        (_names.to_unsafe + _n).value = "cell-area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area)
        _n += 1
      end
      if column_spacing
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
        _n += 1
      end
      if columns
        (_names.to_unsafe + _n).value = "columns".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, columns)
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
      if hscroll_policy
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if item_orientation
        (_names.to_unsafe + _n).value = "item-orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_orientation)
        _n += 1
      end
      if item_padding
        (_names.to_unsafe + _n).value = "item-padding".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_padding)
        _n += 1
      end
      if item_width
        (_names.to_unsafe + _n).value = "item-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_width)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin
        (_names.to_unsafe + _n).value = "margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin)
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
      if markup_column
        (_names.to_unsafe + _n).value = "markup-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, markup_column)
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
      if pixbuf_column
        (_names.to_unsafe + _n).value = "pixbuf-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_column)
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
      if row_spacing
        (_names.to_unsafe + _n).value = "row-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_spacing)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if selection_mode
        (_names.to_unsafe + _n).value = "selection-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_mode)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if spacing
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end
      if text_column
        (_names.to_unsafe + _n).value = "text-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_column)
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

      @pointer = LibGObject.g_object_new_with_properties(IconView.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_icon_view_get_type
    end

    def activate_on_single_click=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activate-on-single-click", unsafe_value, Pointer(Void).null)
      value
    end

    def activate_on_single_click? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activate-on-single-click", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def columns=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "columns", unsafe_value, Pointer(Void).null)
      value
    end

    def columns : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "columns", pointerof(value), Pointer(Void).null)
      value
    end

    def item_orientation=(value : Gtk::Orientation) : Gtk::Orientation
      unsafe_value = value

      LibGObject.g_object_set(self, "item-orientation", unsafe_value, Pointer(Void).null)
      value
    end

    def item_orientation : Gtk::Orientation
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "item-orientation", pointerof(value), Pointer(Void).null)
      Gtk::Orientation.from_value(value)
    end

    def item_padding=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "item-padding", unsafe_value, Pointer(Void).null)
      value
    end

    def item_padding : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "item-padding", pointerof(value), Pointer(Void).null)
      value
    end

    def item_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "item-width", unsafe_value, Pointer(Void).null)
      value
    end

    def item_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "item-width", pointerof(value), Pointer(Void).null)
      value
    end

    def margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "margin", unsafe_value, Pointer(Void).null)
      value
    end

    def margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "margin", pointerof(value), Pointer(Void).null)
      value
    end

    def markup_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "markup-column", unsafe_value, Pointer(Void).null)
      value
    end

    def markup_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "markup-column", pointerof(value), Pointer(Void).null)
      value
    end

    def model=(value : Gtk::TreeModel?) : Gtk::TreeModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::TreeModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::TreeModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pixbuf_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixbuf-column", unsafe_value, Pointer(Void).null)
      value
    end

    def pixbuf_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixbuf-column", pointerof(value), Pointer(Void).null)
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

    def selection_mode=(value : Gtk::SelectionMode) : Gtk::SelectionMode
      unsafe_value = value

      LibGObject.g_object_set(self, "selection-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def selection_mode : Gtk::SelectionMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "selection-mode", pointerof(value), Pointer(Void).null)
      Gtk::SelectionMode.from_value(value)
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

    def text_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "text-column", unsafe_value, Pointer(Void).null)
      value
    end

    def text_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "text-column", pointerof(value), Pointer(Void).null)
      value
    end

    def tooltip_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "tooltip-column", unsafe_value, Pointer(Void).null)
      value
    end

    def tooltip_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "tooltip-column", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_icon_view_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_new
      @pointer = _retval
    end

    def self.new_with_area(area : Gtk::CellArea) : Gtk::Widget
      # gtk_icon_view_new_with_area: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_new_with_area(area)
      Gtk::IconView.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_model(model : Gtk::TreeModel) : Gtk::Widget
      # gtk_icon_view_new_with_model: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_new_with_model(model)
      Gtk::IconView.new(_retval, GICrystal::Transfer::Full)
    end

    def create_drag_icon(path : Gtk::TreePath) : Gdk::Paintable
      # gtk_icon_view_create_drag_icon: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_view_create_drag_icon(self, path)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def enable_model_drag_dest(formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_icon_view_enable_model_drag_dest: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_enable_model_drag_dest(self, formats, actions)
    end

    def enable_model_drag_source(start_button_mask : Gdk::ModifierType, formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_icon_view_enable_model_drag_source: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_enable_model_drag_source(self, start_button_mask, formats, actions)
    end

    def activate_on_single_click : Bool
      # gtk_icon_view_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_activate_on_single_click(self)
      GICrystal.to_bool(_retval)
    end

    def cell_rect(path : Gtk::TreePath, cell : Gtk::CellRenderer?) : Gdk::Rectangle
      # gtk_icon_view_get_cell_rect: (Method)
      # @cell: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end
      rect = Gdk::Rectangle.new

      _retval = LibGtk.gtk_icon_view_get_cell_rect(self, path, cell, rect)
      rect
    end

    def column_spacing : Int32
      # gtk_icon_view_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_column_spacing(self)
      _retval
    end

    def columns : Int32
      # gtk_icon_view_get_columns: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_columns(self)
      _retval
    end

    def cursor : Bool
      # gtk_icon_view_get_cursor: (Method)
      # @path: (out) (transfer full) (optional)
      # @cell: (out) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      cell = Pointer(Pointer(Void)).null

      _retval = LibGtk.gtk_icon_view_get_cursor(self, path, cell)
      GICrystal.to_bool(_retval)
    end

    def dest_item_at_pos(drag_x : Int32, drag_y : Int32) : Bool
      # gtk_icon_view_get_dest_item_at_pos: (Method)
      # @path: (out) (transfer full) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      pos = Pointer(UInt32).null

      _retval = LibGtk.gtk_icon_view_get_dest_item_at_pos(self, drag_x, drag_y, path, pos)
      GICrystal.to_bool(_retval)
    end

    def drag_dest_item : Nil
      # gtk_icon_view_get_drag_dest_item: (Method)
      # @path: (out) (transfer full) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      pos = Pointer(UInt32).null

      LibGtk.gtk_icon_view_get_drag_dest_item(self, path, pos)
    end

    def item_at_pos(x : Int32, y : Int32) : Bool
      # gtk_icon_view_get_item_at_pos: (Method)
      # @path: (out) (transfer full) (optional)
      # @cell: (out) (optional)
      # Returns: (transfer none)

      path = Pointer(Pointer(Void)).null
      cell = Pointer(Pointer(Void)).null

      _retval = LibGtk.gtk_icon_view_get_item_at_pos(self, x, y, path, cell)
      GICrystal.to_bool(_retval)
    end

    def item_column(path : Gtk::TreePath) : Int32
      # gtk_icon_view_get_item_column: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_item_column(self, path)
      _retval
    end

    def item_orientation : Gtk::Orientation
      # gtk_icon_view_get_item_orientation: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_item_orientation(self)
      Gtk::Orientation.from_value(_retval)
    end

    def item_padding : Int32
      # gtk_icon_view_get_item_padding: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_item_padding(self)
      _retval
    end

    def item_row(path : Gtk::TreePath) : Int32
      # gtk_icon_view_get_item_row: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_item_row(self, path)
      _retval
    end

    def item_width : Int32
      # gtk_icon_view_get_item_width: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_item_width(self)
      _retval
    end

    def margin : Int32
      # gtk_icon_view_get_margin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_margin(self)
      _retval
    end

    def markup_column : Int32
      # gtk_icon_view_get_markup_column: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_markup_column(self)
      _retval
    end

    def model : Gtk::TreeModel?
      # gtk_icon_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_model(self)
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def path_at_pos(x : Int32, y : Int32) : Gtk::TreePath?
      # gtk_icon_view_get_path_at_pos: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_view_get_path_at_pos(self, x, y)
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def pixbuf_column : Int32
      # gtk_icon_view_get_pixbuf_column: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_pixbuf_column(self)
      _retval
    end

    def reorderable : Bool
      # gtk_icon_view_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_reorderable(self)
      GICrystal.to_bool(_retval)
    end

    def row_spacing : Int32
      # gtk_icon_view_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_row_spacing(self)
      _retval
    end

    def selected_items : GLib::List
      # gtk_icon_view_get_selected_items: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_icon_view_get_selected_items(self)
      GLib::List(Gtk::TreePath).new(_retval, GICrystal::Transfer::Full)
    end

    def selection_mode : Gtk::SelectionMode
      # gtk_icon_view_get_selection_mode: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_selection_mode(self)
      Gtk::SelectionMode.from_value(_retval)
    end

    def spacing : Int32
      # gtk_icon_view_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_spacing(self)
      _retval
    end

    def text_column : Int32
      # gtk_icon_view_get_text_column: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_text_column(self)
      _retval
    end

    def tooltip_column : Int32
      # gtk_icon_view_get_tooltip_column: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_get_tooltip_column(self)
      _retval
    end

    def tooltip_context(x : Int32, y : Int32, keyboard_tip : Bool) : Gtk::TreeIter
      # gtk_icon_view_get_tooltip_context: (Method)
      # @model: (out) (optional)
      # @path: (out) (transfer full) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      model = Pointer(Pointer(Void)).null
      path = Pointer(Pointer(Void)).null
      iter = Pointer(Void).null
      iter = Gtk::TreeIter.new

      _retval = LibGtk.gtk_icon_view_get_tooltip_context(self, x, y, keyboard_tip, model, path, iter)
      iter
    end

    def visible_range : Bool
      # gtk_icon_view_get_visible_range: (Method)
      # @start_path: (out) (transfer full) (optional)
      # @end_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      start_path = Pointer(Pointer(Void)).null
      end_path = Pointer(Pointer(Void)).null

      _retval = LibGtk.gtk_icon_view_get_visible_range(self, start_path, end_path)
      GICrystal.to_bool(_retval)
    end

    def item_activated(path : Gtk::TreePath) : Nil
      # gtk_icon_view_item_activated: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_item_activated(self, path)
    end

    def path_is_selected(path : Gtk::TreePath) : Bool
      # gtk_icon_view_path_is_selected: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_icon_view_path_is_selected(self, path)
      GICrystal.to_bool(_retval)
    end

    def scroll_to_path(path : Gtk::TreePath, use_align : Bool, row_align : Float32, col_align : Float32) : Nil
      # gtk_icon_view_scroll_to_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_scroll_to_path(self, path, use_align, row_align, col_align)
    end

    def select_all : Nil
      # gtk_icon_view_select_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_select_all(self)
    end

    def select_path(path : Gtk::TreePath) : Nil
      # gtk_icon_view_select_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_select_path(self, path)
    end

    def selected_foreach(func : Pointer(Void), data : Pointer(Nil)?) : Nil
      # gtk_icon_view_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGtk.gtk_icon_view_selected_foreach(self, func, data)
    end

    def activate_on_single_click=(single : Bool) : Nil
      # gtk_icon_view_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_activate_on_single_click(self, single)
    end

    def column_spacing=(column_spacing : Int32) : Nil
      # gtk_icon_view_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_column_spacing(self, column_spacing)
    end

    def columns=(columns : Int32) : Nil
      # gtk_icon_view_set_columns: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_columns(self, columns)
    end

    def set_cursor(path : Gtk::TreePath, cell : Gtk::CellRenderer?, start_editing : Bool) : Nil
      # gtk_icon_view_set_cursor: (Method)
      # @cell: (nullable)
      # Returns: (transfer none)

      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      LibGtk.gtk_icon_view_set_cursor(self, path, cell, start_editing)
    end

    def set_drag_dest_item(path : Gtk::TreePath?, pos : Gtk::IconViewDropPosition) : Nil
      # gtk_icon_view_set_drag_dest_item: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      LibGtk.gtk_icon_view_set_drag_dest_item(self, path, pos)
    end

    def item_orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_icon_view_set_item_orientation: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_item_orientation(self, orientation)
    end

    def item_padding=(item_padding : Int32) : Nil
      # gtk_icon_view_set_item_padding: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_item_padding(self, item_padding)
    end

    def item_width=(item_width : Int32) : Nil
      # gtk_icon_view_set_item_width: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_item_width(self, item_width)
    end

    def margin=(margin : Int32) : Nil
      # gtk_icon_view_set_margin: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_margin(self, margin)
    end

    def markup_column=(column : Int32) : Nil
      # gtk_icon_view_set_markup_column: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_markup_column(self, column)
    end

    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_icon_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_icon_view_set_model(self, model)
    end

    def pixbuf_column=(column : Int32) : Nil
      # gtk_icon_view_set_pixbuf_column: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_pixbuf_column(self, column)
    end

    def reorderable=(reorderable : Bool) : Nil
      # gtk_icon_view_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_reorderable(self, reorderable)
    end

    def row_spacing=(row_spacing : Int32) : Nil
      # gtk_icon_view_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_row_spacing(self, row_spacing)
    end

    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_icon_view_set_selection_mode: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_selection_mode(self, mode)
    end

    def spacing=(spacing : Int32) : Nil
      # gtk_icon_view_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_spacing(self, spacing)
    end

    def text_column=(column : Int32) : Nil
      # gtk_icon_view_set_text_column: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_text_column(self, column)
    end

    def set_tooltip_cell(tooltip : Gtk::Tooltip, path : Gtk::TreePath, cell : Gtk::CellRenderer?) : Nil
      # gtk_icon_view_set_tooltip_cell: (Method)
      # @cell: (nullable)
      # Returns: (transfer none)

      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      LibGtk.gtk_icon_view_set_tooltip_cell(self, tooltip, path, cell)
    end

    def tooltip_column=(column : Int32) : Nil
      # gtk_icon_view_set_tooltip_column: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_tooltip_column(self, column)
    end

    def set_tooltip_item(tooltip : Gtk::Tooltip, path : Gtk::TreePath) : Nil
      # gtk_icon_view_set_tooltip_item: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_set_tooltip_item(self, tooltip, path)
    end

    def unselect_all : Nil
      # gtk_icon_view_unselect_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_unselect_all(self)
    end

    def unselect_path(path : Gtk::TreePath) : Nil
      # gtk_icon_view_unselect_path: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_unselect_path(self, path)
    end

    def unset_model_drag_dest : Nil
      # gtk_icon_view_unset_model_drag_dest: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_unset_model_drag_dest(self)
    end

    def unset_model_drag_source : Nil
      # gtk_icon_view_unset_model_drag_source: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_icon_view_unset_model_drag_source(self)
    end

    struct ActivateCursorItemSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-cursor-item::#{@detail}" : "activate-cursor-item"
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

      def connect(block : Proc(Gtk::IconView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-item")
      end
    end

    def activate_cursor_item_signal
      ActivateCursorItemSignal.new(self)
    end

    struct ItemActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "item-activated::#{@detail}" : "item-activated"
      end

      def connect(&block : Proc(Gtk::TreePath, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreePath, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreePath, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreePath, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::IconView, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Gtk::TreePath, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreePath.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Gtk::TreePath, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "item-activated", path)
      end
    end

    def item_activated_signal
      ItemActivatedSignal.new(self)
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

      def connect(block : Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, _extend : Bool, modify : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, _extend, modify)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
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

      def connect(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
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

    struct SelectCursorItemSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-cursor-item::#{@detail}" : "select-cursor-item"
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

      def connect(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-item")
      end
    end

    def select_cursor_item_signal
      SelectCursorItemSignal.new(self)
    end

    struct SelectionChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "selection-changed::#{@detail}" : "selection-changed"
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

      def connect(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selection-changed")
      end
    end

    def selection_changed_signal
      SelectionChangedSignal.new(self)
    end

    struct ToggleCursorItemSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-cursor-item::#{@detail}" : "toggle-cursor-item"
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

      def connect(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-item")
      end
    end

    def toggle_cursor_item_signal
      ToggleCursorItemSignal.new(self)
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

      def connect(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::IconView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::IconView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(box).call(sender)
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
