require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkSelectionFilterModel` is a list model that presents the selection from
  # a `GtkSelectionModel`.
  @[GObject::GeneratedWrapper]
  class SelectionFilterModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SelectionFilterModelClass), class_init,
        sizeof(LibGtk::SelectionFilterModel), instance_init, 0)
    end

    GICrystal.define_new_method(SelectionFilterModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SelectionFilterModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gtk::SelectionModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SelectionFilterModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_selection_filter_model_get_type
    end

    def model=(value : Gtk::SelectionModel?) : Gtk::SelectionModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::AbstractSelectionModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkSelectionFilterModel` that will include the
    # selected items from the underlying selection model.
    def initialize(model : Gtk::SelectionModel?)
      # gtk_selection_filter_model_new: (Constructor)
      # @model: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_selection_filter_model_new(model)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the model currently filtered or %NULL if none.
    def model : Gtk::SelectionModel?
      # gtk_selection_filter_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_filter_model_get_model(@pointer)

      # Return value handling

      Gtk::AbstractSelectionModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the model to be filtered.
    #
    # Note that GTK makes no effort to ensure that @model conforms to
    # the item type of @self. It assumes that the caller knows what they
    # are doing and have set up an appropriate filter to ensure that item
    # types match.
    def model=(model : Gtk::SelectionModel?) : Nil
      # gtk_selection_filter_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_selection_filter_model_set_model(@pointer, model)

      # Return value handling
    end
  end
end
