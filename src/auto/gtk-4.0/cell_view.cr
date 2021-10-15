require "./widget"
require "./accessible"

require "./buildable"

require "./cell_layout"

require "./constraint_target"

require "./orientable"

module Gtk
  # A widget displaying a single row of a GtkTreeModel
  #
  # A `GtkCellView` displays a single row of a `GtkTreeModel` using a `GtkCellArea`
  # and `GtkCellAreaContext`. A `GtkCellAreaContext` can be provided to the
  # `GtkCellView` at construction time in order to keep the cellview in context
  # of a group of cell views, this ensures that the renderers displayed will
  # be properly aligned with each other (like the aligned cells in the menus
  # of `GtkComboBox`).
  #
  # `GtkCellView` is `GtkOrientable` in order to decide in which orientation
  # the underlying `GtkCellAreaContext` should be allocated. Taking the `GtkComboBox`
  # menu as an example, cellviews should be oriented horizontally if the menus are
  # listed top-to-bottom and thus all share the same width but may have separate
  # individual heights (left-to-right menus should be allocated vertically since
  # they all share the same height but may have variable widths).
  #
  # # CSS nodes
  #
  # GtkCellView has a single CSS node with name cellview.
  class CellView < Widget
    include Accessible
    include Buildable
    include CellLayout
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cell_area : Gtk::CellArea? = nil, cell_area_context : Gtk::CellAreaContext? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, draw_sensitive : Bool? = nil, fit_model : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if cell_area_context
        (_names.to_unsafe + _n).value = "cell-area-context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area_context)
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
      if draw_sensitive
        (_names.to_unsafe + _n).value = "draw-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, draw_sensitive)
        _n += 1
      end
      if fit_model
        (_names.to_unsafe + _n).value = "fit-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fit_model)
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
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
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
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
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
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
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
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellView.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_view_get_type
    end

    def cell_area=(value : CellArea?) : CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_area_context=(value : CellAreaContext?) : CellAreaContext?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area-context", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize
      # gtk_cell_view_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_new
      @pointer = _retval
    end

    def self.new_with_context(area : Gtk::CellArea, context : Gtk::CellAreaContext) : Gtk::Widget
      # gtk_cell_view_new_with_context: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_new_with_context(area, context)
      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_markup(markup : ::String) : Gtk::Widget
      # gtk_cell_view_new_with_markup: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_new_with_markup(markup)
      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_text(text : ::String) : Gtk::Widget
      # gtk_cell_view_new_with_text: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_new_with_text(text)
      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_texture(texture : Gdk::Texture) : Gtk::Widget
      # gtk_cell_view_new_with_texture: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_new_with_texture(texture)
      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    def displayed_row : Gtk::TreePath?
      # gtk_cell_view_get_displayed_row: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_cell_view_get_displayed_row(self)
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def draw_sensitive? : Bool
      # gtk_cell_view_get_draw_sensitive: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_get_draw_sensitive(self)
      GICrystal.to_bool(_retval)
    end

    def fit_model? : Bool
      # gtk_cell_view_get_fit_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_get_fit_model(self)
      GICrystal.to_bool(_retval)
    end

    def model : Gtk::TreeModel?
      # gtk_cell_view_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_view_get_model(self)
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def displayed_row=(path : Gtk::TreePath?) : Nil
      # gtk_cell_view_set_displayed_row: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      LibGtk.gtk_cell_view_set_displayed_row(self, path)
    end

    def draw_sensitive=(draw_sensitive : Bool) : Nil
      # gtk_cell_view_set_draw_sensitive: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_view_set_draw_sensitive(self, draw_sensitive)
    end

    def fit_model=(fit_model : Bool) : Nil
      # gtk_cell_view_set_fit_model: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_view_set_fit_model(self, fit_model)
    end

    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_cell_view_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_cell_view_set_model(self, model)
    end
  end
end
