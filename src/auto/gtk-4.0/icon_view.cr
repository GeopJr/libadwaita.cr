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
  # `Gtk#TreeView`, it allows to select one or multiple items
  # (depending on the selection mode, see `Gtk::IconView#selection_mode=`).
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
  @[GObject::GeneratedWrapper]
  class IconView < Widget
    include Accessible
    include Buildable
    include CellLayout
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::IconView), instance_init, 0)
    end

    GICrystal.define_new_method(IconView, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `IconView`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cell_area : Gtk::CellArea? = nil, column_spacing : Int32? = nil, columns : Int32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, item_orientation : Gtk::Orientation? = nil, item_padding : Int32? = nil, item_width : Int32? = nil, layout_manager : Gtk::LayoutManager? = nil, margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, markup_column : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pixbuf_column : Int32? = nil, receives_default : Bool? = nil, reorderable : Bool? = nil, root : Gtk::Root? = nil, row_spacing : Int32? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, spacing : Int32? = nil, text_column : Int32? = nil, tooltip_column : Int32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[56]
      _values = StaticArray(LibGObject::Value, 56).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !activate_on_single_click.nil?
        (_names.to_unsafe + _n).value = "activate-on-single-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activate_on_single_click)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !cell_area.nil?
        (_names.to_unsafe + _n).value = "cell-area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area)
        _n += 1
      end
      if !column_spacing.nil?
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
        _n += 1
      end
      if !columns.nil?
        (_names.to_unsafe + _n).value = "columns".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, columns)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !hadjustment.nil?
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !hscroll_policy.nil?
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if !item_orientation.nil?
        (_names.to_unsafe + _n).value = "item-orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_orientation)
        _n += 1
      end
      if !item_padding.nil?
        (_names.to_unsafe + _n).value = "item-padding".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_padding)
        _n += 1
      end
      if !item_width.nil?
        (_names.to_unsafe + _n).value = "item-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_width)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin.nil?
        (_names.to_unsafe + _n).value = "margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !markup_column.nil?
        (_names.to_unsafe + _n).value = "markup-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, markup_column)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !pixbuf_column.nil?
        (_names.to_unsafe + _n).value = "pixbuf-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_column)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !reorderable.nil?
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !row_spacing.nil?
        (_names.to_unsafe + _n).value = "row-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_spacing)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !selection_mode.nil?
        (_names.to_unsafe + _n).value = "selection-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_mode)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !spacing.nil?
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end
      if !text_column.nil?
        (_names.to_unsafe + _n).value = "text-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_column)
        _n += 1
      end
      if !tooltip_column.nil?
        (_names.to_unsafe + _n).value = "tooltip-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_column)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !vadjustment.nil?
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !vscroll_policy.nil?
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(IconView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::Orientation.new(value)
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
      Gtk::AbstractTreeModel.new(value, GICrystal::Transfer::None) unless value.null?
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
      Gtk::SelectionMode.new(value)
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

    # Creates a new `GtkIconView` widget
    def initialize
      # gtk_icon_view_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkIconView` widget using the
    # specified @area to layout cells inside the icons.
    def self.new_with_area(area : Gtk::CellArea) : self
      # gtk_icon_view_new_with_area: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_new_with_area(area)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::IconView.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkIconView` widget with the model @model.
    def self.new_with_model(model : Gtk::TreeModel) : self
      # gtk_icon_view_new_with_model: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_new_with_model(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::IconView.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a `GdkPaintable` representation of the item at @path.
    # This image is used for a drag icon.
    def create_drag_icon(path : Gtk::TreePath) : Gdk::Paintable?
      # gtk_icon_view_create_drag_icon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_view_create_drag_icon(@pointer, path)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Turns @icon_view into a drop destination for automatic DND. Calling this
    # method sets `GtkIconView`:reorderable to %FALSE.
    def enable_model_drag_dest(formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_icon_view_enable_model_drag_dest: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_enable_model_drag_dest(@pointer, formats, actions)

      # Return value handling
    end

    # Turns @icon_view into a drag source for automatic DND. Calling this
    # method sets `GtkIconView`:reorderable to %FALSE.
    def enable_model_drag_source(start_button_mask : Gdk::ModifierType, formats : Gdk::ContentFormats, actions : Gdk::DragAction) : Nil
      # gtk_icon_view_enable_model_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_enable_model_drag_source(@pointer, start_button_mask, formats, actions)

      # Return value handling
    end

    # Gets the setting set by gtk_icon_view_set_activate_on_single_click().
    def activate_on_single_click : Bool
      # gtk_icon_view_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_activate_on_single_click(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Fills the bounding rectangle in widget coordinates for the cell specified by
    # @path and @cell. If @cell is %NULL the main cell area is used.
    #
    # This function is only valid if @icon_view is realized.
    def cell_rect(path : Gtk::TreePath, cell : Gtk::CellRenderer?) : Gdk::Rectangle
      # gtk_icon_view_get_cell_rect: (Method)
      # @cell: (nullable)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end
      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new
      # C call
      _retval = LibGtk.gtk_icon_view_get_cell_rect(@pointer, path, cell, rect)

      # Return value handling

      rect
    end

    # Returns the value of the ::column-spacing property.
    def column_spacing : Int32
      # gtk_icon_view_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_column_spacing(@pointer)

      # Return value handling

      _retval
    end

    # Returns the value of the ::columns property.
    def columns : Int32
      # gtk_icon_view_get_columns: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_columns(@pointer)

      # Return value handling

      _retval
    end

    # Fills in @path and @cell with the current cursor path and cell.
    # If the cursor isn’t currently set, then *@path will be %NULL.
    # If no cell currently has focus, then *@cell will be %NULL.
    #
    # The returned `GtkTreePath` must be freed with gtk_tree_path_free().
    def cursor : Bool
      # gtk_icon_view_get_cursor: (Method)
      # @path: (out) (transfer full) (optional)
      # @cell: (out) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      cell = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGtk.gtk_icon_view_get_cursor(@pointer, path, cell)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines the destination item for a given position.
    def dest_item_at_pos(drag_x : Int32, drag_y : Int32) : Bool
      # gtk_icon_view_get_dest_item_at_pos: (Method)
      # @path: (out) (transfer full) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      pos = Pointer(UInt32).null
      # C call
      _retval = LibGtk.gtk_icon_view_get_dest_item_at_pos(@pointer, drag_x, drag_y, path, pos)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets information about the item that is highlighted for feedback.
    def drag_dest_item : Nil
      # gtk_icon_view_get_drag_dest_item: (Method)
      # @path: (out) (transfer full) (nullable) (optional)
      # @pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      pos = Pointer(UInt32).null
      # C call
      LibGtk.gtk_icon_view_get_drag_dest_item(@pointer, path, pos)

      # Return value handling
    end

    # Gets the path and cell for the icon at the given position.
    def item_at_pos(x : Int32, y : Int32) : Bool
      # gtk_icon_view_get_item_at_pos: (Method)
      # @path: (out) (transfer full) (optional)
      # @cell: (out) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      cell = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGtk.gtk_icon_view_get_item_at_pos(@pointer, x, y, path, cell)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the column in which the item @path is currently
    # displayed. Column numbers start at 0.
    def item_column(path : Gtk::TreePath) : Int32
      # gtk_icon_view_get_item_column: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_item_column(@pointer, path)

      # Return value handling

      _retval
    end

    # Returns the value of the ::item-orientation property which determines
    # whether the labels are drawn beside the icons instead of below.
    def item_orientation : Gtk::Orientation
      # gtk_icon_view_get_item_orientation: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_item_orientation(@pointer)

      # Return value handling

      Gtk::Orientation.new(_retval)
    end

    # Returns the value of the ::item-padding property.
    def item_padding : Int32
      # gtk_icon_view_get_item_padding: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_item_padding(@pointer)

      # Return value handling

      _retval
    end

    # Gets the row in which the item @path is currently
    # displayed. Row numbers start at 0.
    def item_row(path : Gtk::TreePath) : Int32
      # gtk_icon_view_get_item_row: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_item_row(@pointer, path)

      # Return value handling

      _retval
    end

    # Returns the value of the ::item-width property.
    def item_width : Int32
      # gtk_icon_view_get_item_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_item_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns the value of the ::margin property.
    def margin : Int32
      # gtk_icon_view_get_margin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_margin(@pointer)

      # Return value handling

      _retval
    end

    # Returns the column with markup text for @icon_view.
    def markup_column : Int32
      # gtk_icon_view_get_markup_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_markup_column(@pointer)

      # Return value handling

      _retval
    end

    # Returns the model the `GtkIconView` is based on.  Returns %NULL if the
    # model is unset.
    def model : Gtk::TreeModel?
      # gtk_icon_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the path for the icon at the given position.
    def path_at_pos(x : Int32, y : Int32) : Gtk::TreePath?
      # gtk_icon_view_get_path_at_pos: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_view_get_path_at_pos(@pointer, x, y)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the column with pixbufs for @icon_view.
    def pixbuf_column : Int32
      # gtk_icon_view_get_pixbuf_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_pixbuf_column(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves whether the user can reorder the list via drag-and-drop.
    # See gtk_icon_view_set_reorderable().
    def reorderable : Bool
      # gtk_icon_view_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_reorderable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the value of the ::row-spacing property.
    def row_spacing : Int32
      # gtk_icon_view_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_row_spacing(@pointer)

      # Return value handling

      _retval
    end

    # Creates a list of paths of all selected items. Additionally, if you are
    # planning on modifying the model after calling this function, you may
    # want to convert the returned list into a list of `GtkTreeRowReferences`.
    # To do this, you can use gtk_tree_row_reference_new().
    #
    # To free the return value, use `g_list_free_full`:
    # |[<!-- language="C" -->
    # GtkWidget *icon_view = gtk_icon_view_new ();
    # // Use icon_view
    #
    # GList *list = gtk_icon_view_get_selected_items (GTK_ICON_VIEW (icon_view));
    #
    # // use list
    #
    # g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
    # ]|
    def selected_items : GLib::List
      # gtk_icon_view_get_selected_items: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_icon_view_get_selected_items(@pointer)

      # Return value handling

      GLib::List(Gtk::TreePath).new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the selection mode of the @icon_view.
    def selection_mode : Gtk::SelectionMode
      # gtk_icon_view_get_selection_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_selection_mode(@pointer)

      # Return value handling

      Gtk::SelectionMode.new(_retval)
    end

    # Returns the value of the ::spacing property.
    def spacing : Int32
      # gtk_icon_view_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_spacing(@pointer)

      # Return value handling

      _retval
    end

    # Returns the column with text for @icon_view.
    def text_column : Int32
      # gtk_icon_view_get_text_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_text_column(@pointer)

      # Return value handling

      _retval
    end

    # Returns the column of @icon_view’s model which is being used for
    # displaying tooltips on @icon_view’s rows.
    def tooltip_column : Int32
      # gtk_icon_view_get_tooltip_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_get_tooltip_column(@pointer)

      # Return value handling

      _retval
    end

    # This function is supposed to be used in a `GtkWidget::query-tooltip`
    # signal handler for `GtkIconView`. The @x, @y and @keyboard_tip values
    # which are received in the signal handler, should be passed to this
    # function without modification.
    #
    # The return value indicates whether there is an icon view item at the given
    # coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
    # tooltips the item returned will be the cursor item. When %TRUE, then any of
    # @model, @path and @iter which have been provided will be set to point to
    # that row and the corresponding model.
    def tooltip_context(x : Int32, y : Int32, keyboard_tip : Bool) : Gtk::TreeIter
      # gtk_icon_view_get_tooltip_context: (Method)
      # @model: (out) (optional)
      # @path: (out) (transfer full) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      model = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      path = Pointer(Pointer(Void)).null  # Generator::OutArgUsedInReturnPlan
      iter = Pointer(Void).null           # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      _retval = LibGtk.gtk_icon_view_get_tooltip_context(@pointer, x, y, keyboard_tip, model, path, iter)

      # Return value handling

      iter
    end

    # Sets @start_path and @end_path to be the first and last visible path.
    # Note that there may be invisible paths in between.
    #
    # Both paths should be freed with gtk_tree_path_free() after use.
    def visible_range : Bool
      # gtk_icon_view_get_visible_range: (Method)
      # @start_path: (out) (transfer full) (optional)
      # @end_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      start_path = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      end_path = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGtk.gtk_icon_view_get_visible_range(@pointer, start_path, end_path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Activates the item determined by @path.
    def item_activated(path : Gtk::TreePath) : Nil
      # gtk_icon_view_item_activated: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_item_activated(@pointer, path)

      # Return value handling
    end

    # Returns %TRUE if the icon pointed to by @path is currently
    # selected. If @path does not point to a valid location, %FALSE is returned.
    def path_is_selected(path : Gtk::TreePath) : Bool
      # gtk_icon_view_path_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_icon_view_path_is_selected(@pointer, path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves the alignments of @icon_view to the position specified by @path.
    # @row_align determines where the row is placed, and @col_align determines
    # where @column is placed.  Both are expected to be between 0.0 and 1.0.
    # 0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
    # center.
    #
    # If @use_align is %FALSE, then the alignment arguments are ignored, and the
    # tree does the minimum amount of work to scroll the item onto the screen.
    # This means that the item will be scrolled to the edge closest to its current
    # position.  If the item is currently visible on the screen, nothing is done.
    #
    # This function only works if the model is set, and @path is a valid row on
    # the model. If the model changes before the @icon_view is realized, the
    # centered path will be modified to reflect this change.
    def scroll_to_path(path : Gtk::TreePath, use_align : Bool, row_align : Float32, col_align : Float32) : Nil
      # gtk_icon_view_scroll_to_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_scroll_to_path(@pointer, path, use_align, row_align, col_align)

      # Return value handling
    end

    # Selects all the icons. @icon_view must has its selection mode set
    # to %GTK_SELECTION_MULTIPLE.
    def select_all : Nil
      # gtk_icon_view_select_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_select_all(@pointer)

      # Return value handling
    end

    # Selects the row at @path.
    def select_path(path : Gtk::TreePath) : Nil
      # gtk_icon_view_select_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_select_path(@pointer, path)

      # Return value handling
    end

    # Calls a function for each selected icon. Note that the model or
    # selection cannot be modified from within this function.
    def selected_foreach(func : Gtk::IconViewForeachFunc, data : Pointer(Void)?) : Nil
      # gtk_icon_view_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_icon_view_selected_foreach(@pointer, func, data)

      # Return value handling
    end

    # Causes the `GtkIconView`::item-activated signal to be emitted on
    # a single click instead of a double click.
    def activate_on_single_click=(single : Bool) : Nil
      # gtk_icon_view_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_activate_on_single_click(@pointer, single)

      # Return value handling
    end

    # Sets the ::column-spacing property which specifies the space
    # which is inserted between the columns of the icon view.
    def column_spacing=(column_spacing : Int32) : Nil
      # gtk_icon_view_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_column_spacing(@pointer, column_spacing)

      # Return value handling
    end

    # Sets the ::columns property which determines in how
    # many columns the icons are arranged. If @columns is
    # -1, the number of columns will be chosen automatically
    # to fill the available area.
    def columns=(columns : Int32) : Nil
      # gtk_icon_view_set_columns: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_columns(@pointer, columns)

      # Return value handling
    end

    # Sets the current keyboard focus to be at @path, and selects it.  This is
    # useful when you want to focus the user’s attention on a particular item.
    # If @cell is not %NULL, then focus is given to the cell specified by
    # it. Additionally, if @start_editing is %TRUE, then editing should be
    # started in the specified cell.
    #
    # This function is often followed by `gtk_widget_grab_focus
    # (icon_view)` in order to give keyboard focus to the widget.
    # Please note that editing can only happen when the widget is realized.
    def set_cursor(path : Gtk::TreePath, cell : Gtk::CellRenderer?, start_editing : Bool) : Nil
      # gtk_icon_view_set_cursor: (Method)
      # @cell: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      # C call
      LibGtk.gtk_icon_view_set_cursor(@pointer, path, cell, start_editing)

      # Return value handling
    end

    # Sets the item that is highlighted for feedback.
    def set_drag_dest_item(path : Gtk::TreePath?, pos : Gtk::IconViewDropPosition) : Nil
      # gtk_icon_view_set_drag_dest_item: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      # C call
      LibGtk.gtk_icon_view_set_drag_dest_item(@pointer, path, pos)

      # Return value handling
    end

    # Sets the ::item-orientation property which determines whether the labels
    # are drawn beside the icons instead of below.
    def item_orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_icon_view_set_item_orientation: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_item_orientation(@pointer, orientation)

      # Return value handling
    end

    # Sets the `GtkIconView`:item-padding property which specifies the padding
    # around each of the icon view’s items.
    def item_padding=(item_padding : Int32) : Nil
      # gtk_icon_view_set_item_padding: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_item_padding(@pointer, item_padding)

      # Return value handling
    end

    # Sets the ::item-width property which specifies the width
    # to use for each item. If it is set to -1, the icon view will
    # automatically determine a suitable item size.
    def item_width=(item_width : Int32) : Nil
      # gtk_icon_view_set_item_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_item_width(@pointer, item_width)

      # Return value handling
    end

    # Sets the ::margin property which specifies the space
    # which is inserted at the top, bottom, left and right
    # of the icon view.
    def margin=(margin : Int32) : Nil
      # gtk_icon_view_set_margin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_margin(@pointer, margin)

      # Return value handling
    end

    # Sets the column with markup information for @icon_view to be
    # @column. The markup column must be of type `G_TYPE_STRING`.
    # If the markup column is set to something, it overrides
    # the text column set by gtk_icon_view_set_text_column().
    def markup_column=(column : Int32) : Nil
      # gtk_icon_view_set_markup_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_markup_column(@pointer, column)

      # Return value handling
    end

    # Sets the model for a `GtkIconView`.
    # If the @icon_view already has a model set, it will remove
    # it before setting the new model.  If @model is %NULL, then
    # it will unset the old model.
    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_icon_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_icon_view_set_model(@pointer, model)

      # Return value handling
    end

    # Sets the column with pixbufs for @icon_view to be @column. The pixbuf
    # column must be of type `GDK_TYPE_PIXBUF`
    def pixbuf_column=(column : Int32) : Nil
      # gtk_icon_view_set_pixbuf_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_pixbuf_column(@pointer, column)

      # Return value handling
    end

    # This function is a convenience function to allow you to reorder models that
    # support the `GtkTreeDragSourceIface` and the `GtkTreeDragDestIface`. Both
    # `GtkTreeStore` and `GtkListStore` support these. If @reorderable is %TRUE, then
    # the user can reorder the model by dragging and dropping rows.  The
    # developer can listen to these changes by connecting to the model's
    # row_inserted and row_deleted signals. The reordering is implemented by setting up
    # the icon view as a drag source and destination. Therefore, drag and
    # drop can not be used in a reorderable view for any other purpose.
    #
    # This function does not give you any degree of control over the order -- any
    # reordering is allowed.  If more control is needed, you should probably
    # handle drag and drop manually.
    def reorderable=(reorderable : Bool) : Nil
      # gtk_icon_view_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_reorderable(@pointer, reorderable)

      # Return value handling
    end

    # Sets the ::row-spacing property which specifies the space
    # which is inserted between the rows of the icon view.
    def row_spacing=(row_spacing : Int32) : Nil
      # gtk_icon_view_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_row_spacing(@pointer, row_spacing)

      # Return value handling
    end

    # Sets the selection mode of the @icon_view.
    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_icon_view_set_selection_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_selection_mode(@pointer, mode)

      # Return value handling
    end

    # Sets the ::spacing property which specifies the space
    # which is inserted between the cells (i.e. the icon and
    # the text) of an item.
    def spacing=(spacing : Int32) : Nil
      # gtk_icon_view_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_spacing(@pointer, spacing)

      # Return value handling
    end

    # Sets the column with text for @icon_view to be @column. The text
    # column must be of type `G_TYPE_STRING`.
    def text_column=(column : Int32) : Nil
      # gtk_icon_view_set_text_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_text_column(@pointer, column)

      # Return value handling
    end

    # Sets the tip area of @tooltip to the area which @cell occupies in
    # the item pointed to by @path. See also gtk_tooltip_set_tip_area().
    #
    # See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
    def set_tooltip_cell(tooltip : Gtk::Tooltip, path : Gtk::TreePath, cell : Gtk::CellRenderer?) : Nil
      # gtk_icon_view_set_tooltip_cell: (Method)
      # @cell: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cell = if cell.nil?
               Pointer(Void).null
             else
               cell.to_unsafe
             end

      # C call
      LibGtk.gtk_icon_view_set_tooltip_cell(@pointer, tooltip, path, cell)

      # Return value handling
    end

    # If you only plan to have simple (text-only) tooltips on full items, you
    # can use this function to have `GtkIconView` handle these automatically
    # for you. @column should be set to the column in @icon_view’s model
    # containing the tooltip texts, or -1 to disable this feature.
    #
    # When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
    # @icon_view will connect a `GtkWidget::query-tooltip` signal handler.
    #
    # Note that the signal handler sets the text with gtk_tooltip_set_markup(),
    # so &, <, etc have to be escaped in the text.
    def tooltip_column=(column : Int32) : Nil
      # gtk_icon_view_set_tooltip_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_tooltip_column(@pointer, column)

      # Return value handling
    end

    # Sets the tip area of @tooltip to be the area covered by the item at @path.
    # See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
    # See also gtk_tooltip_set_tip_area().
    def set_tooltip_item(tooltip : Gtk::Tooltip, path : Gtk::TreePath) : Nil
      # gtk_icon_view_set_tooltip_item: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_set_tooltip_item(@pointer, tooltip, path)

      # Return value handling
    end

    # Unselects all the icons.
    def unselect_all : Nil
      # gtk_icon_view_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_unselect_all(@pointer)

      # Return value handling
    end

    # Unselects the row at @path.
    def unselect_path(path : Gtk::TreePath) : Nil
      # gtk_icon_view_unselect_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_unselect_path(@pointer, path)

      # Return value handling
    end

    # Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
    # method sets `GtkIconView`:reorderable to %FALSE.
    def unset_model_drag_dest : Nil
      # gtk_icon_view_unset_model_drag_dest: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_unset_model_drag_dest(@pointer)

      # Return value handling
    end

    # Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling this
    # method sets `GtkIconView`:reorderable to %FALSE.
    def unset_model_drag_source : Nil
      # gtk_icon_view_unset_model_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_icon_view_unset_model_drag_source(@pointer)

      # Return value handling
    end

    # A [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user activates the currently
    # focused item.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control activation
    # programmatically.
    #
    # The default bindings for this signal are Space, Return and Enter.
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

      def connect(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::IconView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-item")
      end
    end

    def activate_cursor_item_signal
      ActivateCursorItemSignal.new(self)
    end

    # The ::item-activated signal is emitted when the method
    # gtk_icon_view_item_activated() is called, when the user double
    # clicks an item with the "activate-on-single-click" property set
    # to %FALSE, or when the user single clicks an item when the
    # "activate-on-single-click" property set to %TRUE. It is also
    # emitted when a non-editable item is selected and one of the keys:
    # Space, Return or Enter is pressed.
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

      def connect(handler : Proc(Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreePath, Nil)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::TreePath, Nil)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::IconView, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::IconView, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Gtk::TreePath, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = Gtk::TreePath.new(lib_path, :none)
          ::Box(Proc(Gtk::IconView, Gtk::TreePath, Nil)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : Gtk::TreePath) : Nil
        LibGObject.g_signal_emit_by_name(@source, "item-activated", path)
      end
    end

    def item_activated_signal
      ItemActivatedSignal.new(self)
    end

    # The ::move-cursor signal is a
    # [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user initiates a cursor movement.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically.
    #
    # The default bindings for this signal include
    # - Arrow keys which move by individual steps
    # - Home/End keys which move to the first/last item
    # - PageUp/PageDown which move by "pages"
    # All of these will extend the selection when combined with
    # the Shift modifier.
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

      def connect(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::IconView, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, extend _extend : Bool, modify : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, _extend, modify)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    # A [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user selects all items.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control selection
    # programmatically.
    #
    # The default binding for this signal is Ctrl-a.
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

      def connect(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all")
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

    # A [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user selects the item that is currently
    # focused.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control selection
    # programmatically.
    #
    # There is no default binding for this signal.
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

      def connect(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-cursor-item")
      end
    end

    def select_cursor_item_signal
      SelectCursorItemSignal.new(self)
    end

    # The ::selection-changed signal is emitted when the selection
    # (i.e. the set of selected items) changes.
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

      def connect(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selection-changed")
      end
    end

    def selection_changed_signal
      SelectionChangedSignal.new(self)
    end

    # A [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user toggles whether the currently
    # focused item is selected or not. The exact effect of this
    # depend on the selection mode.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control selection
    # programmatically.
    #
    # There is no default binding for this signal is Ctrl-Space.
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

      def connect(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-item")
      end
    end

    def toggle_cursor_item_signal
      ToggleCursorItemSignal.new(self)
    end

    # A [keybinding signal]`Gtk#SignalAction`
    # which gets emitted when the user unselects all items.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control selection
    # programmatically.
    #
    # The default binding for this signal is Ctrl-Shift-a.
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

      def connect(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::IconView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::IconView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::IconView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
