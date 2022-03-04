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

      # Handle parameters
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

      # C call
      _retval = LibGio.g_menu_item_new(label, detailed_action)

      # Return value handling
      @pointer = _retval
    end

    def self.new_from_model(model : Gio::MenuModel, item_index : Int32) : self
      # g_menu_item_new_from_model: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_menu_item_new_from_model(model, item_index)

      # Return value handling
      Gio::MenuItem.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_section(label : ::String?, section : Gio::MenuModel) : self
      # g_menu_item_new_section: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      # Handle parameters
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

    def self.new_submenu(label : ::String?, submenu : Gio::MenuModel) : self
      # g_menu_item_new_submenu: (Constructor)
      # @label: (nullable)
      # Returns: (transfer full)

      # Handle parameters
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

    def attribute_value(attribute : ::String, expected_type : GLib::VariantType?) : GLib::Variant?
      # g_menu_item_get_attribute_value: (Method)
      # @expected_type: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      expected_type = if expected_type.nil?
                        Pointer(Void).null
                      else
                        expected_type.to_unsafe
                      end

      # C call
      _retval = LibGio.g_menu_item_get_attribute_value(self, attribute, expected_type)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def link(link : ::String) : Gio::MenuModel?
      # g_menu_item_get_link: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_menu_item_get_link(self, link)

      # Return value handling
      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def set_action_and_target_value(action : ::String?, target_value : _?) : Nil
      # g_menu_item_set_action_and_target_value: (Method)
      # @action: (nullable)
      # @target_value: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_menu_item_set_action_and_target_value(self, action, target_value)

      # Return value handling
    end

    def set_attribute_value(attribute : ::String, value : _?) : Nil
      # g_menu_item_set_attribute_value: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      value = if value.nil?
                Pointer(Void).null
              else
                value.to_unsafe
              end
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      # C call
      LibGio.g_menu_item_set_attribute_value(self, attribute, value)

      # Return value handling
    end

    def detailed_action=(detailed_action : ::String) : Nil
      # g_menu_item_set_detailed_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_menu_item_set_detailed_action(self, detailed_action)

      # Return value handling
    end

    def icon=(icon : Gio::Icon) : Nil
      # g_menu_item_set_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_menu_item_set_icon(self, icon)

      # Return value handling
    end

    def label=(label : ::String?) : Nil
      # g_menu_item_set_label: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGio.g_menu_item_set_label(self, label)

      # Return value handling
    end

    def set_link(link : ::String, model : Gio::MenuModel?) : Nil
      # g_menu_item_set_link: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGio.g_menu_item_set_link(self, link, model)

      # Return value handling
    end

    def section=(section : Gio::MenuModel?) : Nil
      # g_menu_item_set_section: (Method)
      # @section: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      section = if section.nil?
                  Pointer(Void).null
                else
                  section.to_unsafe
                end

      # C call
      LibGio.g_menu_item_set_section(self, section)

      # Return value handling
    end

    def submenu=(submenu : Gio::MenuModel?) : Nil
      # g_menu_item_set_submenu: (Method)
      # @submenu: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      submenu = if submenu.nil?
                  Pointer(Void).null
                else
                  submenu.to_unsafe
                end

      # C call
      LibGio.g_menu_item_set_submenu(self, submenu)

      # Return value handling
    end
  end
end
