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
  @[GObject::GeneratedWrapper]
  class CellView < Widget
    include Accessible
    include Buildable
    include CellLayout
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(CellView, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CellView`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cell_area : Gtk::CellArea? = nil, cell_area_context : Gtk::CellAreaContext? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, draw_sensitive : Bool? = nil, fit_model : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::TreeModel? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if !cell_area_context.nil?
        (_names.to_unsafe + _n).value = "cell-area-context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area_context)
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
      if !draw_sensitive.nil?
        (_names.to_unsafe + _n).value = "draw-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, draw_sensitive)
        _n += 1
      end
      if !fit_model.nil?
        (_names.to_unsafe + _n).value = "fit-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fit_model)
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
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
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
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
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
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
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
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_view_get_type
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

    def cell_area_context=(value : Gtk::CellAreaContext?) : Gtk::CellAreaContext?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area-context", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_area_context : Gtk::CellAreaContext?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cell-area-context", pointerof(value), Pointer(Void).null)
      Gtk::CellAreaContext.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def draw_sensitive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "draw-sensitive", unsafe_value, Pointer(Void).null)
      value
    end

    def draw_sensitive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "draw-sensitive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fit_model=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "fit-model", unsafe_value, Pointer(Void).null)
      value
    end

    def fit_model? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "fit-model", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    # Creates a new `GtkCellView` widget with a specific `GtkCellArea`
    # to layout cells and a specific `GtkCellAreaContext`.
    #
    # Specifying the same context for a handful of cells lets
    # the underlying area synchronize the geometry for those cells,
    # in this way alignments with cellviews for other rows are
    # possible.
    def self.new_with_context(area : Gtk::CellArea, context : Gtk::CellAreaContext) : self
      # gtk_cell_view_new_with_context: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_new_with_context(area, context)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkCellView` widget, adds a `GtkCellRendererText`
    # to it, and makes it show @markup. The text can be marked up with
    # the [Pango text markup language](https://docs.gtk.org/Pango/pango_markup.html).
    def self.new_with_markup(markup : ::String) : self
      # gtk_cell_view_new_with_markup: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_new_with_markup(markup)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkCellView` widget, adds a `GtkCellRendererText`
    # to it, and makes it show @text.
    def self.new_with_text(text : ::String) : self
      # gtk_cell_view_new_with_text: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_new_with_text(text)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkCellView` widget, adds a `GtkCellRendererPixbuf`
    # to it, and makes it show @texture.
    def self.new_with_texture(texture : Gdk::Texture) : self
      # gtk_cell_view_new_with_texture: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_new_with_texture(texture)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::CellView.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns a `GtkTreePath` referring to the currently
    # displayed row. If no row is currently displayed,
    # %NULL is returned.
    def displayed_row : Gtk::TreePath?
      # gtk_cell_view_get_displayed_row: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_cell_view_get_displayed_row(@pointer)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets whether @cell_view is configured to draw all of its
    # cells in a sensitive state.
    def draw_sensitive : Bool
      # gtk_cell_view_get_draw_sensitive: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_get_draw_sensitive(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @cell_view is configured to request space
    # to fit the entire `GtkTreeModel`.
    def fit_model : Bool
      # gtk_cell_view_get_fit_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_get_fit_model(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the model for @cell_view. If no model is used %NULL is
    # returned.
    def model : Gtk::TreeModel?
      # gtk_cell_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_view_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the row of the model that is currently displayed
    # by the `GtkCellView`. If the path is unset, then the
    # contents of the cellview “stick” at their last value;
    # this is not normally a desired result, but may be
    # a needed intermediate state if say, the model for
    # the `GtkCellView` becomes temporarily empty.
    def displayed_row=(path : Gtk::TreePath?) : Nil
      # gtk_cell_view_set_displayed_row: (Method)
      # @path: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      path = if path.nil?
               Pointer(Void).null
             else
               path.to_unsafe
             end

      # C call
      LibGtk.gtk_cell_view_set_displayed_row(@pointer, path)

      # Return value handling
    end

    # Sets whether @cell_view should draw all of its
    # cells in a sensitive state, this is used by `GtkComboBox` menus
    # to ensure that rows with insensitive cells that contain
    # children appear sensitive in the parent menu item.
    def draw_sensitive=(draw_sensitive : Bool) : Nil
      # gtk_cell_view_set_draw_sensitive: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_view_set_draw_sensitive(@pointer, draw_sensitive)

      # Return value handling
    end

    # Sets whether @cell_view should request space to fit the entire `GtkTreeModel`.
    #
    # This is used by `GtkComboBox` to ensure that the cell view displayed on
    # the combo box’s button always gets enough space and does not resize
    # when selection changes.
    def fit_model=(fit_model : Bool) : Nil
      # gtk_cell_view_set_fit_model: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_view_set_fit_model(@pointer, fit_model)

      # Return value handling
    end

    # Sets the model for @cell_view.  If @cell_view already has a model
    # set, it will remove it before setting the new model.  If @model is
    # %NULL, then it will unset the old model.
    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_cell_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_cell_view_set_model(@pointer, model)

      # Return value handling
    end
  end
end
