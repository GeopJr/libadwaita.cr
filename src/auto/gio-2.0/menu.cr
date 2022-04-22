require "./menu_model"

module Gio
  # #GMenu is a simple implementation of #GMenuModel.
  # You populate a #GMenu by adding #GMenuItem instances to it.
  #
  # There are some convenience functions to allow you to directly
  # add items (avoiding #GMenuItem) for the common cases. To add
  # a regular item, use g_menu_insert(). To add a section, use
  # g_menu_insert_section(). To add a submenu, use
  # g_menu_insert_submenu().
  @[GObject::GeneratedWrapper]
  class Menu < MenuModel
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::Menu), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_get_type
    end

    # Creates a new #GMenu.
    #
    # The new menu has no items.
    def initialize
      # g_menu_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_menu_new

      # Return value handling

      @pointer = _retval
    end

    # Convenience function for appending a normal menu item to the end of
    # @menu.  Combine g_menu_item_new() and g_menu_insert_item() for a more
    # flexible alternative.
    def append(label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_append: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_menu_append(self, label, detailed_action)

      # Return value handling
    end

    # Appends @item to the end of @menu.
    #
    # See g_menu_insert_item() for more information.
    def append_item(item : Gio::MenuItem) : Nil
      # g_menu_append_item: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_append_item(self, item)

      # Return value handling
    end

    # Convenience function for appending a section menu item to the end of
    # @menu.  Combine g_menu_item_new_section() and g_menu_insert_item() for a
    # more flexible alternative.
    def append_section(label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_append_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_append_section(self, label, section)

      # Return value handling
    end

    # Convenience function for appending a submenu menu item to the end of
    # @menu.  Combine g_menu_item_new_submenu() and g_menu_insert_item() for a
    # more flexible alternative.
    def append_submenu(label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_append_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_append_submenu(self, label, submenu)

      # Return value handling
    end

    # Marks @menu as frozen.
    #
    # After the menu is frozen, it is an error to attempt to make any
    # changes to it.  In effect this means that the #GMenu API must no
    # longer be used.
    #
    # This function causes g_menu_model_is_mutable() to begin returning
    # %FALSE, which has some positive performance implications.
    def freeze : Nil
      # g_menu_freeze: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_freeze(self)

      # Return value handling
    end

    # Convenience function for inserting a normal menu item into @menu.
    # Combine g_menu_item_new() and g_menu_insert_item() for a more flexible
    # alternative.
    def insert(position : Int32, label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_insert: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_menu_insert(self, position, label, detailed_action)

      # Return value handling
    end

    # Inserts @item into @menu.
    #
    # The "insertion" is actually done by copying all of the attribute and
    # link values of @item and using them to form a new item within @menu.
    # As such, @item itself is not really inserted, but rather, a menu item
    # that is exactly the same as the one presently described by @item.
    #
    # This means that @item is essentially useless after the insertion
    # occurs.  Any changes you make to it are ignored unless it is inserted
    # again (at which point its updated values will be copied).
    #
    # You should probably just free @item once you're done.
    #
    # There are many convenience functions to take care of common cases.
    # See g_menu_insert(), g_menu_insert_section() and
    # g_menu_insert_submenu() as well as "prepend" and "append" variants of
    # each of these functions.
    def insert_item(position : Int32, item : Gio::MenuItem) : Nil
      # g_menu_insert_item: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_insert_item(self, position, item)

      # Return value handling
    end

    # Convenience function for inserting a section menu item into @menu.
    # Combine g_menu_item_new_section() and g_menu_insert_item() for a more
    # flexible alternative.
    def insert_section(position : Int32, label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_insert_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_insert_section(self, position, label, section)

      # Return value handling
    end

    # Convenience function for inserting a submenu menu item into @menu.
    # Combine g_menu_item_new_submenu() and g_menu_insert_item() for a more
    # flexible alternative.
    def insert_submenu(position : Int32, label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_insert_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_insert_submenu(self, position, label, submenu)

      # Return value handling
    end

    # Convenience function for prepending a normal menu item to the start
    # of @menu.  Combine g_menu_item_new() and g_menu_insert_item() for a more
    # flexible alternative.
    def prepend(label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_prepend: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_menu_prepend(self, label, detailed_action)

      # Return value handling
    end

    # Prepends @item to the start of @menu.
    #
    # See g_menu_insert_item() for more information.
    def prepend_item(item : Gio::MenuItem) : Nil
      # g_menu_prepend_item: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_prepend_item(self, item)

      # Return value handling
    end

    # Convenience function for prepending a section menu item to the start
    # of @menu.  Combine g_menu_item_new_section() and g_menu_insert_item() for
    # a more flexible alternative.
    def prepend_section(label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_prepend_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_prepend_section(self, label, section)

      # Return value handling
    end

    # Convenience function for prepending a submenu menu item to the start
    # of @menu.  Combine g_menu_item_new_submenu() and g_menu_insert_item() for
    # a more flexible alternative.
    def prepend_submenu(label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_prepend_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_prepend_submenu(self, label, submenu)

      # Return value handling
    end

    # Removes an item from the menu.
    #
    # @position gives the index of the item to remove.
    #
    # It is an error if position is not in range the range from 0 to one
    # less than the number of items in the menu.
    #
    # It is not possible to remove items by identity since items are added
    # to the menu simply by copying their links and attributes (ie:
    # identity of the item itself is not preserved).
    def remove(position : Int32) : Nil
      # g_menu_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_remove(self, position)

      # Return value handling
    end

    # Removes all items in the menu.
    def remove_all : Nil
      # g_menu_remove_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_menu_remove_all(self)

      # Return value handling
    end
  end
end
