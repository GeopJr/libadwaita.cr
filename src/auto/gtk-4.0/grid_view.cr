require "./list_base"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

require "./scrollable"

module Gtk
  # `GtkGridView` presents a large dynamic grid of items.
  #
  # `GtkGridView` uses its factory to generate one child widget for each
  # visible item and shows them in a grid. The orientation of the grid view
  # determines if the grid reflows vertically or horizontally.
  #
  # `GtkGridView` allows the user to select items according to the selection
  # characteristics of the model. For models that allow multiple selected items,
  # it is possible to turn on _rubberband selection_, using
  # [property@Gtk.GridView:enable-rubberband].
  #
  # To learn more about the list widget framework, see the
  # [overview](section-list-widget.html).
  #
  # # CSS nodes
  #
  # ```
  # gridview
  # ├── child[.activatable]
  # │
  # ├── child[.activatable]
  # │
  # ┊
  # ╰── [rubberband]
  # ```
  #
  # `GtkGridView` uses a single CSS node with name `gridview`. Each child uses
  # a single CSS node with name `child`. If the `Gtk::ListItem#activatable`
  # property is set, the corresponding row will have the `.activatable` style
  # class. For rubberband selection, a subnode with name `rubberband` is used.
  #
  # # Accessibility
  #
  # `GtkGridView` uses the %GTK_ACCESSIBLE_ROLE_GRID role, and the items
  # use the %GTK_ACCESSIBLE_ROLE_GRID_CELL role.
  @[GObject::GeneratedWrapper]
  class GridView < ListBase
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GridViewClass), class_init,
        sizeof(LibGtk::GridView), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_rubberband : Bool? = nil, factory : Gtk::ListItemFactory? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_columns : UInt32? = nil, min_columns : UInt32? = nil, model : Gtk::SelectionModel? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, single_click_activate : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[46]
      _values = StaticArray(LibGObject::Value, 46).new(LibGObject::Value.new)
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
      if !factory.nil?
        (_names.to_unsafe + _n).value = "factory".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, factory)
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
      if !max_columns.nil?
        (_names.to_unsafe + _n).value = "max-columns".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_columns)
        _n += 1
      end
      if !min_columns.nil?
        (_names.to_unsafe + _n).value = "min-columns".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_columns)
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
      if !single_click_activate.nil?
        (_names.to_unsafe + _n).value = "single-click-activate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_click_activate)
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

      @pointer = LibGObject.g_object_new_with_properties(GridView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_grid_view_get_type
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

    def factory=(value : Gtk::ListItemFactory?) : Gtk::ListItemFactory?
      unsafe_value = value

      LibGObject.g_object_set(self, "factory", unsafe_value, Pointer(Void).null)
      value
    end

    def factory : Gtk::ListItemFactory?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "factory", pointerof(value), Pointer(Void).null)
      Gtk::ListItemFactory.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def max_columns=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-columns", unsafe_value, Pointer(Void).null)
      value
    end

    def max_columns : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "max-columns", pointerof(value), Pointer(Void).null)
      value
    end

    def min_columns=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-columns", unsafe_value, Pointer(Void).null)
      value
    end

    def min_columns : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "min-columns", pointerof(value), Pointer(Void).null)
      value
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

    # Creates a new `GtkGridView` that uses the given @factory for
    # mapping items to widgets.
    #
    # The function takes ownership of the
    # arguments, so you can write code like
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # grid_view = gtk_grid_view_new (create_model (),
    #   gtk_builder_list_item_factory_new_from_resource ("/resource.ui"));
    # ```
    def initialize(model : Gtk::SelectionModel?, factory : Gtk::ListItemFactory?)
      # gtk_grid_view_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @factory: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(factory)

      # C call
      _retval = LibGtk.gtk_grid_view_new(model, factory)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Returns whether rows can be selected by dragging with the mouse.
    def enable_rubberband : Bool
      # gtk_grid_view_get_enable_rubberband: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_enable_rubberband(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the factory that's currently used to populate list items.
    def factory : Gtk::ListItemFactory?
      # gtk_grid_view_get_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_factory(self)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the maximum number of columns that the grid will use.
    def max_columns : UInt32
      # gtk_grid_view_get_max_columns: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_max_columns(self)

      # Return value handling

      _retval
    end

    # Gets the minimum number of columns that the grid will use.
    def min_columns : UInt32
      # gtk_grid_view_get_min_columns: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_min_columns(self)

      # Return value handling

      _retval
    end

    # Gets the model that's currently used to read the items displayed.
    def model : Gtk::SelectionModel?
      # gtk_grid_view_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_model(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether items will be activated on single click and
    # selected on hover.
    def single_click_activate : Bool
      # gtk_grid_view_get_single_click_activate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_grid_view_get_single_click_activate(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether selections can be changed by dragging with the mouse.
    def enable_rubberband=(enable_rubberband : Bool) : Nil
      # gtk_grid_view_set_enable_rubberband: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_view_set_enable_rubberband(self, enable_rubberband)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items.
    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_grid_view_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibGtk.gtk_grid_view_set_factory(self, factory)

      # Return value handling
    end

    # Sets the maximum number of columns to use.
    #
    # This number must be at least 1.
    #
    # If @max_columns is smaller than the minimum set via
    # `Gtk::GridView#min_columns=`, that value is used instead.
    def max_columns=(max_columns : UInt32) : Nil
      # gtk_grid_view_set_max_columns: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_view_set_max_columns(self, max_columns)

      # Return value handling
    end

    # Sets the minimum number of columns to use.
    #
    # This number must be at least 1.
    #
    # If @min_columns is smaller than the minimum set via
    # `Gtk::GridView#max_columns=`, that value is ignored.
    def min_columns=(min_columns : UInt32) : Nil
      # gtk_grid_view_set_min_columns: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_view_set_min_columns(self, min_columns)

      # Return value handling
    end

    # Sets the imodel to use.
    #
    # This must be a `Gtk#SelectionModel`.
    def model=(model : Gtk::SelectionModel?) : Nil
      # gtk_grid_view_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_grid_view_set_model(self, model)

      # Return value handling
    end

    # Sets whether items should be activated on single click and
    # selected on hover.
    def single_click_activate=(single_click_activate : Bool) : Nil
      # gtk_grid_view_set_single_click_activate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_grid_view_set_single_click_activate(self, single_click_activate)

      # Return value handling
    end

    # Emitted when a cell has been activated by the user,
    # usually via activating the GtkGridView|list.activate-item action.
    #
    # This allows for a convenient way to handle activation in a gridview.
    # See `Gtk::ListItem#activatable` for details on how to use
    # this signal.
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

      def connect(block : Proc(Gtk::GridView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::GridView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::GridView, UInt32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GridView, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::GridView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::GridView, UInt32, Nil)).unbox(box).call(sender, arg0)
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
