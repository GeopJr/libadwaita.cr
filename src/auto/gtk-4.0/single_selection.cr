require "../g_object-2.0/object"
require "../gio-2.0/list_model"

require "./selection_model"

module Gtk
  # `GtkSingleSelection` is a `GtkSelectionModel` that allows selecting a single
  # item.
  #
  # Note that the selection is *persistent* -- if the selected item is removed
  # and re-added in the same ::items-changed emission, it stays selected.
  # In particular, this means that changing the sort order of an underlying sort
  # model will preserve the selection.
  class SingleSelection < GObject::Object
    include Gio::ListModel
    include SelectionModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, autoselect : Bool? = nil, can_unselect : Bool? = nil, model : Gio::ListModel? = nil, selected : UInt32? = nil, selected_item : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if autoselect
        (_names.to_unsafe + _n).value = "autoselect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autoselect)
        _n += 1
      end
      if can_unselect
        (_names.to_unsafe + _n).value = "can-unselect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_unselect)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if selected
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end
      if selected_item
        (_names.to_unsafe + _n).value = "selected-item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_item)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SingleSelection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_single_selection_get_type
    end

    def autoselect=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autoselect", unsafe_value, Pointer(Void).null)
      value
    end

    def autoselect? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autoselect", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_unselect=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-unselect", unsafe_value, Pointer(Void).null)
      value
    end

    def can_unselect? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-unselect", pointerof(value), Pointer(Void).null)
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

    def selected=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "selected", unsafe_value, Pointer(Void).null)
      value
    end

    def selected : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "selected", pointerof(value), Pointer(Void).null)
      value
    end

    def selected_item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "selected-item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(model : Gio::ListModel?)
      # gtk_single_selection_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      LibGObject.g_object_ref(model)

      _retval = LibGtk.gtk_single_selection_new(model)
      @pointer = _retval
    end

    def autoselect : Bool
      # gtk_single_selection_get_autoselect: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_single_selection_get_autoselect(self)
      GICrystal.to_bool(_retval)
    end

    def can_unselect : Bool
      # gtk_single_selection_get_can_unselect: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_single_selection_get_can_unselect(self)
      GICrystal.to_bool(_retval)
    end

    def model : Gio::ListModel
      # gtk_single_selection_get_model: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_single_selection_get_model(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def selected : UInt32
      # gtk_single_selection_get_selected: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_single_selection_get_selected(self)
      _retval
    end

    def selected_item : GObject::Object?
      # gtk_single_selection_get_selected_item: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_single_selection_get_selected_item(self)
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def autoselect=(autoselect : Bool) : Nil
      # gtk_single_selection_set_autoselect: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_single_selection_set_autoselect(self, autoselect)
    end

    def can_unselect=(can_unselect : Bool) : Nil
      # gtk_single_selection_set_can_unselect: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_single_selection_set_can_unselect(self, can_unselect)
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_single_selection_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_single_selection_set_model(self, model)
    end

    def selected=(position : UInt32) : Nil
      # gtk_single_selection_set_selected: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_single_selection_set_selected(self, position)
    end
  end
end
