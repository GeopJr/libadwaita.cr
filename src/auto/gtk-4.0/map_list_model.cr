require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # A `GtkMapListModel` maps the items in a list model to different items.
  #
  # `GtkMapListModel` uses a `Gtk#MapListModelMapFunc`.
  #
  # Example: Create a list of `GtkEventControllers`
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static gpointer
  # map_to_controllers (gpointer widget,
  #                     gpointer data)
  # {
  #   gpointer result = gtk_widget_observe_controllers (widget);
  #   g_object_unref (widget);
  #   return result;
  # }
  #
  # widgets = gtk_widget_observe_children (widget);
  #
  # controllers = gtk_map_list_model_new (widgets,
  #                                       map_to_controllers,
  #                                       NULL, NULL);
  #
  # model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
  #                                     controllers);
  # ```
  #
  # `GtkMapListModel` will attempt to discard the mapped objects as soon as
  # they are no longer needed and recreate them if necessary.
  @[GObject::GeneratedWrapper]
  class MapListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MapListModelClass), class_init,
        sizeof(LibGtk::MapListModel), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, has_map : Bool? = nil, model : Gio::ListModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !has_map.nil?
        (_names.to_unsafe + _n).value = "has-map".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_map)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MapListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_map_list_model_get_type
    end

    def has_map? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-map", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def model=(value : Gio::ListModel?) : Gio::ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkMapListModel` for the given arguments.
    def initialize(model : Gio::ListModel?, map_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void))
      # gtk_map_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @map_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # Generator::NullableArrayPlan
      map_func = if map_func.nil?
                   LibGtk::MapListModelMapFunc.null
                 else
                   map_func.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_map_list_model_new(model, map_func, user_data, user_destroy)

      # Return value handling

      @pointer = _retval
    end

    # Gets the model that is currently being mapped or %NULL if none.
    def model : Gio::ListModel?
      # gtk_map_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_map_list_model_get_model(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks if a map function is currently set on @self.
    def has_map : Bool
      # gtk_map_list_model_has_map: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_map_list_model_has_map(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the function used to map items.
    #
    # The function will be called whenever an item needs to be mapped
    # and must return the item to use for the given input item.
    #
    # Note that `GtkMapListModel` may call this function multiple times
    # on the same item, because it may delete items it doesn't need anymore.
    #
    # GTK makes no effort to ensure that @map_func conforms to the item type
    # of @self. It assumes that the caller knows what they are doing and the map
    # function returns items of the appropriate type.
    def set_map_func(map_func : Pointer(Void)?, user_data : Pointer(Void)?, user_destroy : Pointer(Void)) : Nil
      # gtk_map_list_model_set_map_func: (Method)
      # @map_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      map_func = if map_func.nil?
                   LibGtk::MapListModelMapFunc.null
                 else
                   map_func.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_map_list_model_set_map_func(self, map_func, user_data, user_destroy)

      # Return value handling
    end

    # Sets the model to be mapped.
    #
    # GTK makes no effort to ensure that @model conforms to the item type
    # expected by the map function. It assumes that the caller knows what
    # they are doing and have set up an appropriate map function.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_map_list_model_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_map_list_model_set_model(self, model)

      # Return value handling
    end
  end
end
