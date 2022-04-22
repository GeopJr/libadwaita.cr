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
  # Children are added using `Gtk::Grid#attach`. They can span multiple
  # rows or columns. It is also possible to add a child next to an existing
  # child, using `Gtk::Grid#attach_next_to`. To remove a child from the
  # grid, use `Gtk::Grid#remove`.
  #
  # The behaviour of `GtkGrid` when several children occupy the same grid
  # cell is undefined.
  #
  # # GtkGrid as GtkBuildable
  #
  # Every child in a `GtkGrid` has access to a custom `Gtk#Buildable`
  # element, called `<layout>`. It can by used to specify a position in the
  # grid and optionally spans. All properties that can be used in the `<layout>`
  # element are implemented by `Gtk#GridLayoutChild`.
  #
  # It is implemented by `GtkWidget` using `Gtk#LayoutManager`.
  #
  # To showcase it, here is a simple example:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  @[GObject::GeneratedWrapper]
  class Grid < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GridClass), class_init,
        sizeof(LibGtk::Grid), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, baseline_row : Int32? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, column_homogeneous : Bool? = nil, column_spacing : Int32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, row_homogeneous : Bool? = nil, row_spacing : Int32? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[41]
      _values = StaticArray(LibGObject::Value, 41).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !baseline_row.nil?
        (_names.to_unsafe + _n).value = "baseline-row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_row)
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
      if !column_homogeneous.nil?
        (_names.to_unsafe + _n).value = "column-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_homogeneous)
        _n += 1
      end
      if !column_spacing.nil?
        (_names.to_unsafe + _n).value = "column-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_spacing)
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
      if !row_homogeneous.nil?
        (_names.to_unsafe + _n).value = "row-homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, row_homogeneous)
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

      @pointer = LibGObject.g_object_new_with_properties(Grid.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new grid widget.
    def initialize
      # gtk_grid_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Adds a widget to the grid.
    #
    # The position of @child is determined by @column and @row.
    # The number of “cells” that @child will occupy is determined
    # by @width and @height.
    def attach(child : Gtk::Widget, column : Int32, row : Int32, width : Int32, height : Int32) : Nil
      # gtk_grid_attach: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_attach(self, child, column, row, width, height)

      # Return value handling
    end

    # Adds a widget to the grid.
    #
    # The widget is placed next to @sibling, on the side determined by
    # @side. When @sibling is %NULL, the widget is placed in row (for
    # left or right placement) or column 0 (for top or bottom placement),
    # at the end indicated by @side.
    #
    # Attaching widgets labeled `[1]`, `[2]`, `[3]` with `@sibling == %NULL` and
    # `@side == %GTK_POS_LEFT` yields a layout of `[3][2][1]`.
    def attach_next_to(child : Gtk::Widget, sibling : Gtk::Widget?, side : Gtk::PositionType, width : Int32, height : Int32) : Nil
      # gtk_grid_attach_next_to: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibGtk.gtk_grid_attach_next_to(self, child, sibling, side, width, height)

      # Return value handling
    end

    # Returns which row defines the global baseline of @grid.
    def baseline_row : Int32
      # gtk_grid_get_baseline_row: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_baseline_row(self)

      # Return value handling

      _retval
    end

    # Gets the child of @grid whose area covers the grid
    # cell at @column, @row.
    def child_at(column : Int32, row : Int32) : Gtk::Widget?
      # gtk_grid_get_child_at: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_child_at(self, column, row)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether all columns of @grid have the same width.
    def column_homogeneous : Bool
      # gtk_grid_get_column_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_column_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the amount of space between the columns of @grid.
    def column_spacing : UInt32
      # gtk_grid_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_column_spacing(self)

      # Return value handling

      _retval
    end

    # Returns the baseline position of @row.
    #
    # See `Gtk::Grid#row_baseline_position=`.
    def row_baseline_position(row : Int32) : Gtk::BaselinePosition
      # gtk_grid_get_row_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_row_baseline_position(self, row)

      # Return value handling

      Gtk::BaselinePosition.new(_retval)
    end

    # Returns whether all rows of @grid have the same height.
    def row_homogeneous : Bool
      # gtk_grid_get_row_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_row_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the amount of space between the rows of @grid.
    def row_spacing : UInt32
      # gtk_grid_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_get_row_spacing(self)

      # Return value handling

      _retval
    end

    # Inserts a column at the specified position.
    #
    # Children which are attached at or to the right of this position
    # are moved one column to the right. Children which span across this
    # position are grown to span the new column.
    def insert_column(position : Int32) : Nil
      # gtk_grid_insert_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_insert_column(self, position)

      # Return value handling
    end

    # Inserts a row or column at the specified position.
    #
    # The new row or column is placed next to @sibling, on the side
    # determined by @side. If @side is %GTK_POS_TOP or %GTK_POS_BOTTOM,
    # a row is inserted. If @side is %GTK_POS_LEFT of %GTK_POS_RIGHT,
    # a column is inserted.
    def insert_next_to(sibling : Gtk::Widget, side : Gtk::PositionType) : Nil
      # gtk_grid_insert_next_to: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_insert_next_to(self, sibling, side)

      # Return value handling
    end

    # Inserts a row at the specified position.
    #
    # Children which are attached at or below this position
    # are moved one row down. Children which span across this
    # position are grown to span the new row.
    def insert_row(position : Int32) : Nil
      # gtk_grid_insert_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_insert_row(self, position)

      # Return value handling
    end

    # Queries the attach points and spans of @child inside the given `GtkGrid`.
    def query_child(child : Gtk::Widget) : Nil
      # gtk_grid_query_child: (Method)
      # @column: (out) (transfer full) (optional)
      # @row: (out) (transfer full) (optional)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      column = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      row = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_grid_query_child(self, child, column, row, width, height)

      # Return value handling
    end

    # Removes a child from @grid.
    #
    # The child must have been added with
    # `Gtk::Grid#attach` or `Gtk::Grid#attach_next_to`.
    def remove(child : Gtk::Widget) : Nil
      # gtk_grid_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_remove(self, child)

      # Return value handling
    end

    # Removes a column from the grid.
    #
    # Children that are placed in this column are removed,
    # spanning children that overlap this column have their
    # width reduced by one, and children after the column
    # are moved to the left.
    def remove_column(position : Int32) : Nil
      # gtk_grid_remove_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_remove_column(self, position)

      # Return value handling
    end

    # Removes a row from the grid.
    #
    # Children that are placed in this row are removed,
    # spanning children that overlap this row have their
    # height reduced by one, and children below the row
    # are moved up.
    def remove_row(position : Int32) : Nil
      # gtk_grid_remove_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_remove_row(self, position)

      # Return value handling
    end

    # Sets which row defines the global baseline for the entire grid.
    #
    # Each row in the grid can have its own local baseline, but only
    # one of those is global, meaning it will be the baseline in the
    # parent of the @grid.
    def baseline_row=(row : Int32) : Nil
      # gtk_grid_set_baseline_row: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_baseline_row(self, row)

      # Return value handling
    end

    # Sets whether all columns of @grid will have the same width.
    def column_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_set_column_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_column_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the amount of space between columns of @grid.
    def column_spacing=(spacing : UInt32) : Nil
      # gtk_grid_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_column_spacing(self, spacing)

      # Return value handling
    end

    # Sets how the baseline should be positioned on @row of the
    # grid, in case that row is assigned more space than is requested.
    #
    # The default baseline position is %GTK_BASELINE_POSITION_CENTER.
    def set_row_baseline_position(row : Int32, pos : Gtk::BaselinePosition) : Nil
      # gtk_grid_set_row_baseline_position: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_row_baseline_position(self, row, pos)

      # Return value handling
    end

    # Sets whether all rows of @grid will have the same height.
    def row_homogeneous=(homogeneous : Bool) : Nil
      # gtk_grid_set_row_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_row_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the amount of space between rows of @grid.
    def row_spacing=(spacing : UInt32) : Nil
      # gtk_grid_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_set_row_spacing(self, spacing)

      # Return value handling
    end
  end
end
