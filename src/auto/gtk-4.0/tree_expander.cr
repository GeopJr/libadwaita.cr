require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkTreeExpander` is a widget that provides an expander for a list.
  #
  # It is typically placed as a bottommost child into a `GtkListView`
  # to allow users to expand and collapse children in a list with a
  # `Gtk#TreeListModel`. `GtkTreeExpander` provides the common UI
  # elements, gestures and keybindings for this purpose.
  #
  # On top of this, the "listitem.expand", "listitem.collapse" and
  # "listitem.toggle-expand" actions are provided to allow adding custom
  # UI for managing expanded state.
  #
  # The `GtkTreeListModel` must be set to not be passthrough. Then it
  # will provide `Gtk#TreeListRow` items which can be set via
  # `Gtk::TreeExpander#list_row=` on the expander.
  # The expander will then watch that row item automatically.
  # `Gtk::TreeExpander#child=` sets the widget that displays
  # the actual row contents.
  #
  # # CSS nodes
  #
  # ```
  # treeexpander
  # ├── [indent]*
  # ├── [expander]
  # ╰── <child>
  # ```
  #
  # `GtkTreeExpander` has zero or one CSS nodes with the name "expander" that
  # should display the expander icon. The node will be `:checked` when it
  # is expanded. If the node is not expandable, an "indent" node will be
  # displayed instead.
  #
  # For every level of depth, another "indent" node is prepended.
  #
  # # Accessibility
  #
  # `GtkTreeExpander` uses the %GTK_ACCESSIBLE_ROLE_GROUP role. The expander icon
  # is represented as a %GTK_ACCESSIBLE_ROLE_BUTTON, labelled by the expander's
  # child, and toggling it will change the %GTK_ACCESSIBLE_STATE_EXPANDED state.
  @[GObject::GeneratedWrapper]
  class TreeExpander < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeExpanderClass), class_init,
        sizeof(LibGtk::TreeExpander), instance_init, 0)
    end

    GICrystal.define_new_method(TreeExpander, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeExpander`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, indent_for_icon : Bool? = nil, item : GObject::Object? = nil, layout_manager : Gtk::LayoutManager? = nil, list_row : Gtk::TreeListRow? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
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
      if !indent_for_icon.nil?
        (_names.to_unsafe + _n).value = "indent-for-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indent_for_icon)
        _n += 1
      end
      if !item.nil?
        (_names.to_unsafe + _n).value = "item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !list_row.nil?
        (_names.to_unsafe + _n).value = "list-row".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, list_row)
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

      @pointer = LibGObject.g_object_new_with_properties(TreeExpander.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_expander_get_type
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def indent_for_icon=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "indent-for-icon", unsafe_value, Pointer(Void).null)
      value
    end

    def indent_for_icon? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "indent-for-icon", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def list_row=(value : Gtk::TreeListRow?) : Gtk::TreeListRow?
      unsafe_value = value

      LibGObject.g_object_set(self, "list-row", unsafe_value, Pointer(Void).null)
      value
    end

    def list_row : Gtk::TreeListRow?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "list-row", pointerof(value), Pointer(Void).null)
      Gtk::TreeListRow.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Gets the child widget displayed by @self.
    def child : Gtk::Widget?
      # gtk_tree_expander_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_expander_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # TreeExpander indents the child by the width of an expander-icon if it is not expandable.
    def indent_for_icon : Bool
      # gtk_tree_expander_get_indent_for_icon: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_expander_get_indent_for_icon(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Forwards the item set on the `GtkTreeListRow` that @self is managing.
    #
    # This call is essentially equivalent to calling:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (@self));
    # ```
    def item : GObject::Object?
      # gtk_tree_expander_get_item: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_expander_get_item(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the list row managed by @self.
    def list_row : Gtk::TreeListRow?
      # gtk_tree_expander_get_list_row: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_expander_get_list_row(@pointer)

      # Return value handling

      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the content widget to display.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_tree_expander_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_tree_expander_set_child(@pointer, child)

      # Return value handling
    end

    # Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable.
    def indent_for_icon=(indent_for_icon : Bool) : Nil
      # gtk_tree_expander_set_indent_for_icon: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_expander_set_indent_for_icon(@pointer, indent_for_icon)

      # Return value handling
    end

    # Sets the tree list row that this expander should manage.
    def list_row=(list_row : Gtk::TreeListRow?) : Nil
      # gtk_tree_expander_set_list_row: (Method | Setter)
      # @list_row: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      list_row = if list_row.nil?
                   Pointer(Void).null
                 else
                   list_row.to_unsafe
                 end

      # C call
      LibGtk.gtk_tree_expander_set_list_row(@pointer, list_row)

      # Return value handling
    end
  end
end
