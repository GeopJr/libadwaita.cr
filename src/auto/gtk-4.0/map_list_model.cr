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

    GICrystal.define_new_method(MapListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MapListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkMapListModel` for the given arguments.
    def self.new(model : Gio::ListModel?, map_func : Gtk::MapListModelMapFunc?) : self
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
      # Generator::CallbackArgPlan
      if map_func
        _box = ::Box.box(map_func)
        map_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::TransferFullArgPlan
          # Generator::BuiltInTypeArgPlan
          item = GObject::Object.new(lib_item, :none)
          ::Box(Proc(GObject::Object, GObject::Object)).unbox(lib_user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        map_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_map_list_model_new(model, map_func, user_data, user_destroy)

      # Return value handling

      Gtk::MapListModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the model that is currently being mapped or %NULL if none.
    def model : Gio::ListModel?
      # gtk_map_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_map_list_model_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks if a map function is currently set on @self.
    def has_map : Bool
      # gtk_map_list_model_has_map: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_map_list_model_has_map(@pointer)

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
    def map_func=(map_func : Gtk::MapListModelMapFunc?) : Nil
      # gtk_map_list_model_set_map_func: (Method)
      # @map_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if map_func
        _box = ::Box.box(map_func)
        map_func = ->(lib_item : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::TransferFullArgPlan
          # Generator::BuiltInTypeArgPlan
          item = GObject::Object.new(lib_item, :none)
          ::Box(Proc(GObject::Object, GObject::Object)).unbox(lib_user_data).call(item)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        map_func = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_map_list_model_set_map_func(@pointer, map_func, user_data, user_destroy)

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
      LibGtk.gtk_map_list_model_set_model(@pointer, model)

      # Return value handling
    end
  end
end
