require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkTreeListModel` is a list model that can create child models on demand.
  class TreeListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, autoexpand : Bool? = nil, model : Gio::ListModel? = nil, passthrough : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if autoexpand
        (_names.to_unsafe + _n).value = "autoexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autoexpand)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if passthrough
        (_names.to_unsafe + _n).value = "passthrough".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, passthrough)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_list_model_get_type
    end

    def autoexpand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autoexpand", unsafe_value, Pointer(Void).null)
      value
    end

    def autoexpand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autoexpand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def model : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def passthrough=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "passthrough", unsafe_value, Pointer(Void).null)
      value
    end

    def passthrough? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "passthrough", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(root : Gio::ListModel, passthrough : Bool, autoexpand : Bool, create_func : Pointer(Void), user_data : Pointer(Nil)?, user_destroy : Pointer(Void))
      # gtk_tree_list_model_new: (Constructor)
      # @root: (transfer full)
      # @user_data: (nullable)
      # Returns: (transfer full)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      LibGObject.g_object_ref(root)

      _retval = LibGtk.gtk_tree_list_model_new(root, passthrough, autoexpand, create_func, user_data, user_destroy)
      @pointer = _retval
    end

    def autoexpand : Bool
      # gtk_tree_list_model_get_autoexpand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_model_get_autoexpand(self)
      GICrystal.to_bool(_retval)
    end

    def child_row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_model_get_child_row: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_list_model_get_child_row(self, position)
      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def model : Gio::ListModel
      # gtk_tree_list_model_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_model_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def passthrough : Bool
      # gtk_tree_list_model_get_passthrough: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_model_get_passthrough(self)
      GICrystal.to_bool(_retval)
    end

    def row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_model_get_row: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_list_model_get_row(self, position)
      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def autoexpand=(autoexpand : Bool) : Nil
      # gtk_tree_list_model_set_autoexpand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_list_model_set_autoexpand(self, autoexpand)
    end
  end
end
