require "./action_row"
require "../gtk-4.0/accessible"

require "../gtk-4.0/actionable"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A `Gtk#ListBoxRow` used to choose from a list of items.
  #
  # <picture>
  #   <source srcset="combo-row-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="combo-row.png" alt="combo-row">
  # </picture>
  #
  # The `AdwComboRow` widget allows the user to choose from a list of valid
  # choices. The row displays the selected choice. When activated, the row
  # displays a popover which allows the user to make a new choice.
  #
  # `AdwComboRow` mirrors `Gtk#DropDown`, see that widget for details.
  #
  # `AdwComboRow` is `Gtk::ListBoxRow#activatable` if a model is set.
  #
  # ## CSS nodes
  #
  # `AdwComboRow` has a main CSS node with name `row` and the `.combo` style
  # class.
  #
  # Its popover has the node named `popover` with the `.menu` style class, it
  # contains a `Gtk#ScrolledWindow`, which in turn contains a
  # `Gtk#ListView`, both are accessible via their regular nodes.
  #
  # ## Accessibility
  #
  # `AdwComboRow` uses the `GTK_ACCESSIBLE_ROLE_COMBO_BOX` role.
  @[GObject::GeneratedWrapper]
  class ComboRow < ActionRow
    include Gtk::Accessible
    include Gtk::Actionable
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ComboRowClass), class_init,
        sizeof(LibAdw::ComboRow), instance_init, 0)
    end

    GICrystal.define_new_method(ComboRow, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ComboRow`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, activatable : Bool? = nil, activatable_widget : Gtk::Widget? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, expression : Gtk::Expression? = nil, factory : Gtk::ListItemFactory? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, list_factory : Gtk::ListItemFactory? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, model : Gio::ListModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selectable : Bool? = nil, selected : UInt32? = nil, selected_item : GObject::Object? = nil, sensitive : Bool? = nil, subtitle : ::String? = nil, subtitle_lines : Int32? = nil, title : ::String? = nil, title_lines : Int32? = nil, title_selectable : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_subtitle : Bool? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[55]
      _values = StaticArray(LibGObject::Value, 55).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !action_name.nil?
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if !action_target.nil?
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if !activatable.nil?
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
        _n += 1
      end
      if !activatable_widget.nil?
        (_names.to_unsafe + _n).value = "activatable-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable_widget)
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
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
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
      if !selectable.nil?
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
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
      if !subtitle.nil?
        (_names.to_unsafe + _n).value = "subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle)
        _n += 1
      end
      if !subtitle_lines.nil?
        (_names.to_unsafe + _n).value = "subtitle-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle_lines)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !title_lines.nil?
        (_names.to_unsafe + _n).value = "title-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_lines)
        _n += 1
      end
      if !title_selectable.nil?
        (_names.to_unsafe + _n).value = "title-selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_selectable)
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
      if !use_subtitle.nil?
        (_names.to_unsafe + _n).value = "use-subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_subtitle)
        _n += 1
      end
      if !use_underline.nil?
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(ComboRow.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_combo_row_get_type
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
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
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

    def use_subtitle=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-subtitle", unsafe_value, Pointer(Void).null)
      value
    end

    def use_subtitle? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-subtitle", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Gets the expression used to obtain strings from items.
    def expression : Gtk::Expression?
      # adw_combo_row_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_expression(@pointer)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the factory that's currently used to populate list items.
    def factory : Gtk::ListItemFactory?
      # adw_combo_row_get_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_factory(@pointer)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the factory that's currently used to populate list items in the popup.
    def list_factory : Gtk::ListItemFactory?
      # adw_combo_row_get_list_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_list_factory(@pointer)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the model that provides the displayed items.
    def model : Gio::ListModel?
      # adw_combo_row_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the position of the selected item.
    def selected : UInt32
      # adw_combo_row_get_selected: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_selected(@pointer)

      # Return value handling

      _retval
    end

    # Gets the selected item.
    def selected_item : GObject::Object?
      # adw_combo_row_get_selected_item: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_selected_item(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether to use the current value as the subtitle.
    def use_subtitle : Bool
      # adw_combo_row_get_use_subtitle: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_combo_row_get_use_subtitle(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the expression used to obtain strings from items.
    #
    # The expression must have a value type of `G_TYPE_STRING`.
    def expression=(expression : Gtk::Expression?) : Nil
      # adw_combo_row_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibAdw.adw_combo_row_set_expression(@pointer, expression)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items.
    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # adw_combo_row_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibAdw.adw_combo_row_set_factory(@pointer, factory)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items in the popup.
    def list_factory=(factory : Gtk::ListItemFactory?) : Nil
      # adw_combo_row_set_list_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibAdw.adw_combo_row_set_list_factory(@pointer, factory)

      # Return value handling
    end

    # Sets the `Gio#ListModel` to use.
    def model=(model : Gio::ListModel?) : Nil
      # adw_combo_row_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibAdw.adw_combo_row_set_model(@pointer, model)

      # Return value handling
    end

    # Selects the item at the given position.
    def selected=(position : UInt32) : Nil
      # adw_combo_row_set_selected: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_combo_row_set_selected(@pointer, position)

      # Return value handling
    end

    # Sets whether to use the current value as the subtitle.
    def use_subtitle=(use_subtitle : Bool) : Nil
      # adw_combo_row_set_use_subtitle: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_combo_row_set_use_subtitle(@pointer, use_subtitle)

      # Return value handling
    end
  end
end
