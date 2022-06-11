require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkFlattenListModel` is a list model that concatenates other list models.
  #
  # `GtkFlattenListModel` takes a list model containing list models,
  #  and flattens it into a single model.
  @[GObject::GeneratedWrapper]
  class FlattenListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::FlattenListModelClass), class_init,
        sizeof(LibGtk::FlattenListModel), instance_init, 0)
    end

    GICrystal.define_new_method(FlattenListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FlattenListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gio::ListModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FlattenListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_flatten_list_model_get_type
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

    # Creates a new `GtkFlattenListModel` that flattens @list.
    def self.new(model : Gio::ListModel?) : self
      # gtk_flatten_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_flatten_list_model_new(model)

      # Return value handling

      Gtk::FlattenListModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the model set via gtk_flatten_list_model_set_model().
    def model : Gio::ListModel?
      # gtk_flatten_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flatten_list_model_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the model containing the item at the given position.
    def model_for_item(position : UInt32) : Gio::ListModel?
      # gtk_flatten_list_model_get_model_for_item: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_flatten_list_model_get_model_for_item(@pointer, position)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets a new model to be flattened.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_flatten_list_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_flatten_list_model_set_model(@pointer, model)

      # Return value handling
    end
  end
end
