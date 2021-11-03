require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # A `GtkFlowBox` puts child widgets in reflowing grid.
  #
  # For instance, with the horizontal orientation, the widgets will be
  # arranged from left to right, starting a new row under the previous
  # row when necessary. Reducing the width in this case will require more
  # rows, so a larger height will be requested.
  #
  # Likewise, with the vertical orientation, the widgets will be arranged
  # from top to bottom, starting a new column to the right when necessary.
  # Reducing the height will require more columns, so a larger width will
  # be requested.
  #
  # The size request of a `GtkFlowBox` alone may not be what you expect;
  # if you need to be able to shrink it along both axes and dynamically
  # reflow its children, you may have to wrap it in a `GtkScrolledWindow`
  # to enable that.
  #
  # The children of a `GtkFlowBox` can be dynamically sorted and filtered.
  #
  # Although a `GtkFlowBox` must have only `GtkFlowBoxChild` children, you
  # can add any kind of widget to it via [method@Gtk.FlowBox.insert], and a
  # `GtkFlowBoxChild` widget will automatically be inserted between the box
  # and the widget.
  #
  # Also see [class@Gtk.ListBox].
  #
  # # CSS nodes
  #
  # ```
  # flowbox
  # ├── flowboxchild
  # │ ╰── < child >
  #   ├── flowboxchild
  # │ ╰── < child >
  #   ┊
  # ╰── [rubberband]
  # ```
  #
  # `GtkFlowBox` uses a single CSS node with name flowbox. `GtkFlowBoxChild`
  # uses a single CSS node with name flowboxchild. For rubberband selection,
  # a subnode with name rubberband is used.
  #
  # # Accessibility
  #
  # `GtkFlowBox` uses the %GTK_ACCESSIBLE_ROLE_GRID role, and `GtkFlowBoxChild`
  # uses the %GTK_ACCESSIBLE_ROLE_GRID_CELL role.
  class FlowBox < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accept_unpaired_release : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, column_spacing : UInt32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_children_per_line : UInt32? = nil, min_children_per_line : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, row_spacing : UInt32? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
      _n = 0

      if accept_unpaired_release
        (_names.to_unsafe + _n).value = "accept-unpaired-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accept_unpaired_release)
        _n += 1
      end
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
      if column_spacing
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
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
      if homogeneous
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
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
      if max_children_per_line
        (_names.to_unsafe + _n).value = "max-children-per-line".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_children_per_line)
        _n += 1
      end
      if min_children_per_line
        (_names.to_unsafe + _n).value = "min-children-per-line".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_children_per_line)
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

      @pointer = LibGObject.g_object_new_with_properties(FlowBox.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_flow_box_get_type
    end

    def accept_unpaired_release=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accept-unpaired-release", unsafe_value, Pointer(Void).null)
      value
    end

    def accept_unpaired_release? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accept-unpaired-release", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def column_spacing=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "column-spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def column_spacing : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "column-spacing", pointerof(value), Pointer(Void).null)
      value
    end

    def homogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "homogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def homogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "homogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def max_children_per_line=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-children-per-line", unsafe_value, Pointer(Void).null)
      value
    end

    def max_children_per_line : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "max-children-per-line", pointerof(value), Pointer(Void).null)
      value
    end

    def min_children_per_line=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-children-per-line", unsafe_value, Pointer(Void).null)
      value
    end

    def min_children_per_line : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "min-children-per-line", pointerof(value), Pointer(Void).null)
      value
    end

    def row_spacing=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "row-spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def row_spacing : UInt32
      # Returns: None

      value = uninitialized UInt32
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

    def initialize
      # gtk_flow_box_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_new
      @pointer = _retval
    end

    def bind_model(model : Gio::ListModel?, create_widget_func : Pointer(Void), user_data : Pointer(Nil)?, user_data_free_func : Pointer(Void)) : Nil
      # gtk_flow_box_bind_model: (Method)
      # @model: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_flow_box_bind_model(self, model, create_widget_func, user_data, user_data_free_func)
    end

    def activate_on_single_click : Bool
      # gtk_flow_box_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_activate_on_single_click(self)
      GICrystal.to_bool(_retval)
    end

    def child_at_index(idx : Int32) : Gtk::FlowBoxChild?
      # gtk_flow_box_get_child_at_index: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_child_at_index(self, idx)
      Gtk::FlowBoxChild.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def child_at_pos(x : Int32, y : Int32) : Gtk::FlowBoxChild?
      # gtk_flow_box_get_child_at_pos: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_child_at_pos(self, x, y)
      Gtk::FlowBoxChild.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def column_spacing : UInt32
      # gtk_flow_box_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_column_spacing(self)
      _retval
    end

    def homogeneous : Bool
      # gtk_flow_box_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def max_children_per_line : UInt32
      # gtk_flow_box_get_max_children_per_line: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_max_children_per_line(self)
      _retval
    end

    def min_children_per_line : UInt32
      # gtk_flow_box_get_min_children_per_line: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_min_children_per_line(self)
      _retval
    end

    def row_spacing : UInt32
      # gtk_flow_box_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_row_spacing(self)
      _retval
    end

    def selected_children : GLib::List
      # gtk_flow_box_get_selected_children: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_flow_box_get_selected_children(self)
      GLib::List(Gtk::FlowBoxChild).new(_retval, GICrystal::Transfer::Container)
    end

    def selection_mode : Gtk::SelectionMode
      # gtk_flow_box_get_selection_mode: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_flow_box_get_selection_mode(self)
      Gtk::SelectionMode.from_value(_retval)
    end

    def insert(widget : Gtk::Widget, position : Int32) : Nil
      # gtk_flow_box_insert: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_insert(self, widget, position)
    end

    def invalidate_filter : Nil
      # gtk_flow_box_invalidate_filter: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_invalidate_filter(self)
    end

    def invalidate_sort : Nil
      # gtk_flow_box_invalidate_sort: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_invalidate_sort(self)
    end

    def remove(widget : Gtk::Widget) : Nil
      # gtk_flow_box_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_remove(self, widget)
    end

    def select_all : Nil
      # gtk_flow_box_select_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_select_all(self)
    end

    def select_child(child : Gtk::FlowBoxChild) : Nil
      # gtk_flow_box_select_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_select_child(self, child)
    end

    def selected_foreach(func : Pointer(Void), data : Pointer(Nil)?) : Nil
      # gtk_flow_box_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGtk.gtk_flow_box_selected_foreach(self, func, data)
    end

    def activate_on_single_click=(single : Bool) : Nil
      # gtk_flow_box_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_activate_on_single_click(self, single)
    end

    def column_spacing=(spacing : UInt32) : Nil
      # gtk_flow_box_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_column_spacing(self, spacing)
    end

    def set_filter_func(filter_func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_flow_box_set_filter_func: (Method)
      # @filter_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      filter_func = if filter_func.nil?
                      LibGtk::FlowBoxFilterFunc.null
                    else
                      filter_func.to_unsafe
                    end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_flow_box_set_filter_func(self, filter_func, user_data, destroy)
    end

    def hadjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_flow_box_set_hadjustment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_hadjustment(self, adjustment)
    end

    def homogeneous=(homogeneous : Bool) : Nil
      # gtk_flow_box_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_homogeneous(self, homogeneous)
    end

    def max_children_per_line=(n_children : UInt32) : Nil
      # gtk_flow_box_set_max_children_per_line: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_max_children_per_line(self, n_children)
    end

    def min_children_per_line=(n_children : UInt32) : Nil
      # gtk_flow_box_set_min_children_per_line: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_min_children_per_line(self, n_children)
    end

    def row_spacing=(spacing : UInt32) : Nil
      # gtk_flow_box_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_row_spacing(self, spacing)
    end

    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_flow_box_set_selection_mode: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_selection_mode(self, mode)
    end

    def set_sort_func(sort_func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void)) : Nil
      # gtk_flow_box_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      sort_func = if sort_func.nil?
                    LibGtk::FlowBoxSortFunc.null
                  else
                    sort_func.to_unsafe
                  end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_flow_box_set_sort_func(self, sort_func, user_data, destroy)
    end

    def vadjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_flow_box_set_vadjustment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_set_vadjustment(self, adjustment)
    end

    def unselect_all : Nil
      # gtk_flow_box_unselect_all: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_unselect_all(self)
    end

    def unselect_child(child : Gtk::FlowBoxChild) : Nil
      # gtk_flow_box_unselect_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_flow_box_unselect_child(self, child)
    end

    struct ActivateCursorChildSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-cursor-child::#{@detail}" : "activate-cursor-child"
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

      def connect(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-child")
      end
    end

    def activate_cursor_child_signal
      ActivateCursorChildSignal.new(self)
    end

    struct ChildActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "child-activated::#{@detail}" : "child-activated"
      end

      def connect(&block : Proc(Gtk::FlowBoxChild, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::FlowBoxChild, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::FlowBoxChild, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::FlowBoxChild.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBoxChild, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBoxChild, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::FlowBoxChild.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBoxChild, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::FlowBoxChild.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::FlowBoxChild.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(child : Gtk::FlowBoxChild) : Nil
        LibGObject.g_signal_emit_by_name(@source, "child-activated", child)
      end
    end

    def child_activated_signal
      ChildActivatedSignal.new(self)
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

      def connect(block : Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = GICrystal.to_bool(lib_arg3)
          ::Box(Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
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

      def connect(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
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

    struct SelectedChildrenChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "selected-children-changed::#{@detail}" : "selected-children-changed"
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

      def connect(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selected-children-changed")
      end
    end

    def selected_children_changed_signal
      SelectedChildrenChangedSignal.new(self)
    end

    struct ToggleCursorChildSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-cursor-child::#{@detail}" : "toggle-cursor-child"
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

      def connect(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-child")
      end
    end

    def toggle_cursor_child_signal
      ToggleCursorChildSignal.new(self)
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

      def connect(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FlowBox, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::FlowBox.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(box).call(sender)
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
