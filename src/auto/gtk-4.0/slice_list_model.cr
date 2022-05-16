require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkSliceListModel` is a list model that presents a slice of another model.
  #
  # This is useful when implementing paging by setting the size to the number
  # of elements per page and updating the offset whenever a different page is
  # opened.
  @[GObject::GeneratedWrapper]
  class SliceListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SliceListModelClass), class_init,
        sizeof(LibGtk::SliceListModel), instance_init, 0)
    end

    GICrystal.define_new_method(SliceListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SliceListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gio::ListModel? = nil, offset : UInt32? = nil, size : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !offset.nil?
        (_names.to_unsafe + _n).value = "offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, offset)
        _n += 1
      end
      if !size.nil?
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SliceListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_slice_list_model_get_type
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

    def offset=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "offset", unsafe_value, Pointer(Void).null)
      value
    end

    def offset : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "offset", pointerof(value), Pointer(Void).null)
      value
    end

    def size=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "size", unsafe_value, Pointer(Void).null)
      value
    end

    def size : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "size", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new slice model.
    #
    # It presents the slice from @offset to offset + @size
    # of the given @model.
    def initialize(model : Gio::ListModel?, offset : UInt32, size : UInt32)
      # gtk_slice_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_slice_list_model_new(model, offset, size)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the model that is currently being used or %NULL if none.
    def model : Gio::ListModel?
      # gtk_slice_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_slice_list_model_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the offset set via gtk_slice_list_model_set_offset().
    def offset : UInt32
      # gtk_slice_list_model_get_offset: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_slice_list_model_get_offset(@pointer)

      # Return value handling

      _retval
    end

    # Gets the size set via gtk_slice_list_model_set_size().
    def size : UInt32
      # gtk_slice_list_model_get_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_slice_list_model_get_size(@pointer)

      # Return value handling

      _retval
    end

    # Sets the model to show a slice of.
    #
    # The model's item type must conform to @self's item type.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_slice_list_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_slice_list_model_set_model(@pointer, model)

      # Return value handling
    end

    # Sets the offset into the original model for this slice.
    #
    # If the offset is too large for the sliced model,
    # @self will end up empty.
    def offset=(offset : UInt32) : Nil
      # gtk_slice_list_model_set_offset: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_slice_list_model_set_offset(@pointer, offset)

      # Return value handling
    end

    # Sets the maximum size. @self will never have more items
    # than @size.
    #
    # It can however have fewer items if the offset is too large
    # or the model sliced from doesn't have enough items.
    def size=(size : UInt32) : Nil
      # gtk_slice_list_model_set_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_slice_list_model_set_size(@pointer, size)

      # Return value handling
    end
  end
end
