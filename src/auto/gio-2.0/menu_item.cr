require "../g_object-2.0/object"

module Gio
  # #GMenuItem is an opaque structure type.  You must access it using the
  # functions below.
  @[GObject::GeneratedWrapper]
  class MenuItem < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(MenuItem, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MenuItem`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_item_get_type
    end

    # Creates a new #GMenuItem.
    #
    # If @label is non-%NULL it is used to set the "label" attribute of the
    # new item.
    #
    # If @detailed_action is non-%NULL it is used to set the "action" and
    # possibly the "target" attribute of the new item.  See
    # g_menu_item_set_detailed_action() for more information.
    def self.new(label : ::String?, detailed_action : ::String?) : self
      # g_menu_item_new: (Constructor)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end
      # Generator::NullableArrayPlan
      detailed_action = if detailed_action.nil?
                          Pointer(LibC::Char).null
                        else
                          detailed_action.to_unsafe
                        end

      # C call
      _retval = LibGio.g_menu_item_new(label, detailed_action)

      # Return value handling

      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a #GMenuItem as an exact copy of an existing menu item in a
    # #GMenuModel.
    #
    # @item_index must be valid (ie: be sure to call
    # g_menu_model_get_n_items() first).
    def self.new_from_model(model : Gio::MenuModel, item_index : Int32) : self
      # g_menu_item_new_from_model: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_menu_item_new_from_model(model, item_index)

      # Return value handling

      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GMenuItem representing a section.
    #
    # This is a convenience API around g_menu_item_new() and
    # g_menu_item_set_section().
    #
    # The effect of having one menu appear as a section of another is
    # exactly as it sounds: the items from @section become a direct part of
    # the menu that @menu_item is added to.
    #
    # Visual separation is typically displayed between two non-empty
    # sections.  If @label is non-%NULL then it will be encorporated into
    # this visual indication.  This allows for labeled subsections of a
    # menu.
    #
    # As a simple example, consider a typical "Edit" menu from a simple
    # program.  It probably contains an "Undo" and "Redo" item, followed by
    # a separator, followed by "Cut", "Copy" and "Paste".
    #
    # This would be accomplished by creating three #GMenu instances.  The
    # first would be populated with the "Undo" and "Redo" items, and the
    # second with the "Cut", "Copy" and "Paste" items.  The first and
    # second menus would then be added as submenus of the third.  In XML
    # format, this would look something like the following:
    # |[
    # <menu id='edit-menu'>
    #   <section>
    #     <item label='Undo'/>
    #     <item label='Redo'/>
    #   </section>
    #   <section>
    #     <item label='Cut'/>
    #     <item label='Copy'/>
    #     <item label='Paste'/>
    #   </section>
    # </menu>
    # ]|
    #
    # The following example is exactly equivalent.  It is more illustrative
    # of the exact relationship between the menus and items (keeping in
    # mind that the 'link' element defines a new menu that is linked to the
    # containing one).  The style of the second example is more verbose and
    # difficult to read (and therefore not recommended except for the
    # purpose of understanding what is really going on).
    # |[
    # <menu id='edit-menu'>
    #   <item>
    #     <link name='section'>
    #       <item label='Undo'/>
    #       <item label='Redo'/>
    #     </link>
    #   </item>
    #   <item>
    #     <link name='section'>
    #       <item label='Cut'/>
    #       <item label='Copy'/>
    #       <item label='Paste'/>
    #     </link>
    #   </item>
    # </menu>
    # ]|
    def self.new_section(label : ::String?, section : Gio::MenuModel) : self
      # g_menu_item_new_section: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      _retval = LibGio.g_menu_item_new_section(label, section)

      # Return value handling

      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GMenuItem representing a submenu.
    #
    # This is a convenience API around g_menu_item_new() and
    # g_menu_item_set_submenu().
    def self.new_submenu(label : ::String?, submenu : Gio::MenuModel) : self
      # g_menu_item_new_submenu: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      _retval = LibGio.g_menu_item_new_submenu(label, submenu)

      # Return value handling

      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    # Queries the named @attribute on @menu_item.
    #
    # If @expected_type is specified and the attribute does not have this
    # type, %NULL is returned.  %NULL is also returned if the attribute
    # simply does not exist.
    def attribute_value(attribute : ::String, expected_type : GLib::VariantType?) : GLib::Variant?
      # g_menu_item_get_attribute_value: (Method)
      # @expected_type: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      expected_type = if expected_type.nil?
                        Pointer(Void).null
                      else
                        expected_type.to_unsafe
                      end

      # C call
      _retval = LibGio.g_menu_item_get_attribute_value(@pointer, attribute, expected_type)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Queries the named @link on @menu_item.
    def link(link : ::String) : Gio::MenuModel?
      # g_menu_item_get_link: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_menu_item_get_link(@pointer, link)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets or unsets the "action" and "target" attributes of @menu_item.
    #
    # If @action is %NULL then both the "action" and "target" attributes
    # are unset (and @target_value is ignored).
    #
    # If @action is non-%NULL then the "action" attribute is set.  The
    # "target" attribute is then set to the value of @target_value if it is
    # non-%NULL or unset otherwise.
    #
    # Normal menu items (ie: not submenu, section or other custom item
    # types) are expected to have the "action" attribute set to identify
    # the action that they are associated with.  The state type of the
    # action help to determine the disposition of the menu item.  See
    # #GAction and #GActionGroup for an overview of actions.
    #
    # In general, clicking on the menu item will result in activation of
    # the named action with the "target" attribute given as the parameter
    # to the action invocation.  If the "target" attribute is not set then
    # the action is invoked with no parameter.
    #
    # If the action has no state then the menu item is usually drawn as a
    # plain menu item (ie: with no additional decoration).
    #
    # If the action has a boolean state then the menu item is usually drawn
    # as a toggle menu item (ie: with a checkmark or equivalent
    # indication).  The item should be marked as 'toggled' or 'checked'
    # when the boolean state is %TRUE.
    #
    # If the action has a string state then the menu item is usually drawn
    # as a radio menu item (ie: with a radio bullet or equivalent
    # indication).  The item should be marked as 'selected' when the string
    # state is equal to the value of the @target property.
    #
    # See g_menu_item_set_action_and_target() or
    # g_menu_item_set_detailed_action() for two equivalent calls that are
    # probably more convenient for most uses.
    def set_action_and_target_value(action : ::String?, target_value : _?) : Nil
      # g_menu_item_set_action_and_target_value: (Method)
      # @action: (nullable)
      # @target_value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      action = if action.nil?
                 Pointer(LibC::Char).null
               else
                 action.to_unsafe
               end
      # Generator::HandmadeArgPlan
      target_value = if target_value.nil?
                       Pointer(Void).null
                     elsif !target_value.is_a?(GLib::Variant)
                       GLib::Variant.new(target_value).to_unsafe
                     else
                       target_value.to_unsafe
                     end

      # C call
      LibGio.g_menu_item_set_action_and_target_value(@pointer, action, target_value)

      # Return value handling
    end

    # Sets or unsets an attribute on @menu_item.
    #
    # The attribute to set or unset is specified by @attribute. This
    # can be one of the standard attribute names %G_MENU_ATTRIBUTE_LABEL,
    # %G_MENU_ATTRIBUTE_ACTION, %G_MENU_ATTRIBUTE_TARGET, or a custom
    # attribute name.
    # Attribute names are restricted to lowercase characters, numbers
    # and '-'. Furthermore, the names must begin with a lowercase character,
    # must not end with a '-', and must not contain consecutive dashes.
    #
    # must consist only of lowercase
    # ASCII characters, digits and '-'.
    #
    # If @value is non-%NULL then it is used as the new value for the
    # attribute.  If @value is %NULL then the attribute is unset. If
    # the @value #GVariant is floating, it is consumed.
    #
    # See also g_menu_item_set_attribute() for a more convenient way to do
    # the same.
    def set_attribute_value(attribute : ::String, value : _?) : Nil
      # g_menu_item_set_attribute_value: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_menu_item_set_attribute_value(@pointer, attribute, value)

      # Return value handling
    end

    # Sets the "action" and possibly the "target" attribute of @menu_item.
    #
    # The format of @detailed_action is the same format parsed by
    # g_action_parse_detailed_name().
    #
    # See g_menu_item_set_action_and_target() or
    # g_menu_item_set_action_and_target_value() for more flexible (but
    # slightly less convenient) alternatives.
    #
    # See also g_menu_item_set_action_and_target_value() for a description of
    # the semantics of the action and target attributes.
    def detailed_action=(detailed_action : ::String) : Nil
      # g_menu_item_set_detailed_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_item_set_detailed_action(@pointer, detailed_action)

      # Return value handling
    end

    # Sets (or unsets) the icon on @menu_item.
    #
    # This call is the same as calling g_icon_serialize() and using the
    # result as the value to g_menu_item_set_attribute_value() for
    # %G_MENU_ATTRIBUTE_ICON.
    #
    # This API is only intended for use with "noun" menu items; things like
    # bookmarks or applications in an "Open With" menu.  Don't use it on
    # menu items corresponding to verbs (eg: stock icons for 'Save' or
    # 'Quit').
    #
    # If @icon is %NULL then the icon is unset.
    def icon=(icon : Gio::Icon) : Nil
      # g_menu_item_set_icon: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_item_set_icon(@pointer, icon)

      # Return value handling
    end

    # Sets or unsets the "label" attribute of @menu_item.
    #
    # If @label is non-%NULL it is used as the label for the menu item.  If
    # it is %NULL then the label attribute is unset.
    def label=(label : ::String?) : Nil
      # g_menu_item_set_label: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_item_set_label(@pointer, label)

      # Return value handling
    end

    # Creates a link from @menu_item to @model if non-%NULL, or unsets it.
    #
    # Links are used to establish a relationship between a particular menu
    # item and another menu.  For example, %G_MENU_LINK_SUBMENU is used to
    # associate a submenu with a particular menu item, and %G_MENU_LINK_SECTION
    # is used to create a section. Other types of link can be used, but there
    # is no guarantee that clients will be able to make sense of them.
    # Link types are restricted to lowercase characters, numbers
    # and '-'. Furthermore, the names must begin with a lowercase character,
    # must not end with a '-', and must not contain consecutive dashes.
    def set_link(link : ::String, model : Gio::MenuModel?) : Nil
      # g_menu_item_set_link: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGio.g_menu_item_set_link(@pointer, link, model)

      # Return value handling
    end

    # Sets or unsets the "section" link of @menu_item to @section.
    #
    # The effect of having one menu appear as a section of another is
    # exactly as it sounds: the items from @section become a direct part of
    # the menu that @menu_item is added to.  See g_menu_item_new_section()
    # for more information about what it means for a menu item to be a
    # section.
    def section=(section : Gio::MenuModel?) : Nil
      # g_menu_item_set_section: (Method)
      # @section: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      section = if section.nil?
                  Pointer(Void).null
                else
                  section.to_unsafe
                end

      # C call
      LibGio.g_menu_item_set_section(@pointer, section)

      # Return value handling
    end

    # Sets or unsets the "submenu" link of @menu_item to @submenu.
    #
    # If @submenu is non-%NULL, it is linked to.  If it is %NULL then the
    # link is unset.
    #
    # The effect of having one menu appear as a submenu of another is
    # exactly as it sounds.
    def submenu=(submenu : Gio::MenuModel?) : Nil
      # g_menu_item_set_submenu: (Method)
      # @submenu: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      submenu = if submenu.nil?
                  Pointer(Void).null
                else
                  submenu.to_unsafe
                end

      # C call
      LibGio.g_menu_item_set_submenu(@pointer, submenu)

      # Return value handling
    end
  end
end
