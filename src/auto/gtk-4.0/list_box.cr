require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkListBox` is a vertical list.
  #
  # A `GtkListBox` only contains `GtkListBoxRow` children. These rows can
  # by dynamically sorted and filtered, and headers can be added dynamically
  # depending on the row content. It also allows keyboard and mouse navigation
  # and selection like a typical list.
  #
  # Using `GtkListBox` is often an alternative to `GtkTreeView`, especially
  # when the list contents has a more complicated layout than what is allowed
  # by a `GtkCellRenderer`, or when the contents is interactive (i.e. has a
  # button in it).
  #
  # Although a `GtkListBox` must have only `GtkListBoxRow` children, you can
  # add any kind of widget to it via `Gtk::ListBox#prepend`,
  # `Gtk::ListBox#append` and `Gtk::ListBox#insert` and a
  # `GtkListBoxRow` widget will automatically be inserted between the list
  # and the widget.
  #
  # `GtkListBoxRows` can be marked as activatable or selectable. If a row is
  # activatable, [signal@Gtk.ListBox::row-activated] will be emitted for it when
  # the user tries to activate it. If it is selectable, the row will be marked
  # as selected when the user tries to select it.
  #
  # # GtkListBox as GtkBuildable
  #
  # The `GtkListBox` implementation of the `GtkBuildable` interface supports
  # setting a child as the placeholder by specifying “placeholder” as the “type”
  # attribute of a <child> element. See `Gtk::ListBox#placeholder=`
  # for info.
  #
  # # CSS nodes
  #
  # |[<!-- language="plain" -->
  # list[.separators][.rich-list][.navigation-sidebar]
  # ╰── row[.activatable]
  # ]|
  #
  # `GtkListBox` uses a single CSS node named list. It may carry the .separators
  # style class, when the [property@Gtk.ListBox:show-separators] property is set.
  # Each `GtkListBoxRow` uses a single CSS node named row. The row nodes get the
  # .activatable style class added when appropriate.
  #
  # The main list node may also carry style classes to select
  # the style of [list presentation](section-list-widget.html#list-styles):
  # .rich-list, .navigation-sidebar or .data-table.
  #
  # # Accessibility
  #
  # `GtkListBox` uses the %GTK_ACCESSIBLE_ROLE_LIST role and `GtkListBoxRow` uses
  # the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
  @[GObject::GeneratedWrapper]
  class ListBox < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::ListBox), instance_init, 0)
    end

    GICrystal.define_new_method(ListBox, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ListBox`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accept_unpaired_release : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, show_separators : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if !accept_unpaired_release.nil?
        (_names.to_unsafe + _n).value = "accept-unpaired-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accept_unpaired_release)
        _n += 1
      end
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
      if !show_separators.nil?
        (_names.to_unsafe + _n).value = "show-separators".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_separators)
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

      @pointer = LibGObject.g_object_new_with_properties(ListBox.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_box_get_type
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

    def show_separators=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-separators", unsafe_value, Pointer(Void).null)
      value
    end

    def show_separators? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-separators", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkListBox` container.
    def initialize
      # gtk_list_box_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Append a widget to the list.
    #
    # If a sort function is set, the widget will
    # actually be inserted at the calculated position.
    def append(child : Gtk::Widget) : Nil
      # gtk_list_box_append: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_append(@pointer, child)

      # Return value handling
    end

    # Binds @model to @box.
    #
    # If @box was already bound to a model, that previous binding is
    # destroyed.
    #
    # The contents of @box are cleared and then filled with widgets that
    # represent items from @model. @box is updated whenever @model changes.
    # If @model is %NULL, @box is left empty.
    #
    # It is undefined to add or remove widgets directly (for example, with
    # `Gtk::ListBox#insert`) while @box is bound to a model.
    #
    # Note that using a model is incompatible with the filtering and sorting
    # functionality in `GtkListBox`. When using a model, filtering and sorting
    # should be implemented by the model.
    def bind_model(model : Gio::ListModel?, create_widget_func : Gtk::ListBoxCreateWidgetFunc?) : Nil
      # gtk_list_box_bind_model: (Method)
      # @model: (nullable)
      # @create_widget_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      # Generator::CallbackArgPlan
      if create_widget_func
        _box = ::Box.box(create_widget_func)
        create_widget_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          item = GObject::Object.new(lib_item, :none)
          ::Box(Proc(GObject::Object, Gtk::Widget)).unbox(lib_user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_data_free_func = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        create_widget_func = user_data = user_data_free_func = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_list_box_bind_model(@pointer, model, create_widget_func, user_data, user_data_free_func)

      # Return value handling
    end

    # Add a drag highlight to a row.
    #
    # This is a helper function for implementing DnD onto a `GtkListBox`.
    # The passed in @row will be highlighted by setting the
    # %GTK_STATE_FLAG_DROP_ACTIVE state and any previously highlighted
    # row will be unhighlighted.
    #
    # The row will also be unhighlighted when the widget gets
    # a drag leave event.
    def drag_highlight_row(row : Gtk::ListBoxRow) : Nil
      # gtk_list_box_drag_highlight_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_drag_highlight_row(@pointer, row)

      # Return value handling
    end

    # If a row has previously been highlighted via gtk_list_box_drag_highlight_row(),
    # it will have the highlight removed.
    def drag_unhighlight_row : Nil
      # gtk_list_box_drag_unhighlight_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_drag_unhighlight_row(@pointer)

      # Return value handling
    end

    # Returns whether rows activate on single clicks.
    def activate_on_single_click : Bool
      # gtk_list_box_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_activate_on_single_click(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the adjustment (if any) that the widget uses to
    # for vertical scrolling.
    def adjustment : Gtk::Adjustment?
      # gtk_list_box_get_adjustment: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_adjustment(@pointer)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the n-th child in the list (not counting headers).
    #
    # If @index_ is negative or larger than the number of items in the
    # list, %NULL is returned.
    def row_at_index(index_ : Int32) : Gtk::ListBoxRow?
      # gtk_list_box_get_row_at_index: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_row_at_index(@pointer, index_)

      # Return value handling

      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the row at the @y position.
    def row_at_y(y : Int32) : Gtk::ListBoxRow?
      # gtk_list_box_get_row_at_y: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_row_at_y(@pointer, y)

      # Return value handling

      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the selected row, or %NULL if no rows are selected.
    #
    # Note that the box may allow multiple selection, in which
    # case you should use `Gtk::ListBox#selected_foreach` to
    # find all selected rows.
    def selected_row : Gtk::ListBoxRow?
      # gtk_list_box_get_selected_row: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_selected_row(@pointer)

      # Return value handling

      Gtk::ListBoxRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Creates a list of all selected children.
    def selected_rows : GLib::List
      # gtk_list_box_get_selected_rows: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_list_box_get_selected_rows(@pointer)

      # Return value handling

      GLib::List(Gtk::ListBoxRow).new(_retval, GICrystal::Transfer::Container)
    end

    # Gets the selection mode of the listbox.
    def selection_mode : Gtk::SelectionMode
      # gtk_list_box_get_selection_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_selection_mode(@pointer)

      # Return value handling

      Gtk::SelectionMode.new(_retval)
    end

    # Returns whether the list box should show separators
    # between rows.
    def show_separators : Bool
      # gtk_list_box_get_show_separators: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_box_get_show_separators(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Insert the @child into the @box at @position.
    #
    # If a sort function is
    # set, the widget will actually be inserted at the calculated position.
    #
    # If @position is -1, or larger than the total number of items in the
    # @box, then the @child will be appended to the end.
    def insert(child : Gtk::Widget, position : Int32) : Nil
      # gtk_list_box_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_insert(@pointer, child, position)

      # Return value handling
    end

    # Update the filtering for all rows.
    #
    # Call this when result
    # of the filter function on the @box is changed due
    # to an external factor. For instance, this would be used
    # if the filter function just looked for a specific search
    # string and the entry with the search string has changed.
    def invalidate_filter : Nil
      # gtk_list_box_invalidate_filter: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_invalidate_filter(@pointer)

      # Return value handling
    end

    # Update the separators for all rows.
    #
    # Call this when result
    # of the header function on the @box is changed due
    # to an external factor.
    def invalidate_headers : Nil
      # gtk_list_box_invalidate_headers: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_invalidate_headers(@pointer)

      # Return value handling
    end

    # Update the sorting for all rows.
    #
    # Call this when result
    # of the sort function on the @box is changed due
    # to an external factor.
    def invalidate_sort : Nil
      # gtk_list_box_invalidate_sort: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_invalidate_sort(@pointer)

      # Return value handling
    end

    # Prepend a widget to the list.
    #
    # If a sort function is set, the widget will
    # actually be inserted at the calculated position.
    def prepend(child : Gtk::Widget) : Nil
      # gtk_list_box_prepend: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_prepend(@pointer, child)

      # Return value handling
    end

    # Removes a child from @box.
    def remove(child : Gtk::Widget) : Nil
      # gtk_list_box_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_remove(@pointer, child)

      # Return value handling
    end

    # Select all children of @box, if the selection mode allows it.
    def select_all : Nil
      # gtk_list_box_select_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_select_all(@pointer)

      # Return value handling
    end

    # Make @row the currently selected row.
    def select_row(row : Gtk::ListBoxRow?) : Nil
      # gtk_list_box_select_row: (Method)
      # @row: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      row = if row.nil?
              Pointer(Void).null
            else
              row.to_unsafe
            end

      # C call
      LibGtk.gtk_list_box_select_row(@pointer, row)

      # Return value handling
    end

    # Calls a function for each selected child.
    #
    # Note that the selection cannot be modified from within this function.
    def selected_foreach(func : Gtk::ListBoxForeachFunc, data : Pointer(Void)?) : Nil
      # gtk_list_box_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_list_box_selected_foreach(@pointer, func, data)

      # Return value handling
    end

    # If @single is %TRUE, rows will be activated when you click on them,
    # otherwise you need to double-click.
    def activate_on_single_click=(single : Bool) : Nil
      # gtk_list_box_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_set_activate_on_single_click(@pointer, single)

      # Return value handling
    end

    # Sets the adjustment (if any) that the widget uses to
    # for vertical scrolling.
    #
    # For instance, this is used to get the page size for
    # PageUp/Down key handling.
    #
    # In the normal case when the @box is packed inside
    # a `GtkScrolledWindow` the adjustment from that will
    # be picked up automatically, so there is no need
    # to manually do that.
    def adjustment=(adjustment : Gtk::Adjustment?) : Nil
      # gtk_list_box_set_adjustment: (Method)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      # C call
      LibGtk.gtk_list_box_set_adjustment(@pointer, adjustment)

      # Return value handling
    end

    # By setting a filter function on the @box one can decide dynamically which
    # of the rows to show.
    #
    # For instance, to implement a search function on a list that
    # filters the original list to only show the matching rows.
    #
    # The @filter_func will be called for each row after the call, and
    # it will continue to be called each time a row changes (via
    # `Gtk::ListBoxRow#changed`) or when `Gtk::ListBox#invalidate_filter`
    # is called.
    #
    # Note that using a filter function is incompatible with using a model
    # (see `Gtk::ListBox#bind_model`).
    def filter_func=(filter_func : Gtk::ListBoxFilterFunc?) : Nil
      # gtk_list_box_set_filter_func: (Method)
      # @filter_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if filter_func
        _box = ::Box.box(filter_func)
        filter_func = ->(lib_row : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          ::Box(Proc(Gtk::ListBoxRow, Bool)).unbox(lib_user_data).call(row)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        filter_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_list_box_set_filter_func(@pointer, filter_func, user_data, destroy)

      # Return value handling
    end

    # Sets a header function.
    #
    # By setting a header function on the @box one can dynamically add headers
    # in front of rows, depending on the contents of the row and its position
    # in the list.
    #
    # For instance, one could use it to add headers in front of the first item
    # of a new kind, in a list sorted by the kind.
    #
    # The @update_header can look at the current header widget using
    # `Gtk::ListBoxRow#header` and either update the state of the widget
    # as needed, or set a new one using `Gtk::ListBoxRow#header=`. If no
    # header is needed, set the header to %NULL.
    #
    # Note that you may get many calls @update_header to this for a particular
    # row when e.g. changing things that don’t affect the header. In this case
    # it is important for performance to not blindly replace an existing header
    # with an identical one.
    #
    # The @update_header function will be called for each row after the call,
    # and it will continue to be called each time a row changes (via
    # `Gtk::ListBoxRow#changed`) and when the row before changes (either
    # by `Gtk::ListBoxRow#changed` on the previous row, or when the previous
    # row becomes a different row). It is also called for all rows when
    # `Gtk::ListBox#invalidate_headers` is called.
    def header_func=(update_header : Gtk::ListBoxUpdateHeaderFunc?) : Nil
      # gtk_list_box_set_header_func: (Method)
      # @update_header: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if update_header
        _box = ::Box.box(update_header)
        update_header = ->(lib_row : Pointer(Void), lib_before : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          # Generator::NullableArrayPlan
          before = (lib_before.null? ? nil : Gtk::ListBoxRow.new(lib_before, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          before = Gtk::ListBoxRow.new(lib_before, :none) unless lib_before.null?
          ::Box(Proc(Gtk::ListBoxRow, Gtk::ListBoxRow?, Nil)).unbox(lib_user_data).call(row, before)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        update_header = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_list_box_set_header_func(@pointer, update_header, user_data, destroy)

      # Return value handling
    end

    # Sets the placeholder widget that is shown in the list when
    # it doesn't display any visible children.
    def placeholder=(placeholder : Gtk::Widget?) : Nil
      # gtk_list_box_set_placeholder: (Method)
      # @placeholder: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      placeholder = if placeholder.nil?
                      Pointer(Void).null
                    else
                      placeholder.to_unsafe
                    end

      # C call
      LibGtk.gtk_list_box_set_placeholder(@pointer, placeholder)

      # Return value handling
    end

    # Sets how selection works in the listbox.
    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_list_box_set_selection_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_set_selection_mode(@pointer, mode)

      # Return value handling
    end

    # Sets whether the list box should show separators
    # between rows.
    def show_separators=(show_separators : Bool) : Nil
      # gtk_list_box_set_show_separators: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_set_show_separators(@pointer, show_separators)

      # Return value handling
    end

    # Sets a sort function.
    #
    # By setting a sort function on the @box one can dynamically reorder
    # the rows of the list, based on the contents of the rows.
    #
    # The @sort_func will be called for each row after the call, and will
    # continue to be called each time a row changes (via
    # `Gtk::ListBoxRow#changed`) and when `Gtk::ListBox#invalidate_sort`
    # is called.
    #
    # Note that using a sort function is incompatible with using a model
    # (see `Gtk::ListBox#bind_model`).
    def sort_func=(sort_func : Gtk::ListBoxSortFunc?) : Nil
      # gtk_list_box_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_row1 : Pointer(Void), lib_row2 : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          row1 = Gtk::ListBoxRow.new(lib_row1, :none)
          # Generator::BuiltInTypeArgPlan
          row2 = Gtk::ListBoxRow.new(lib_row2, :none)
          ::Box(Proc(Gtk::ListBoxRow, Gtk::ListBoxRow, Int32)).unbox(lib_user_data).call(row1, row2)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_list_box_set_sort_func(@pointer, sort_func, user_data, destroy)

      # Return value handling
    end

    # Unselect all children of @box, if the selection mode allows it.
    def unselect_all : Nil
      # gtk_list_box_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_unselect_all(@pointer)

      # Return value handling
    end

    # Unselects a single row of @box, if the selection mode allows it.
    def unselect_row(row : Gtk::ListBoxRow) : Nil
      # gtk_list_box_unselect_row: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_box_unselect_row(@pointer, row)

      # Return value handling
    end

    struct ActivateCursorRowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-cursor-row::#{@detail}" : "activate-cursor-row"
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

      def connect(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-row")
      end
    end

    def activate_cursor_row_signal
      ActivateCursorRowSignal.new(self)
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

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : Int32, lib_p1 : LibC::Int, lib_p2 : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gtk::MovementStep.new(lib_object)
          p0 = lib_p0
          p1 = lib_p1
          p2 = lib_p2
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(_lib_box).call(object, p0, p1, p2)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : Int32, lib_p1 : LibC::Int, lib_p2 : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gtk::MovementStep.new(lib_object)
          p0 = lib_p0
          p1 = lib_p1
          p2 = lib_p2
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(_lib_box).call(object, p0, p1, p2)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : Int32, lib_p1 : LibC::Int, lib_p2 : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gtk::MovementStep.new(lib_object)
          p0 = lib_p0
          p1 = lib_p1
          p2 = lib_p2
          ::Box(Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(_lib_box).call(_sender, object, p0, p1, p2)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : Int32, lib_p1 : LibC::Int, lib_p2 : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gtk::MovementStep.new(lib_object)
          p0 = lib_p0
          p1 = lib_p1
          p2 = lib_p2
          ::Box(Proc(Gtk::ListBox, Gtk::MovementStep, Int32, Bool, Bool, Nil)).unbox(_lib_box).call(_sender, object, p0, p1, p2)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gtk::MovementStep, p0 : Int32, p1 : Bool, p2 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", object, p0, p1, p2)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    # Emitted when a row has been activated by the user.
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

      def connect(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListBoxRow, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListBoxRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(_lib_box).call(row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBoxRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          ::Box(Proc(Gtk::ListBoxRow, Nil)).unbox(_lib_box).call(row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(_lib_box).call(_sender, row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none)
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)).unbox(_lib_box).call(_sender, row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(row : Gtk::ListBoxRow) : Nil
        LibGObject.g_signal_emit_by_name(@source, "row-activated", row)
      end
    end

    def row_activated_signal
      RowActivatedSignal.new(self)
    end

    # Emitted when a new row is selected, or (with a %NULL @row)
    # when the selection is cleared.
    #
    # When the @box is using %GTK_SELECTION_MULTIPLE, this signal will not
    # give you the full picture of selection changes, and you should use
    # the [signal@Gtk.ListBox::selected-rows-changed] signal instead.
    struct RowSelectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "row-selected::#{@detail}" : "row-selected"
      end

      def connect(&block : Proc(Gtk::ListBoxRow?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListBoxRow?, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListBoxRow?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::NullableArrayPlan
          row = (lib_row.null? ? nil : Gtk::ListBoxRow.new(lib_row, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none) unless lib_row.null?
          ::Box(Proc(Gtk::ListBoxRow?, Nil)).unbox(_lib_box).call(row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBoxRow?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::NullableArrayPlan
          row = (lib_row.null? ? nil : Gtk::ListBoxRow.new(lib_row, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none) unless lib_row.null?
          ::Box(Proc(Gtk::ListBoxRow?, Nil)).unbox(_lib_box).call(row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ListBox, Gtk::ListBoxRow?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::NullableArrayPlan
          row = (lib_row.null? ? nil : Gtk::ListBoxRow.new(lib_row, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none) unless lib_row.null?
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow?, Nil)).unbox(_lib_box).call(_sender, row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Gtk::ListBoxRow?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_row : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::NullableArrayPlan
          row = (lib_row.null? ? nil : Gtk::ListBoxRow.new(lib_row, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          row = Gtk::ListBoxRow.new(lib_row, :none) unless lib_row.null?
          ::Box(Proc(Gtk::ListBox, Gtk::ListBoxRow?, Nil)).unbox(_lib_box).call(_sender, row)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(row : Gtk::ListBoxRow?) : Nil
        # Generator::NullableArrayPlan
        row = if row.nil?
                Void.null
              else
                row.to_unsafe
              end

        LibGObject.g_signal_emit_by_name(@source, "row-selected", row)
      end
    end

    def row_selected_signal
      RowSelectedSignal.new(self)
    end

    # Emitted to select all children of the box, if the selection
    # mode permits it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>.
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

      def connect(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
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

    # Emitted when the set of selected rows changes.
    struct SelectedRowsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "selected-rows-changed::#{@detail}" : "selected-rows-changed"
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

      def connect(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selected-rows-changed")
      end
    end

    def selected_rows_changed_signal
      SelectedRowsChangedSignal.new(self)
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

      def connect(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-row")
      end
    end

    def toggle_cursor_row_signal
      ToggleCursorRowSignal.new(self)
    end

    # Emitted to unselect all children of the box, if the selection
    # mode permits it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is
    # <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>.
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

      def connect(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ListBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListBox, Nil)).unbox(_lib_box).call(_sender)
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
