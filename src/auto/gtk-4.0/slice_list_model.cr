require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkSliceListModel` is a list model that presents a slice of another model.
  #
  # This is useful when implementing paging by setting the size to the number
  # of elements per page and updating the offset whenever a different page is
  # opened.
  class SliceListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gio::ListModel? = nil, offset : UInt32? = nil, size : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if offset
        (_names.to_unsafe + _n).value = "offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, offset)
        _n += 1
      end
      if size
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SliceListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_slice_list_model_get_type
    end

    def initialize(model : Gio::ListModel?, offset : UInt32, size : UInt32)
      # gtk_slice_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      LibGObject.g_object_ref(model)

      _retval = LibGtk.gtk_slice_list_model_new(model, offset, size)
      @pointer = _retval
    end

    def model : Gio::ListModel?
      # gtk_slice_list_model_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_slice_list_model_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def offset : UInt32
      # gtk_slice_list_model_get_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_slice_list_model_get_offset(self)
      _retval
    end

    def size : UInt32
      # gtk_slice_list_model_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_slice_list_model_get_size(self)
      _retval
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_slice_list_model_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_slice_list_model_set_model(self, model)
    end

    def offset=(offset : UInt32) : Nil
      # gtk_slice_list_model_set_offset: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_slice_list_model_set_offset(self, offset)
    end

    def size=(size : UInt32) : Nil
      # gtk_slice_list_model_set_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_slice_list_model_set_size(self, size)
    end
  end
end
