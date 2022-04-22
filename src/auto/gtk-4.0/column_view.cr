require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./scrollable"

module Gtk
  # `GtkColumnView` presents a large dynamic list of items using multiple columns
  # with headers.
  #
  # `GtkColumnView` uses the factories of its columns to generate a cell widget for
  # each column, for each visible item and displays them together as the row for
  # this item.
  #
  # The [property@Gtk.ColumnView:show-row-separators] and
  # [property@Gtk.ColumnView:show-column-separators] properties offer a simple way
  # to display separators between the rows or columns.
  #
  # `GtkColumnView` allows the user to select items according to the selection
  # characteristics of the model. For models that allow multiple selected items,
  # it is possible to turn on *rubberband selection*, using
  # [property@Gtk.ColumnView:enable-rubberband].
  #
  # The column view supports sorting that can be customized by the user by
  # clicking on column headers. To set this up, the `GtkSorter` returned by
  # `Gtk::ColumnView#sorter` must be attached to a sort model for the
  # data that the view is showing, and the columns must have sorters attached to
  # them by calling `Gtk::ColumnViewColumn#sorter=`. The initial sort
  # order can be set with `Gtk::ColumnView#sort_by_column`.
  #
  # The column view also supports interactive resizing and reordering of
  # columns, via Drag-and-Drop of the column headers. This can be enabled or
  # disabled with the `Gtk::ColumnView#reorderable` and
  # `Gtk::ColumnViewColumn#resizable` properties.
  #
  # To learn more about the list widget framework, see the
  # [overview](section-list-widget.html).
  #
  # # CSS nodes
  #
  # ```
  # columnview[.column-separators][.rich-list][.navigation-sidebar][.data-table]
  # ├── header
  # │   ├── <column header>
  # ┊   ┊
  # │   ╰── <column header>
  # │
  # ├── listview
  # │
  # ┊
  # ╰── [rubberband]
  # ```
  #
  # `GtkColumnView` uses a single CSS node named columnview. It may carry the
  # .column-separators style class, when [property@Gtk.ColumnView:show-column-separators]
  # property is set. Header widgets appear below a node with name header.
  # The rows are contained in a `GtkListView` widget, so there is a listview
  # node with the same structure as for a standalone `GtkListView` widget.
  # If [property@Gtk.ColumnView:show-row-separators] is set, it will be passed
  # on to the list view, causing its CSS node to carry the .separators style class.
  # For rubberband selection, a node with name rubberband is used.
  #
  # The main columnview node may also carry style classes to select
  # the style of [list presentation](section-list-widget.html#list-styles):
  # .rich-list, .navigation-sidebar or .data-table.
  #
  # # Accessibility
  #
  # `GtkColumnView` uses the %GTK_ACCESSIBLE_ROLE_TREE_GRID role, header title
  # widgets are using the %GTK_ACCESSIBLE_ROLE_COLUMN_HEADER role. The row widgets
  # are using the %GTK_ACCESSIBLE_ROLE_ROW role, and individual cells are using
  # the %GTK_ACCESSIBLE_ROLE_GRID_CELL role
  @[GObject::GeneratedWrapper]
  class ColumnView < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ColumnViewClass), class_init,
        sizeof(LibGtk::ColumnView), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, columns : Gio::ListModel? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_rubberband : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gtk::SelectionModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reorderable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_column_separators : Bool? = nil, show_row_separators : Bool? = nil, single_click_activate : Bool? = nil, sorter : Gtk::Sorter? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
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
      if !enable_rubberband.nil?
        (_names.to_unsafe + _n).value = "enable-rubberband".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_rubberband)
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
      if !show_column_separators.nil?
        (_names.to_unsafe + _n).value = "show-column-separators".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_column_separators)
        _n += 1
      end
      if !show_row_separators.nil?
        (_names.to_unsafe + _n).value = "show-row-separators".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_row_separators)
        _n += 1
      end
      if !single_click_activate.nil?
        (_names.to_unsafe + _n).value = "single-click-activate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_click_activate)
        _n += 1
      end
      if !sorter.nil?
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
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

      @pointer = LibGObject.g_object_new_with_properties(ColumnView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_column_view_get_type
    end

    def columns : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "columns", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def enable_rubberband=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-rubberband", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_rubberband? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-rubberband", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def model=(value : Gtk::SelectionModel?) : Gtk::SelectionModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    def show_column_separators=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-column-separators", unsafe_value, Pointer(Void).null)
      value
    end

    def show_column_separators? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-column-separators", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_row_separators=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-row-separators", unsafe_value, Pointer(Void).null)
      value
    end

    def show_row_separators? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-row-separators", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def single_click_activate=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "single-click-activate", unsafe_value, Pointer(Void).null)
      value
    end

    def single_click_activate? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "single-click-activate", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def sorter : Gtk::Sorter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "sorter", pointerof(value), Pointer(Void).null)
      Gtk::Sorter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkColumnView`.
    #
    # You most likely want to call `Gtk::ColumnView#append_column`
    # to add columns next.
    def initialize(model : Gtk::SelectionModel?)
      # gtk_column_view_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_column_view_new(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Appends the @column to the end of the columns in @self.
    def append_column(column : Gtk::ColumnViewColumn) : Nil
      # gtk_column_view_append_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_append_column(self, column)

      # Return value handling
    end

    # Gets the list of columns in this column view.
    #
    # This list is constant over the lifetime of @self and can be used to
    # monitor changes to the columns of @self by connecting to the
    # ::items-changed signal.
    def columns : Gio::ListModel
      # gtk_column_view_get_columns: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_columns(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Returns whether rows can be selected by dragging with the mouse.
    def enable_rubberband : Bool
      # gtk_column_view_get_enable_rubberband: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_enable_rubberband(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the model that's currently used to read the items displayed.
    def model : Gtk::SelectionModel?
      # gtk_column_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_model(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether columns are reorderable.
    def reorderable : Bool
      # gtk_column_view_get_reorderable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_reorderable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the list should show separators
    # between columns.
    def show_column_separators : Bool
      # gtk_column_view_get_show_column_separators: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_show_column_separators(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the list should show separators
    # between rows.
    def show_row_separators : Bool
      # gtk_column_view_get_show_row_separators: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_show_row_separators(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether rows will be activated on single click and
    # selected on hover.
    def single_click_activate : Bool
      # gtk_column_view_get_single_click_activate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_single_click_activate(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns a special sorter that reflects the users sorting
    # choices in the column view.
    #
    # To allow users to customizable sorting by clicking on column
    # headers, this sorter needs to be set on the sort model underneath
    # the model that is displayed by the view.
    #
    # See `Gtk::ColumnViewColumn#sorter=` for setting up
    # per-column sorting.
    #
    # Here is an example:
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # gtk_column_view_column_set_sorter (column, sorter);
    # gtk_column_view_append_column (view, column);
    # sorter = g_object_ref (gtk_column_view_get_sorter (view)));
    # model = gtk_sort_list_model_new (store, sorter);
    # selection = gtk_no_selection_new (model);
    # gtk_column_view_set_model (view, selection);
    # ```
    def sorter : Gtk::Sorter?
      # gtk_column_view_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_get_sorter(self)

      # Return value handling

      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Inserts a column at the given position in the columns of @self.
    #
    # If @column is already a column of @self, it will be repositioned.
    def insert_column(position : UInt32, column : Gtk::ColumnViewColumn) : Nil
      # gtk_column_view_insert_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_insert_column(self, position, column)

      # Return value handling
    end

    # Removes the @column from the list of columns of @self.
    def remove_column(column : Gtk::ColumnViewColumn) : Nil
      # gtk_column_view_remove_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_remove_column(self, column)

      # Return value handling
    end

    # Sets whether selections can be changed by dragging with the mouse.
    def enable_rubberband=(enable_rubberband : Bool) : Nil
      # gtk_column_view_set_enable_rubberband: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_set_enable_rubberband(self, enable_rubberband)

      # Return value handling
    end

    # Sets the model to use.
    #
    # This must be a `Gtk#SelectionModel`.
    def model=(model : Gtk::SelectionModel?) : Nil
      # gtk_column_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_column_view_set_model(self, model)

      # Return value handling
    end

    # Sets whether columns should be reorderable by dragging.
    def reorderable=(reorderable : Bool) : Nil
      # gtk_column_view_set_reorderable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_set_reorderable(self, reorderable)

      # Return value handling
    end

    # Sets whether the list should show separators
    # between columns.
    def show_column_separators=(show_column_separators : Bool) : Nil
      # gtk_column_view_set_show_column_separators: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_set_show_column_separators(self, show_column_separators)

      # Return value handling
    end

    # Sets whether the list should show separators
    # between rows.
    def show_row_separators=(show_row_separators : Bool) : Nil
      # gtk_column_view_set_show_row_separators: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_set_show_row_separators(self, show_row_separators)

      # Return value handling
    end

    # Sets whether rows should be activated on single click and
    # selected on hover.
    def single_click_activate=(single_click_activate : Bool) : Nil
      # gtk_column_view_set_single_click_activate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_set_single_click_activate(self, single_click_activate)

      # Return value handling
    end

    # Sets the sorting of the view.
    #
    # This function should be used to set up the initial sorting.
    # At runtime, users can change the sorting of a column view
    # by clicking on the list headers.
    #
    # This call only has an effect if the sorter returned by
    # `Gtk::ColumnView#sorter` is set on a sort model,
    # and `Gtk::ColumnViewColumn#sorter=` has been called
    # on @column to associate a sorter with the column.
    #
    # If @column is %NULL, the view will be unsorted.
    def sort_by_column(column : Gtk::ColumnViewColumn?, direction : Gtk::SortType) : Nil
      # gtk_column_view_sort_by_column: (Method)
      # @column: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      column = if column.nil?
                 Pointer(Void).null
               else
                 column.to_unsafe
               end

      # C call
      LibGtk.gtk_column_view_sort_by_column(self, column, direction)

      # Return value handling
    end

    # Emitted when a row has been activated by the user, usually via activating
    # the GtkListBase|list.activate-item action.
    #
    # This allows for a convenient way to handle activation in a columnview.
    # See `Gtk::ListItem#activatable=` for details on how to use this
    # signal.
    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(&block : Proc(UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(UInt32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ColumnView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ColumnView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::ColumnView, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ColumnView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ColumnView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::ColumnView, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(position : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate", position)
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end
  end
end
