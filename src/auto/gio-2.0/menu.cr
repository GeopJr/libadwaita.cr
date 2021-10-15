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
  class Menu < MenuModel
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_get_type
    end

    def initialize
      # g_menu_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_new
      @pointer = _retval
    end

    def append(label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_append: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end
      detailed_action = if detailed_action.nil?
                          Pointer(LibC::Char).null
                        else
                          detailed_action.to_unsafe
                        end

      LibGio.g_menu_append(self, label, detailed_action)
    end

    def append_item(item : Gio::MenuItem) : Nil
      # g_menu_append_item: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_append_item(self, item)
    end

    def append_section(label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_append_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_append_section(self, label, section)
    end

    def append_submenu(label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_append_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_append_submenu(self, label, submenu)
    end

    def freeze : Nil
      # g_menu_freeze: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_freeze(self)
    end

    def insert(position : Int32, label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_insert: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end
      detailed_action = if detailed_action.nil?
                          Pointer(LibC::Char).null
                        else
                          detailed_action.to_unsafe
                        end

      LibGio.g_menu_insert(self, position, label, detailed_action)
    end

    def insert_item(position : Int32, item : Gio::MenuItem) : Nil
      # g_menu_insert_item: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_insert_item(self, position, item)
    end

    def insert_section(position : Int32, label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_insert_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_insert_section(self, position, label, section)
    end

    def insert_submenu(position : Int32, label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_insert_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_insert_submenu(self, position, label, submenu)
    end

    def prepend(label : ::String?, detailed_action : ::String?) : Nil
      # g_menu_prepend: (Method)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end
      detailed_action = if detailed_action.nil?
                          Pointer(LibC::Char).null
                        else
                          detailed_action.to_unsafe
                        end

      LibGio.g_menu_prepend(self, label, detailed_action)
    end

    def prepend_item(item : Gio::MenuItem) : Nil
      # g_menu_prepend_item: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_prepend_item(self, item)
    end

    def prepend_section(label : ::String?, section : Gio::MenuModel) : Nil
      # g_menu_prepend_section: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_prepend_section(self, label, section)
    end

    def prepend_submenu(label : ::String?, submenu : Gio::MenuModel) : Nil
      # g_menu_prepend_submenu: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_prepend_submenu(self, label, submenu)
    end

    def remove(position : Int32) : Nil
      # g_menu_remove: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_remove(self, position)
    end

    def remove_all : Nil
      # g_menu_remove_all: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_remove_all(self)
    end
  end
end
