require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkDropDown` is a widget that allows the user to choose an item
  # from a list of options.
  #
  # ![An example GtkDropDown](drop-down.png)
  #
  # The `GtkDropDown` displays the selected choice.
  #
  # The options are given to `GtkDropDown` in the form of `GListModel`
  # and how the individual options are represented is determined by
  # a `Gtk#ListItemFactory`. The default factory displays simple strings.
  #
  # `GtkDropDown` knows how to obtain strings from the items in a
  # `Gtk#StringList`; for other models, you have to provide an expression
  # to find the strings via `Gtk::DropDown#expression=`.
  #
  # `GtkDropDown` can optionally allow search in the popup, which is
  # useful if the list of options is long. To enable the search entry,
  # use `Gtk::DropDown#enable_search=`.
  #
  # # CSS nodes
  #
  # `GtkDropDown` has a single CSS node with name dropdown,
  # with the button and popover nodes as children.
  #
  # # Accessibility
  #
  # `GtkDropDown` uses the %GTK_ACCESSIBLE_ROLE_COMBO_BOX role.
  @[GObject::GeneratedWrapper]
  class DropDown < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DropDownClass), class_init,
        sizeof(LibGtk::DropDown), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_search : Bool? = nil, expression : Gtk::Expression? = nil, factory : Gtk::ListItemFactory? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, list_factory : Gtk::ListItemFactory? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gio::ListModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selected : UInt32? = nil, selected_item : GObject::Object? = nil, sensitive : Bool? = nil, show_arrow : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
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
      if !enable_search.nil?
        (_names.to_unsafe + _n).value = "enable-search".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_search)
        _n += 1
      end
      if !expression.nil?
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
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
      if !list_factory.nil?
        (_names.to_unsafe + _n).value = "list-factory".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, list_factory)
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
      if !selected.nil?
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end
      if !selected_item.nil?
        (_names.to_unsafe + _n).value = "selected-item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_item)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_arrow.nil?
        (_names.to_unsafe + _n).value = "show-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_arrow)
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

      @pointer = LibGObject.g_object_new_with_properties(DropDown.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_down_get_type
    end

    def enable_search=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-search", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_search? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-search", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expression=(value : Gtk::Expression?) : Gtk::Expression?
      unsafe_value = value

      LibGObject.g_object_set(self, "expression", unsafe_value, Pointer(Void).null)
      value
    end

    def expression : Gtk::Expression?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "expression", pointerof(value), Pointer(Void).null)
      Gtk::Expression.new(value, GICrystal::Transfer::None) unless value.null?
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

    def list_factory=(value : Gtk::ListItemFactory?) : Gtk::ListItemFactory?
      unsafe_value = value

      LibGObject.g_object_set(self, "list-factory", unsafe_value, Pointer(Void).null)
      value
    end

    def list_factory : Gtk::ListItemFactory?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "list-factory", pointerof(value), Pointer(Void).null)
      Gtk::ListItemFactory.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def model=(value : Gio::ListModel?) : Gio::ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def selected=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "selected", unsafe_value, Pointer(Void).null)
      value
    end

    def selected : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "selected", pointerof(value), Pointer(Void).null)
      value
    end

    def selected_item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "selected-item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def show_arrow=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-arrow", unsafe_value, Pointer(Void).null)
      value
    end

    def show_arrow? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-arrow", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkDropDown`.
    #
    # You may want to call `Gtk::DropDown#factory=`
    # to set up a way to map its items to widgets.
    def initialize(model : Gio::ListModel?, expression : Gtk::Expression?)
      # gtk_drop_down_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # Generator::TransferFullArgPlan
      LibGObject.gtk_expression_ref(expression)

      # C call
      _retval = LibGtk.gtk_drop_down_new(model, expression)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Creates a new `GtkDropDown` that is populated with
    # the strings.
    def self.new_from_strings(strings : Enumerable(::String)) : self
      # gtk_drop_down_new_from_strings: (Constructor)
      # @strings: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      strings = strings.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_drop_down_new_from_strings(strings)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::DropDown.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_strings(*strings : ::String)
      self.new_from_strings(strings)
    end

    # Returns whether search is enabled.
    def enable_search : Bool
      # gtk_drop_down_get_enable_search: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_enable_search(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the expression set that is used to obtain strings from items.
    #
    # See `Gtk::DropDown#expression=`.
    def expression : Gtk::Expression?
      # gtk_drop_down_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_expression(self)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the factory that's currently used to populate list items.
    #
    # The factory returned by this function is always used for the
    # item in the button. It is also used for items in the popup
    # if [property@Gtk.DropDown:list-factory] is not set.
    def factory : Gtk::ListItemFactory?
      # gtk_drop_down_get_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_factory(self)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the factory that's currently used to populate list items in the popup.
    def list_factory : Gtk::ListItemFactory?
      # gtk_drop_down_get_list_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_list_factory(self)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the model that provides the displayed items.
    def model : Gio::ListModel?
      # gtk_drop_down_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_model(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the position of the selected item.
    def selected : UInt32
      # gtk_drop_down_get_selected: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_selected(self)

      # Return value handling

      _retval
    end

    # Gets the selected item. If no item is selected, %NULL is returned.
    def selected_item : GObject::Object?
      # gtk_drop_down_get_selected_item: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_selected_item(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether to show an arrow within the widget.
    def show_arrow : Bool
      # gtk_drop_down_get_show_arrow: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drop_down_get_show_arrow(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether a search entry will be shown in the popup that
    # allows to search for items in the list.
    #
    # Note that `Gtk::DropDown#expression` must be set for
    # search to work.
    def enable_search=(enable_search : Bool) : Nil
      # gtk_drop_down_set_enable_search: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_down_set_enable_search(self, enable_search)

      # Return value handling
    end

    # Sets the expression that gets evaluated to obtain strings from items.
    #
    # This is used for search in the popup. The expression must have
    # a value type of %G_TYPE_STRING.
    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_drop_down_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibGtk.gtk_drop_down_set_expression(self, expression)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items.
    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_drop_down_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibGtk.gtk_drop_down_set_factory(self, factory)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items in the popup.
    def list_factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_drop_down_set_list_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibGtk.gtk_drop_down_set_list_factory(self, factory)

      # Return value handling
    end

    # Sets the `GListModel` to use.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_drop_down_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_drop_down_set_model(self, model)

      # Return value handling
    end

    # Selects the item at the given position.
    def selected=(position : UInt32) : Nil
      # gtk_drop_down_set_selected: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_down_set_selected(self, position)

      # Return value handling
    end

    # Sets whether an arrow will be displayed within the widget.
    def show_arrow=(show_arrow : Bool) : Nil
      # gtk_drop_down_set_show_arrow: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drop_down_set_show_arrow(self, show_arrow)

      # Return value handling
    end

    # Emitted to when the drop down is activated.
    #
    # The `::activate` signal on `GtkDropDown` is an action signal and
    # emitting it causes the drop down to pop up its dropdown.
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

      def connect(block : Proc(Gtk::DropDown, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropDown.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropDown, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropDown, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropDown.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropDown, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end
  end
end
