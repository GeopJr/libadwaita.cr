require "../g_object-2.0/object"
require "../gio-2.0/list_model"

require "./selection_model"

module Gtk
  # `GtkMultiSelection` is a `GtkSelectionModel` that allows selecting multiple
  # elements.
  class MultiSelection < GObject::Object
    include Gio::ListModel
    include SelectionModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gio::ListModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MultiSelection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_selection_get_type
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

    def initialize(model : Gio::ListModel?)
      # gtk_multi_selection_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      LibGObject.g_object_ref(model)

      # C call
      _retval = LibGtk.gtk_multi_selection_new(model)

      # Return value handling
      @pointer = _retval
    end

    def model : Gio::ListModel
      # gtk_multi_selection_get_model: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_multi_selection_get_model(self)

      # Return value handling
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_multi_selection_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_multi_selection_set_model(self, model)

      # Return value handling
    end
  end
end
