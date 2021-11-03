require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # `GtkGrid` is a container which arranges its child widgets in
  # rows and columns.
  #
  # ![An example GtkGrid](grid.png)
  #
  # It supports arbitrary positions and horizontal/vertical spans.
  #
  # Children are added using [method@Gtk.Grid.attach]. They can span multiple
  # rows or columns. It is also possible to add a child next to an existing
  # child, using [method@Gtk.Grid.attach_next_to]. To remove a child from the
  # grid, use [method@Gtk.Grid.remove].
  #
  # The behaviour of `GtkGrid` when several children occupy the same grid
  # cell is undefined.
  #
  # # GtkGrid as GtkBuildable
  #
  # Every child in a `GtkGrid` has access to a custom [iface@Gtk.Buildable]
  # element, called `<layout>`. It can by used to specify a position in the
  # grid and optionally spans. All properties that can be used in the `<layout>`
  # element are implemented by [class@Gtk.GridLayoutChild].
  #
  # It is implemented by `GtkWidget` using [class@Gtk.LayoutManager].
  #
  # To showcase it, here is a simple example:
  #
  # ```xml
  # <object class="GtkGrid" id="my_grid">
  #   <child>
  #     <object class="GtkButton" id="button1">
  #       <property name="label">Button 1</property>
  #       <layout>
  #         <property name="column">0</property>
  #         <property name="row">0</property>
  #       </layout>
  #     </object>
  #   </child>
  #   <child>
  #     <object class="GtkButton" id="button2">
  #       <property name="label">Button 2</property>
  #       <layout>
  #         <property name="column">1</property>
  #         <property name="row">0</property>
  #       </layout>
  #     </object>
  #   </child>
  #   <child>
  #     <object class="GtkButton" id="button3">
  #       <property name="label">Button 3</property>
  #       <layout>
  #         <property name="column">2</property>
  #         <property name="row">0</property>
  #         <property name="row-span">2</property>
  #       </layout>
  #     </object>
  #   </child>
  #   <child>
  #     <object class="GtkButton" id="button4">
  #       <property name="label">Button 4</property>
  #       <layout>
  #         <property name="column">0</property>
  #         <property name="row">1</property>
  #         <property name="column-span">2</property>
  #       </layout>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # It organizes the first two buttons side-by-side in one cell each.
  # The third button is in the last column but spans across two rows.
  # This is defined by the `row-span` property. The last button is
  # located in the second row and spans across two columns, which is
  # defined by the `column-span` property.
  #
  # # CSS nodes
  #
  # `GtkGrid` uses a single CSS node with name `grid`.
  #
  # # Accessibility
  #
  # `GtkGrid` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  class Grid < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, baseline_row : Int32? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, column_homogeneous : Bool? = nil, column_spacing : Int32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, row_homogeneous : Bool? = nil, row_spacing : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if baseline_row
        (_names.to_unsafe + _n).value = "baseline-row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_row)
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
      if column_homogeneous
        (_names.to_unsafe + _n).value = "column-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_homogeneous)
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
      if row_homogeneous
        (_names.to_unsafe + _n).value = "row-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_homogeneous)
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

      @pointer = LibGObject.g_object_new_with_properties(Grid.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_grid_get_type
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

    def initialize
      # gtk_grid_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_new
      @pointer = _retval
    end

    def attach(child : Gtk::Widget, column : Int32, row : Int32, width : Int32, height : Int32) : Nil
      # gtk_grid_attach: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_attach(self, child, column, row, width, height)
    end

    def attach_next_to(child : Gtk::Widget, sibling : Gtk::Widget?, side : Gtk::PositionType, width : Int32, height : Int32) : Nil
      # gtk_grid_attach_next_to: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      LibGtk.gtk_grid_attach_next_to(self, child, sibling, side, width, height)
    end

    def baseline_row : Int32
      # gtk_grid_get_baseline_row: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_baseline_row(self)
      _retval
    end

    def child_at(column : Int32, row : Int32) : Gtk::Widget?
      # gtk_grid_get_child_at: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_child_at(self, column, row)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def column_homogeneous : Bool
      # gtk_grid_get_column_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_column_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def column_spacing : UInt32
      # gtk_grid_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_column_spacing(self)
      _retval
    end

    def row_baseline_position(row : Int32) : Gtk::BaselinePosition
      # gtk_grid_get_row_baseline_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_row_baseline_position(self, row)
      Gtk::BaselinePosition.from_value(_retval)
    end

    def row_homogeneous : Bool
      # gtk_grid_get_row_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_row_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def row_spacing : UInt32
      # gtk_grid_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_grid_get_row_spacing(self)
      _retval
    end

    def insert_column(position : Int32) : Nil
      # gtk_grid_insert_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_insert_column(self, position)
    end

    def insert_next_to(sibling : Gtk::Widget, side : Gtk::PositionType) : Nil
      # gtk_grid_insert_next_to: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_insert_next_to(self, sibling, side)
    end

    def insert_row(position : Int32) : Nil
      # gtk_grid_insert_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_insert_row(self, position)
    end

    def query_child(child : Gtk::Widget) : Nil
      # gtk_grid_query_child: (Method)
      # @column: (out) (transfer full) (optional)
      # @row: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      column = Pointer(Int32).null
      row = Pointer(Int32).null
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibGtk.gtk_grid_query_child(self, child, column, row, width, height)
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_grid_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_remove(self, child)
    end

    def remove_column(position : Int32) : Nil
      # gtk_grid_remove_column: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_remove_column(self, position)
    end

    def remove_row(position : Int32) : Nil
      # gtk_grid_remove_row: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_remove_row(self, position)
    end

    def baseline_row=(row : Int32) : Nil
      # gtk_grid_set_baseline_row: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_baseline_row(self, row)
    end

    def column_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_set_column_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_column_homogeneous(self, homogeneous)
    end

    def column_spacing=(spacing : UInt32) : Nil
      # gtk_grid_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_column_spacing(self, spacing)
    end

    def set_row_baseline_position(row : Int32, pos : Gtk::BaselinePosition) : Nil
      # gtk_grid_set_row_baseline_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_row_baseline_position(self, row, pos)
    end

    def row_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_set_row_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_row_homogeneous(self, homogeneous)
    end

    def row_spacing=(spacing : UInt32) : Nil
      # gtk_grid_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_grid_set_row_spacing(self, spacing)
    end
  end
end
