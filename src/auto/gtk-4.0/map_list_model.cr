require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # A `GtkMapListModel` maps the items in a list model to different items.
  #
  # `GtkMapListModel` uses a [callback@Gtk.MapListModelMapFunc].
  #
  # Example: Create a list of `GtkEventControllers`
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
  # controllers = gtk_map_list_model_new (G_TYPE_LIST_MODEL,
  #                                       widgets,
  #                                       map_to_controllers,
  #                                       NULL, NULL);
  #
  # model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
  #                                     controllers);
  # ```
  #
  # `GtkMapListModel` will attempt to discard the mapped objects as soon as
  # they are no longer needed and recreate them if necessary.
  class MapListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, has_map : Bool? = nil, model : Gio::ListModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if has_map
        (_names.to_unsafe + _n).value = "has-map".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_map)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MapListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_map_list_model_get_type
    end

    def model=(value : ListModel?) : ListModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(model : Gio::ListModel?, map_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void))
      # gtk_map_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @map_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      map_func = if map_func.nil?
                   LibGtk::MapListModelMapFunc.null
                 else
                   map_func.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      LibGObject.g_object_ref(model)

      _retval = LibGtk.gtk_map_list_model_new(model, map_func, user_data, user_destroy)
      @pointer = _retval
    end

    def model : Gio::ListModel?
      # gtk_map_list_model_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_map_list_model_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_map : Bool
      # gtk_map_list_model_has_map: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_map_list_model_has_map(self)
      GICrystal.to_bool(_retval)
    end

    def set_map_func(map_func : Pointer(Void)?, user_data : Pointer(Nil)?, user_destroy : Pointer(Void)) : Nil
      # gtk_map_list_model_set_map_func: (Method)
      # @map_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      map_func = if map_func.nil?
                   LibGtk::MapListModelMapFunc.null
                 else
                   map_func.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGtk.gtk_map_list_model_set_map_func(self, map_func, user_data, user_destroy)
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_map_list_model_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_map_list_model_set_model(self, model)
    end
  end
end
