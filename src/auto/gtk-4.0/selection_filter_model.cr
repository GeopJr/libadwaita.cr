require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkSelectionFilterModel` is a list model that presents the selection from
  # a `GtkSelectionModel`.
  class SelectionFilterModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gtk::SelectionModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SelectionFilterModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_selection_filter_model_get_type
    end

    def initialize(model : Gtk::SelectionModel?)
      # gtk_selection_filter_model_new: (Constructor)
      # @model: (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      _retval = LibGtk.gtk_selection_filter_model_new(model)
      @pointer = _retval
    end

    def model : Gtk::SelectionModel?
      # gtk_selection_filter_model_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_filter_model_get_model(self)
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def model=(model : Gtk::SelectionModel?) : Nil
      # gtk_selection_filter_model_set_model: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_selection_filter_model_set_model(self, model)
    end
  end
end
