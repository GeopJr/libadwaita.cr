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
  # can add any kind of widget to it via `Gtk::FlowBox#insert`, and a
  # `GtkFlowBoxChild` widget will automatically be inserted between the box
  # and the widget.
  #
  # Also see `Gtk#ListBox`.
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
  @[GObject::GeneratedWrapper]
  class FlowBox < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::FlowBox), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accept_unpaired_release : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, activate_on_single_click : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, column_spacing : UInt32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_children_per_line : UInt32? = nil, min_children_per_line : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, row_spacing : UInt32? = nil, scale_factor : Int32? = nil, selection_mode : Gtk::SelectionMode? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
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
      if !homogeneous.nil?
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
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
      if !max_children_per_line.nil?
        (_names.to_unsafe + _n).value = "max-children-per-line".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_children_per_line)
        _n += 1
      end
      if !min_children_per_line.nil?
        (_names.to_unsafe + _n).value = "min-children-per-line".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_children_per_line)
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

      @pointer = LibGObject.g_object_new_with_properties(FlowBox.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::SelectionMode.new(value)
    end

    # Creates a `GtkFlowBox`.
    def initialize
      # gtk_flow_box_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds @child to the end of @self.
    #
    # If a sort function is set, the widget will
    # actually be inserted at the calculated position.
    #
    # See also: `Gtk::FlowBox#insert`.
    def append(child : Gtk::Widget) : Nil
      # gtk_flow_box_append: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_append(self, child)

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
    # `Gtk::FlowBox#insert`) while @box is bound to a model.
    #
    # Note that using a model is incompatible with the filtering and sorting
    # functionality in `GtkFlowBox`. When using a model, filtering and sorting
    # should be implemented by the model.
    def bind_model(model : Gio::ListModel?, create_widget_func : Gtk::FlowBoxCreateWidgetFunc) : Nil
      # gtk_flow_box_bind_model: (Method)
      # @model: (nullable)
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
          # Generator::GObjectArgPlan
          item = GObject::Object.new(lib_item, :none)
          user_data = lib_user_data
          ::Box(Proc(GObject::Object, Gtk::Widget)).unbox(user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_data_free_func = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        create_widget_func = user_data = user_data_free_func = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_flow_box_bind_model(self, model, create_widget_func, user_data, user_data_free_func)

      # Return value handling
    end

    # Returns whether children activate on single clicks.
    def activate_on_single_click : Bool
      # gtk_flow_box_get_activate_on_single_click: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_activate_on_single_click(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the nth child in the @box.
    def child_at_index(idx : Int32) : Gtk::FlowBoxChild?
      # gtk_flow_box_get_child_at_index: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_child_at_index(self, idx)

      # Return value handling

      Gtk::FlowBoxChild.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the child in the (@x, @y) position.
    #
    # Both @x and @y are assumed to be relative to the origin of @box.
    def child_at_pos(x : Int32, y : Int32) : Gtk::FlowBoxChild?
      # gtk_flow_box_get_child_at_pos: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_child_at_pos(self, x, y)

      # Return value handling

      Gtk::FlowBoxChild.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the horizontal spacing.
    def column_spacing : UInt32
      # gtk_flow_box_get_column_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_column_spacing(self)

      # Return value handling

      _retval
    end

    # Returns whether the box is homogeneous.
    def homogeneous : Bool
      # gtk_flow_box_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the maximum number of children per line.
    def max_children_per_line : UInt32
      # gtk_flow_box_get_max_children_per_line: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_max_children_per_line(self)

      # Return value handling

      _retval
    end

    # Gets the minimum number of children per line.
    def min_children_per_line : UInt32
      # gtk_flow_box_get_min_children_per_line: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_min_children_per_line(self)

      # Return value handling

      _retval
    end

    # Gets the vertical spacing.
    def row_spacing : UInt32
      # gtk_flow_box_get_row_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_row_spacing(self)

      # Return value handling

      _retval
    end

    # Creates a list of all selected children.
    def selected_children : GLib::List
      # gtk_flow_box_get_selected_children: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_flow_box_get_selected_children(self)

      # Return value handling

      GLib::List(Gtk::FlowBoxChild).new(_retval, GICrystal::Transfer::Container)
    end

    # Gets the selection mode of @box.
    def selection_mode : Gtk::SelectionMode
      # gtk_flow_box_get_selection_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flow_box_get_selection_mode(self)

      # Return value handling

      Gtk::SelectionMode.new(_retval)
    end

    # Inserts the @widget into @box at @position.
    #
    # If a sort function is set, the widget will actually be inserted
    # at the calculated position.
    #
    # If @position is -1, or larger than the total number of children
    # in the @box, then the @widget will be appended to the end.
    def insert(widget : Gtk::Widget, position : Int32) : Nil
      # gtk_flow_box_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_insert(self, widget, position)

      # Return value handling
    end

    # Updates the filtering for all children.
    #
    # Call this function when the result of the filter
    # function on the @box is changed due ot an external
    # factor. For instance, this would be used if the
    # filter function just looked for a specific search
    # term, and the entry with the string has changed.
    def invalidate_filter : Nil
      # gtk_flow_box_invalidate_filter: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_invalidate_filter(self)

      # Return value handling
    end

    # Updates the sorting for all children.
    #
    # Call this when the result of the sort function on
    # @box is changed due to an external factor.
    def invalidate_sort : Nil
      # gtk_flow_box_invalidate_sort: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_invalidate_sort(self)

      # Return value handling
    end

    # Adds @child to the start of @self.
    #
    # If a sort function is set, the widget will
    # actually be inserted at the calculated position.
    #
    # See also: `Gtk::FlowBox#insert`.
    def prepend(child : Gtk::Widget) : Nil
      # gtk_flow_box_prepend: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_prepend(self, child)

      # Return value handling
    end

    # Removes a child from @box.
    def remove(widget : Gtk::Widget) : Nil
      # gtk_flow_box_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_remove(self, widget)

      # Return value handling
    end

    # Select all children of @box, if the selection
    # mode allows it.
    def select_all : Nil
      # gtk_flow_box_select_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_select_all(self)

      # Return value handling
    end

    # Selects a single child of @box, if the selection
    # mode allows it.
    def select_child(child : Gtk::FlowBoxChild) : Nil
      # gtk_flow_box_select_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_select_child(self, child)

      # Return value handling
    end

    # Calls a function for each selected child.
    #
    # Note that the selection cannot be modified from within
    # this function.
    def selected_foreach(func : Gtk::FlowBoxForeachFunc, data : Pointer(Void)?) : Nil
      # gtk_flow_box_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_flow_box_selected_foreach(self, func, data)

      # Return value handling
    end

    # If @single is %TRUE, children will be activated when you click
    # on them, otherwise you need to double-click.
    def activate_on_single_click=(single : Bool) : Nil
      # gtk_flow_box_set_activate_on_single_click: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_activate_on_single_click(self, single)

      # Return value handling
    end

    # Sets the horizontal space to add between children.
    def column_spacing=(spacing : UInt32) : Nil
      # gtk_flow_box_set_column_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_column_spacing(self, spacing)

      # Return value handling
    end

    # By setting a filter function on the @box one can decide dynamically
    # which of the children to show.
    #
    # For instance, to implement a search function that only shows the
    # children matching the search terms.
    #
    # The @filter_func will be called for each child after the call, and
    # it will continue to be called each time a child changes (via
    # `Gtk::FlowBoxChild#changed`) or when
    # `Gtk::FlowBox#invalidate_filter` is called.
    #
    # Note that using a filter function is incompatible with using a model
    # (see `Gtk::FlowBox#bind_model`).
    def filter_func=(filter_func : Gtk::FlowBoxFilterFunc?) : Nil
      # gtk_flow_box_set_filter_func: (Method)
      # @filter_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if filter_func
        _box = ::Box.box(filter_func)
        filter_func = ->(lib_child : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::GObjectArgPlan
          child = Gtk::FlowBoxChild.new(lib_child, :none)
          user_data = lib_user_data
          ::Box(Proc(Gtk::FlowBoxChild, Bool)).unbox(user_data).call(child)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        filter_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_flow_box_set_filter_func(self, filter_func, user_data, destroy)

      # Return value handling
    end

    # Hooks up an adjustment to focus handling in @box.
    #
    # The adjustment is also used for autoscrolling during
    # rubberband selection. See `Gtk::ScrolledWindow#hadjustment`
    # for a typical way of obtaining the adjustment, and
    # `Gtk::FlowBox#vadjustment=` for setting the vertical
    # adjustment.
    #
    # The adjustments have to be in pixel units and in the same
    # coordinate system as the allocation for immediate children
    # of the box.
    def hadjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_flow_box_set_hadjustment: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_hadjustment(self, adjustment)

      # Return value handling
    end

    # Sets whether or not all children of @box are given
    # equal space in the box.
    def homogeneous=(homogeneous : Bool) : Nil
      # gtk_flow_box_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the maximum number of children to request and
    # allocate space for in @box’s orientation.
    #
    # Setting the maximum number of children per line
    # limits the overall natural size request to be no more
    # than @n_children children long in the given orientation.
    def max_children_per_line=(n_children : UInt32) : Nil
      # gtk_flow_box_set_max_children_per_line: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_max_children_per_line(self, n_children)

      # Return value handling
    end

    # Sets the minimum number of children to line up
    # in @box’s orientation before flowing.
    def min_children_per_line=(n_children : UInt32) : Nil
      # gtk_flow_box_set_min_children_per_line: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_min_children_per_line(self, n_children)

      # Return value handling
    end

    # Sets the vertical space to add between children.
    def row_spacing=(spacing : UInt32) : Nil
      # gtk_flow_box_set_row_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_row_spacing(self, spacing)

      # Return value handling
    end

    # Sets how selection works in @box.
    def selection_mode=(mode : Gtk::SelectionMode) : Nil
      # gtk_flow_box_set_selection_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_selection_mode(self, mode)

      # Return value handling
    end

    # By setting a sort function on the @box, one can dynamically
    # reorder the children of the box, based on the contents of
    # the children.
    #
    # The @sort_func will be called for each child after the call,
    # and will continue to be called each time a child changes (via
    # `Gtk::FlowBoxChild#changed`) and when
    # `Gtk::FlowBox#invalidate_sort` is called.
    #
    # Note that using a sort function is incompatible with using a model
    # (see `Gtk::FlowBox#bind_model`).
    def sort_func=(sort_func : Gtk::FlowBoxSortFunc?) : Nil
      # gtk_flow_box_set_sort_func: (Method)
      # @sort_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if sort_func
        _box = ::Box.box(sort_func)
        sort_func = ->(lib_child1 : Pointer(Void), lib_child2 : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::GObjectArgPlan
          child1 = Gtk::FlowBoxChild.new(lib_child1, :none)
          # Generator::GObjectArgPlan
          child2 = Gtk::FlowBoxChild.new(lib_child2, :none)
          user_data = lib_user_data
          ::Box(Proc(Gtk::FlowBoxChild, Gtk::FlowBoxChild, Int32)).unbox(user_data).call(child1, child2)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        sort_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_flow_box_set_sort_func(self, sort_func, user_data, destroy)

      # Return value handling
    end

    # Hooks up an adjustment to focus handling in @box.
    #
    # The adjustment is also used for autoscrolling during
    # rubberband selection. See `Gtk::ScrolledWindow#vadjustment`
    # for a typical way of obtaining the adjustment, and
    # `Gtk::FlowBox#hadjustment=` for setting the horizontal
    # adjustment.
    #
    # The adjustments have to be in pixel units and in the same
    # coordinate system as the allocation for immediate children
    # of the box.
    def vadjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_flow_box_set_vadjustment: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_set_vadjustment(self, adjustment)

      # Return value handling
    end

    # Unselect all children of @box, if the selection
    # mode allows it.
    def unselect_all : Nil
      # gtk_flow_box_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_unselect_all(self)

      # Return value handling
    end

    # Unselects a single child of @box, if the selection
    # mode allows it.
    def unselect_child(child : Gtk::FlowBoxChild) : Nil
      # gtk_flow_box_unselect_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_flow_box_unselect_child(self, child)

      # Return value handling
    end

    # Emitted when the user activates the @box.
    #
    # This is a [keybinding signal](class.SignalAction.html).
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

      def connect(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-cursor-child")
      end
    end

    def activate_cursor_child_signal
      ActivateCursorChildSignal.new(self)
    end

    # Emitted when a child has been activated by the user.
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

      def connect(handler : Proc(Gtk::FlowBoxChild, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          child = Gtk::FlowBoxChild.new(lib_child, :none)
          ::Box(Proc(Gtk::FlowBoxChild, Nil)).unbox(_lib_box).call(child)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBoxChild, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          child = Gtk::FlowBoxChild.new(lib_child, :none)
          ::Box(Proc(Gtk::FlowBoxChild, Nil)).unbox(_lib_box).call(child)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          child = Gtk::FlowBoxChild.new(lib_child, :none)
          ::Box(Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil)).unbox(_lib_box).call(_sender, child)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          child = Gtk::FlowBoxChild.new(lib_child, :none)
          ::Box(Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil)).unbox(_lib_box).call(_sender, child)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(child : Gtk::FlowBoxChild) : Nil
        LibGObject.g_signal_emit_by_name(@source, "child-activated", child)
      end
    end

    def child_activated_signal
      ChildActivatedSignal.new(self)
    end

    # Emitted when the user initiates a cursor movement.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically.
    #
    # The default bindings for this signal come in two variants,
    # the variant with the Shift modifier extends the selection,
    # the variant without the Shift modifier does not.
    # There are too many key combinations to list them all here.
    #
    # - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
    #   move by individual children
    # - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
    # - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages
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
          # Generator::GObjectArgPlan
          step = Gtk::MovementStep.new(lib_step, :none)
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
          # Generator::GObjectArgPlan
          step = Gtk::MovementStep.new(lib_step, :none)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          step = Gtk::MovementStep.new(lib_step, :none)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib__extend : LibC::Int, lib_modify : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          step = Gtk::MovementStep.new(lib_step, :none)
          count = lib_count
          _extend = lib_extend
          modify = lib_modify
          ::Box(Proc(Gtk::FlowBox, Gtk::MovementStep, Int32, Bool, Bool, Bool)).unbox(_lib_box).call(_sender, step, count, _extend, modify)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, _extend : Bool, modify : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, _extend, modify)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    # Emitted to select all children of the box,
    # if the selection mode permits it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>.
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

      def connect(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
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

    # Emitted when the set of selected children changes.
    #
    # Use `Gtk::FlowBox#selected_foreach` or
    # `Gtk::FlowBox#selected_children` to obtain the
    # selected children.
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

      def connect(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "selected-children-changed")
      end
    end

    def selected_children_changed_signal
      SelectedChildrenChangedSignal.new(self)
    end

    # Emitted to toggle the selection of the child that has the focus.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>Space</kbd>.
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

      def connect(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-child")
      end
    end

    def toggle_cursor_child_signal
      ToggleCursorChildSignal.new(self)
    end

    # Emitted to unselect all children of the box,
    # if the selection mode permits it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>.
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

      def connect(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FlowBox, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FlowBox.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FlowBox, Nil)).unbox(_lib_box).call(_sender)
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
