require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkTreeListModel` is a list model that can create child models on demand.
  @[GObject::GeneratedWrapper]
  class TreeListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeListModelClass), class_init,
        sizeof(LibGtk::TreeListModel), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, autoexpand : Bool? = nil, model : Gio::ListModel? = nil, passthrough : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !autoexpand.nil?
        (_names.to_unsafe + _n).value = "autoexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autoexpand)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !passthrough.nil?
        (_names.to_unsafe + _n).value = "passthrough".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, passthrough)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new empty `GtkTreeListModel` displaying @root
    # with all rows collapsed.
    def initialize(root : Gio::ListModel, passthrough : Bool, autoexpand : Bool, create_func : Gtk::TreeListModelCreateModelFunc)
      # gtk_tree_list_model_new: (Constructor)
      # @root: (transfer full)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if create_func
        _box = ::Box.box(create_func)
        create_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::GObjectArgPlan
          item = GObject::Object.new(lib_item, :none)
          user_data = lib_user_data
          ::Box(Proc(GObject::Object, Gio::ListModel)).unbox(user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        create_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_tree_list_model_new(root, passthrough, autoexpand, create_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets whether the model is set to automatically expand new rows
    # that get added.
    #
    # This can be either rows added by changes to the underlying
    # models or via `Gtk::TreeListRow#expanded=`.
    def autoexpand : Bool
      # gtk_tree_list_model_get_autoexpand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_model_get_autoexpand(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the row item corresponding to the child at index @position for
    # @self's root model.
    #
    # If @position is greater than the number of children in the root model,
    # %NULL is returned.
    #
    # Do not confuse this function with `Gtk::TreeListModel#row`.
    def child_row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_model_get_child_row: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_list_model_get_child_row(self, position)

      # Return value handling

      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the root model that @self was created with.
    def model : Gio::ListModel
      # gtk_tree_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_model_get_model(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether the model is passing through original row items.
    #
    # If this function returns %FALSE, the `GListModel` functions for @self
    # return custom `GtkTreeListRow` objects. You need to call
    # `Gtk::TreeListRow#item` on these objects to get the original
    # item.
    #
    # If %TRUE, the values of the child models are passed through in their
    # original state. You then need to call `Gtk::TreeListModel#row`
    # to get the custom `GtkTreeListRow`s.
    def passthrough : Bool
      # gtk_tree_list_model_get_passthrough: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_model_get_passthrough(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the row object for the given row.
    #
    # If @position is greater than the number of items in @self,
    # %NULL is returned.
    #
    # The row object can be used to expand and collapse rows as
    # well as to inspect its position in the tree. See its
    # documentation for details.
    #
    # This row object is persistent and will refer to the current
    # item as long as the row is present in @self, independent of
    # other rows being added or removed.
    #
    # If @self is set to not be passthrough, this function is
    # equivalent to calling g_list_model_get_item().
    #
    # Do not confuse this function with `Gtk::TreeListModel#child_row`.
    def row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_model_get_row: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_list_model_get_row(self, position)

      # Return value handling

      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets whether the model should autoexpand.
    #
    # If set to %TRUE, the model will recursively expand all rows that
    # get added to the model. This can be either rows added by changes
    # to the underlying models or via `Gtk::TreeListRow#expanded=`.
    def autoexpand=(autoexpand : Bool) : Nil
      # gtk_tree_list_model_set_autoexpand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_list_model_set_autoexpand(self, autoexpand)

      # Return value handling
    end
  end
end
