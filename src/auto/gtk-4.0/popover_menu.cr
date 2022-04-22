require "./popover"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./shortcut_manager"

module Gtk
  # `GtkPopoverMenu` is a subclass of `GtkPopover` that implements menu
  # behavior.
  #
  # ![An example GtkPopoverMenu](menu.png)
  #
  # `GtkPopoverMenu` treats its children like menus and allows switching
  # between them. It can open submenus as traditional, nested submenus,
  # or in a more touch-friendly sliding fashion.
  #
  # `GtkPopoverMenu` is meant to be used primarily with menu models,
  # using `Gtk::PopoverMenu#new_from_model`. If you need to put
  # other widgets such as a `GtkSpinButton` or a `GtkSwitch` into a popover,
  # you can use `Gtk::PopoverMenu#add_child`.
  #
  # For more dialog-like behavior, use a plain `GtkPopover`.
  #
  # ## Menu models
  #
  # The XML format understood by `GtkBuilder` for `GMenuModel` consists
  # of a toplevel `<menu>` element, which contains one or more `<item>`
  # elements. Each `<item>` element contains `<attribute>` and `<link>`
  # elements with a mandatory name attribute. `<link>` elements have the
  # same content model as `<menu>`. Instead of `<link name="submenu">`
  # or `<link name="section">`, you can use `<submenu>` or `<section>`
  # elements.
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <menu id='app-menu'>
  #   <section>
  #     <item>
  #       <attribute name='label' translatable='yes'>_New Window</attribute>
  #       <attribute name='action'>app.new</attribute>
  #     </item>
  #     <item>
  #       <attribute name='label' translatable='yes'>_About Sunny</attribute>
  #       <attribute name='action'>app.about</attribute>
  #     </item>
  #     <item>
  #       <attribute name='label' translatable='yes'>_Quit</attribute>
  #       <attribute name='action'>app.quit</attribute>
  #     </item>
  #   </section>
  # </menu>
  # ```
  #
  # Attribute values can be translated using gettext, like other `GtkBuilder`
  # content. `<attribute>` elements can be marked for translation with a
  # `translatable="yes"` attribute. It is also possible to specify message
  # context and translator comments, using the context and comments attributes.
  # To make use of this, the `GtkBuilder` must have been given the gettext
  # domain to use.
  #
  # The following attributes are used when constructing menu items:
  #
  # - "label": a user-visible string to display
  # - "use-markup": whether the text in the menu item includes [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)
  # - "action": the prefixed name of the action to trigger
  # - "target": the parameter to use when activating the action
  # - "icon" and "verb-icon": names of icons that may be displayed
  # - "submenu-action": name of an action that may be used to track
  #      whether a submenu is open
  # - "hidden-when": a string used to determine when the item will be hidden.
  #      Possible values include "action-disabled", "action-missing", "macos-menubar".
  #      This is mainly useful for exported menus, see `Gtk::Application#menubar=`.
  # - "custom": a string used to match against the ID of a custom child added with
  #      `Gtk::PopoverMenu#add_child`, `Gtk::PopoverMenuBar#add_child`,
  #      or in the ui file with `<child type="ID">`.
  #
  # The following attributes are used when constructing sections:
  #
  # - "label": a user-visible string to use as section heading
  # - "display-hint": a string used to determine special formatting for the section.
  #     Possible values include "horizontal-buttons", "circular-buttons" and
  #     "inline-buttons". They all indicate that section should be
  #     displayed as a horizontal row of buttons.
  # - "text-direction": a string used to determine the `GtkTextDirection` to use
  #     when "display-hint" is set to "horizontal-buttons". Possible values
  #     include "rtl", "ltr", and "none".
  #
  # The following attributes are used when constructing submenus:
  #
  # - "label": a user-visible string to display
  # - "icon": icon name to display
  #
  # Menu items will also show accelerators, which are usually associated
  # with actions via `Gtk::Application#accels_for_action=`,
  # `#gtk_widget_class_add_binding_action` or
  # `Gtk::ShortcutController#add_shortcut`.
  #
  # # CSS Nodes
  #
  # `GtkPopoverMenu` is just a subclass of `GtkPopover` that adds custom content
  # to it, therefore it has the same CSS nodes. It is one of the cases that add
  # a .menu style class to the popover's main node.
  #
  # # Accessibility
  #
  # `GtkPopoverMenu` uses the %GTK_ACCESSIBLE_ROLE_MENU role, and its
  # items use the %GTK_ACCESSIBLE_ROLE_MENU_ITEM,
  # %GTK_ACCESSIBLE_ROLE_MENU_ITEM_CHECKBOX or
  # %GTK_ACCESSIBLE_ROLE_MENU_ITEM_RADIO roles, depending on the
  # action they are connected to.
  @[GObject::GeneratedWrapper]
  class PopoverMenu < Popover
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::PopoverMenu), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, autohide : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, cascade_popdown : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_widget : Gtk::Widget? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_arrow : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, mnemonics_visible : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pointing_to : Gdk::Rectangle? = nil, position : Gtk::PositionType? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_submenu : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[45]
      _values = StaticArray(LibGObject::Value, 45).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !autohide.nil?
        (_names.to_unsafe + _n).value = "autohide".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autohide)
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
      if !cascade_popdown.nil?
        (_names.to_unsafe + _n).value = "cascade-popdown".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cascade_popdown)
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
      if !default_widget.nil?
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
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
      if !has_arrow.nil?
        (_names.to_unsafe + _n).value = "has-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_arrow)
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
      if !menu_model.nil?
        (_names.to_unsafe + _n).value = "menu-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_model)
        _n += 1
      end
      if !mnemonics_visible.nil?
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
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
      if !pointing_to.nil?
        (_names.to_unsafe + _n).value = "pointing-to".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pointing_to)
        _n += 1
      end
      if !position.nil?
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
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
      if !visible_submenu.nil?
        (_names.to_unsafe + _n).value = "visible-submenu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_submenu)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PopoverMenu.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_popover_menu_get_type
    end

    def menu_model=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "menu-model", unsafe_value, Pointer(Void).null)
      value
    end

    def menu_model : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "menu-model", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def visible_submenu=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-submenu", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_submenu : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "visible-submenu", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a `GtkPopoverMenu` and populates it according to @model.
    #
    # The created buttons are connected to actions found in the
    # `GtkApplicationWindow` to which the popover belongs - typically
    # by means of being attached to a widget that is contained within
    # the `GtkApplicationWindow`s widget hierarchy.
    #
    # Actions can also be added using `Gtk::Widget#insert_action_group`
    # on the menus attach widget or on any of its parent widgets.
    #
    # This function creates menus with sliding submenus.
    # See `Gtk::PopoverMenu#new_from_model_full` for a way
    # to control this.
    def self.new_from_model(model : Gio::MenuModel?) : self
      # gtk_popover_menu_new_from_model: (Constructor)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_popover_menu_new_from_model(model)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::PopoverMenu.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a `GtkPopoverMenu` and populates it according to @model.
    #
    # The created buttons are connected to actions found in the
    # action groups that are accessible from the parent widget.
    # This includes the `GtkApplicationWindow` to which the popover
    # belongs. Actions can also be added using `Gtk::Widget#insert_action_group`
    # on the parent widget or on any of its parent widgets.
    #
    # The only flag that is supported currently is
    # %GTK_POPOVER_MENU_NESTED, which makes GTK create traditional,
    # nested submenus instead of the default sliding submenus.
    def self.new_from_model_full(model : Gio::MenuModel, flags : Gtk::PopoverMenuFlags) : self
      # gtk_popover_menu_new_from_model_full: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_popover_menu_new_from_model_full(model, flags)

      # Return value handling

      Gtk::PopoverMenu.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a custom widget to a generated menu.
    #
    # For this to work, the menu model of @popover must have
    # an item with a `custom` attribute that matches @id.
    def add_child(child : Gtk::Widget, id : ::String) : Bool
      # gtk_popover_menu_add_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_menu_add_child(self, child, id)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the menu model used to populate the popover.
    def menu_model : Gio::MenuModel?
      # gtk_popover_menu_get_menu_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_menu_get_menu_model(self)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Removes a widget that has previously been added with
    # gtk_popover_menu_add_child().
    def remove_child(child : Gtk::Widget) : Bool
      # gtk_popover_menu_remove_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_popover_menu_remove_child(self, child)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets a new menu model on @popover.
    #
    # The existing contents of @popover are removed, and
    # the @popover is populated with new contents according
    # to @model.
    def menu_model=(model : Gio::MenuModel?) : Nil
      # gtk_popover_menu_set_menu_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_popover_menu_set_menu_model(self, model)

      # Return value handling
    end
  end
end
