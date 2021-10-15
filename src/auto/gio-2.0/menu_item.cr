require "../g_object-2.0/object"

module Gio
  # #GMenuItem is an opaque structure type.  You must access it using the
  # functions below.
  class MenuItem < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_item_get_type
    end

    def initialize(label : ::String?, detailed_action : ::String?)
      # g_menu_item_new: (Constructor)
      # @label: (nullable)
      # @detailed_action: (nullable)
      # Returns: (transfer full)

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

      _retval = LibGio.g_menu_item_new(label, detailed_action)
      @pointer = _retval
    end

    def self.new_from_model(model : Gio::MenuModel, item_index : Int32) : Gio::MenuItem
      # g_menu_item_new_from_model: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_item_new_from_model(model, item_index)
      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_section(label : ::String?, section : Gio::MenuModel) : Gio::MenuItem
      # g_menu_item_new_section: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      _retval = LibGio.g_menu_item_new_section(label, section)
      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_submenu(label : ::String?, submenu : Gio::MenuModel) : Gio::MenuItem
      # g_menu_item_new_submenu: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      _retval = LibGio.g_menu_item_new_submenu(label, submenu)
      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    def attribute_value(attribute : ::String, expected_type : GLib::VariantType?) : GLib::Variant?
      # g_menu_item_get_attribute_value: (Method)
      # @expected_type: (nullable)
      # Returns: (transfer full)

      expected_type = if expected_type.nil?
                        Pointer(Void).null
                      else
                        expected_type.to_unsafe
                      end

      _retval = LibGio.g_menu_item_get_attribute_value(self, attribute, expected_type)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def link(link : ::String) : Gio::MenuModel?
      # g_menu_item_get_link: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_item_get_link(self, link)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def set_action_and_target_value(action : ::String?, target_value : _?) : Nil
      # g_menu_item_set_action_and_target_value: (Method)
      # @action: (nullable)
      # @target_value: (nullable)
      # Returns: (transfer none)

      action = if action.nil?
                 Pointer(LibC::Char).null
               else
                 action.to_unsafe
               end
      target_value = if target_value.nil?
                       Pointer(Void).null
                     else
                       target_value.to_unsafe
                     end
      target_value = GLib::Variant.new(target_value) unless target_value.is_a?(GLib::Variant)

      LibGio.g_menu_item_set_action_and_target_value(self, action, target_value)
    end

    def set_attribute_value(attribute : ::String, value : _?) : Nil
      # g_menu_item_set_attribute_value: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(Void).null
              else
                value.to_unsafe
              end
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      LibGio.g_menu_item_set_attribute_value(self, attribute, value)
    end

    def detailed_action=(detailed_action : ::String) : Nil
      # g_menu_item_set_detailed_action: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_item_set_detailed_action(self, detailed_action)
    end

    def icon=(icon : Gio::Icon) : Nil
      # g_menu_item_set_icon: (Method)
      # Returns: (transfer none)

      LibGio.g_menu_item_set_icon(self, icon)
    end

    def label=(label : ::String?) : Nil
      # g_menu_item_set_label: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGio.g_menu_item_set_label(self, label)
    end

    def set_link(link : ::String, model : Gio::MenuModel?) : Nil
      # g_menu_item_set_link: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGio.g_menu_item_set_link(self, link, model)
    end

    def section=(section : Gio::MenuModel?) : Nil
      # g_menu_item_set_section: (Method)
      # @section: (nullable)
      # Returns: (transfer none)

      section = if section.nil?
                  Pointer(Void).null
                else
                  section.to_unsafe
                end

      LibGio.g_menu_item_set_section(self, section)
    end

    def submenu=(submenu : Gio::MenuModel?) : Nil
      # g_menu_item_set_submenu: (Method)
      # @submenu: (nullable)
      # Returns: (transfer none)

      submenu = if submenu.nil?
                  Pointer(Void).null
                else
                  submenu.to_unsafe
                end

      LibGio.g_menu_item_set_submenu(self, submenu)
    end
  end
end
