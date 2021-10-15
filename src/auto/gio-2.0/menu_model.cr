require "../g_object-2.0/object"

module Gio
  # #GMenuModel represents the contents of a menu -- an ordered list of
  # menu items. The items are associated with actions, which can be
  # activated through them. Items can be grouped in sections, and may
  # have submenus associated with them. Both items and sections usually
  # have some representation data, such as labels or icons. The type of
  # the associated action (ie whether it is stateful, and what kind of
  # state it has) can influence the representation of the item.
  #
  # The conceptual model of menus in #GMenuModel is hierarchical:
  # sections and submenus are again represented by #GMenuModels.
  # Menus themselves do not define their own roles. Rather, the role
  # of a particular #GMenuModel is defined by the item that references
  # it (or, in the case of the 'root' menu, is defined by the context
  # in which it is used).
  #
  # As an example, consider the visible portions of this menu:
  #
  # ## An example menu # {#menu-example}
  #
  # ![](menu-example.png)
  #
  # There are 8 "menus" visible in the screenshot: one menubar, two
  # submenus and 5 sections:
  #
  # - the toplevel menubar (containing 4 items)
  # - the View submenu (containing 3 sections)
  # - the first section of the View submenu (containing 2 items)
  # - the second section of the View submenu (containing 1 item)
  # - the final section of the View submenu (containing 1 item)
  # - the Highlight Mode submenu (containing 2 sections)
  # - the Sources section (containing 2 items)
  # - the Markup section (containing 2 items)
  #
  # The [example][menu-model] illustrates the conceptual connection between
  # these 8 menus. Each large block in the figure represents a menu and the
  # smaller blocks within the large block represent items in that menu. Some
  # items contain references to other menus.
  #
  # ## A menu example # {#menu-model}
  #
  # ![](menu-model.png)
  #
  # Notice that the separators visible in the [example][menu-example]
  # appear nowhere in the [menu model][menu-model]. This is because
  # separators are not explicitly represented in the menu model. Instead,
  # a separator is inserted between any two non-empty sections of a menu.
  # Section items can have labels just like any other item. In that case,
  # a display system may show a section header instead of a separator.
  #
  # The motivation for this abstract model of application controls is
  # that modern user interfaces tend to make these controls available
  # outside the application. Examples include global menus, jumplists,
  # dash boards, etc. To support such uses, it is necessary to 'export'
  # information about actions and their representation in menus, which
  # is exactly what the [GActionGroup exporter][gio-GActionGroup-exporter]
  # and the [GMenuModel exporter][gio-GMenuModel-exporter] do for
  # #GActionGroup and #GMenuModel. The client-side counterparts to
  # make use of the exported information are #GDBusActionGroup and
  # #GDBusMenuModel.
  #
  # The API of #GMenuModel is very generic, with iterators for the
  # attributes and links of an item, see g_menu_model_iterate_item_attributes()
  # and g_menu_model_iterate_item_links(). The 'standard' attributes and
  # link types have predefined names: %G_MENU_ATTRIBUTE_LABEL,
  # %G_MENU_ATTRIBUTE_ACTION, %G_MENU_ATTRIBUTE_TARGET, %G_MENU_LINK_SECTION
  # and %G_MENU_LINK_SUBMENU.
  #
  # Items in a #GMenuModel represent active controls if they refer to
  # an action that can get activated when the user interacts with the
  # menu item. The reference to the action is encoded by the string id
  # in the %G_MENU_ATTRIBUTE_ACTION attribute. An action id uniquely
  # identifies an action in an action group. Which action group(s) provide
  # actions depends on the context in which the menu model is used.
  # E.g. when the model is exported as the application menu of a
  # #GtkApplication, actions can be application-wide or window-specific
  # (and thus come from two different action groups). By convention, the
  # application-wide actions have names that start with "app.", while the
  # names of window-specific actions start with "win.".
  #
  # While a wide variety of stateful actions is possible, the following
  # is the minimum that is expected to be supported by all users of exported
  # menu information:
  # - an action with no parameter type and no state
  # - an action with no parameter type and boolean state
  # - an action with string parameter type and string state
  #
  # ## Stateless
  #
  # A stateless action typically corresponds to an ordinary menu item.
  #
  # Selecting such a menu item will activate the action (with no parameter).
  #
  # ## Boolean State
  #
  # An action with a boolean state will most typically be used with a "toggle"
  # or "switch" menu item. The state can be set directly, but activating the
  # action (with no parameter) results in the state being toggled.
  #
  # Selecting a toggle menu item will activate the action. The menu item should
  # be rendered as "checked" when the state is true.
  #
  # ## String Parameter and State
  #
  # Actions with string parameters and state will most typically be used to
  # represent an enumerated choice over the items available for a group of
  # radio menu items. Activating the action with a string parameter is
  # equivalent to setting that parameter as the state.
  #
  # Radio menu items, in addition to being associated with the action, will
  # have a target value. Selecting that menu item will result in activation
  # of the action with the target value as the parameter. The menu item should
  # be rendered as "selected" when the state of the action is equal to the
  # target value of the menu item.
  class MenuModel < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_model_get_type
    end

    def item_attribute_value(item_index : Int32, attribute : ::String, expected_type : GLib::VariantType?) : GLib::Variant?
      # g_menu_model_get_item_attribute_value: (Method)
      # @expected_type: (nullable)
      # Returns: (transfer full)

      expected_type = if expected_type.nil?
                        Pointer(Void).null
                      else
                        expected_type.to_unsafe
                      end

      _retval = LibGio.g_menu_model_get_item_attribute_value(self, item_index, attribute, expected_type)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def item_link(item_index : Int32, link : ::String) : Gio::MenuModel?
      # g_menu_model_get_item_link: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_model_get_item_link(self, item_index, link)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def n_items : Int32
      # g_menu_model_get_n_items: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_menu_model_get_n_items(self)
      _retval
    end

    def is_mutable : Bool
      # g_menu_model_is_mutable: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_menu_model_is_mutable(self)
      GICrystal.to_bool(_retval)
    end

    def items_changed(position : Int32, removed : Int32, added : Int32) : Nil
      # g_menu_model_items_changed: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_model_items_changed(self, position, removed, added)
    end

    def iterate_item_attributes(item_index : Int32) : Gio::MenuAttributeIter
      # g_menu_model_iterate_item_attributes: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_model_iterate_item_attributes(self, item_index)
      Gio::MenuAttributeIter.new(_retval, GICrystal::Transfer::Full)
    end

    def iterate_item_links(item_index : Int32) : Gio::MenuLinkIter
      # g_menu_model_iterate_item_links: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_model_iterate_item_links(self, item_index)
      Gio::MenuLinkIter.new(_retval, GICrystal::Transfer::Full)
    end

    struct ItemsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "items-changed::#{@detail}" : "items-changed"
      end

      def connect(&block : Proc(Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Int32, Int32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Int32, Int32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::MenuModel, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, box : Pointer(Void)) {
          sender = Gio::MenuModel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gio::MenuModel, Int32, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::MenuModel, Int32, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : Int32, box : Pointer(Void)) {
          sender = Gio::MenuModel.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gio::MenuModel, Int32, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(position : Int32, removed : Int32, added : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "items-changed", position, removed, added)
      end
    end

    def items_changed_signal
      ItemsChangedSignal.new(self)
    end
  end
end
