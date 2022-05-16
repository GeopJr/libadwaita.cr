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
  @[GObject::GeneratedWrapper]
  class SingleSelection < GObject::Object
    include Gio::ListModel
    include SelectionModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SingleSelectionClass), class_init,
        sizeof(LibGtk::SingleSelection), instance_init, 0)
    end

    GICrystal.define_new_method(SingleSelection, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SingleSelection`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, autoselect : Bool? = nil, can_unselect : Bool? = nil, model : Gio::ListModel? = nil, selected : UInt32? = nil, selected_item : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !autoselect.nil?
        (_names.to_unsafe + _n).value = "autoselect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autoselect)
        _n += 1
      end
      if !can_unselect.nil?
        (_names.to_unsafe + _n).value = "can-unselect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_unselect)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !selected.nil?
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end
      if !selected_item.nil?
        (_names.to_unsafe + _n).value = "selected-item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_item)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SingleSelection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new selection to handle @model.
    def initialize(model : Gio::ListModel?)
      # gtk_single_selection_new: (Constructor)
      # @model: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_single_selection_new(model)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Checks if autoselect has been enabled or disabled via
    # gtk_single_selection_set_autoselect().
    def autoselect : Bool
      # gtk_single_selection_get_autoselect: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_single_selection_get_autoselect(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # If %TRUE, gtk_selection_model_unselect_item() is supported and allows
    # unselecting the selected item.
    def can_unselect : Bool
      # gtk_single_selection_get_can_unselect: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_single_selection_get_can_unselect(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the model that @self is wrapping.
    def model : Gio::ListModel?
      # gtk_single_selection_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_single_selection_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the position of the selected item.
    #
    # If no item is selected, %GTK_INVALID_LIST_POSITION is returned.
    def selected : UInt32
      # gtk_single_selection_get_selected: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_single_selection_get_selected(@pointer)

      # Return value handling

      _retval
    end

    # Gets the selected item.
    #
    # If no item is selected, %NULL is returned.
    def selected_item : GObject::Object?
      # gtk_single_selection_get_selected_item: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_single_selection_get_selected_item(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Enables or disables autoselect.
    #
    # If @autoselect is %TRUE, @self will enforce that an item is always
    # selected. It will select a new item when the currently selected
    # item is deleted and it will disallow unselecting the current item.
    def autoselect=(autoselect : Bool) : Nil
      # gtk_single_selection_set_autoselect: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_single_selection_set_autoselect(@pointer, autoselect)

      # Return value handling
    end

    # If %TRUE, unselecting the current item via
    # gtk_selection_model_unselect_item() is supported.
    #
    # Note that setting `Gtk::SingleSelection#autoselect` will
    # cause unselecting to not work, so it practically makes no sense
    # to set both at the same time the same time.
    def can_unselect=(can_unselect : Bool) : Nil
      # gtk_single_selection_set_can_unselect: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_single_selection_set_can_unselect(@pointer, can_unselect)

      # Return value handling
    end

    # Sets the model that @self should wrap.
    #
    # If @model is %NULL, @self will be empty.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_single_selection_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_single_selection_set_model(@pointer, model)

      # Return value handling
    end

    # Selects the item at the given position.
    #
    # If the list does not have an item at @position or
    # %GTK_INVALID_LIST_POSITION is given, the behavior depends on the
    # value of the `Gtk::SingleSelection#autoselect` property:
    # If it is set, no change will occur and the old item will stay
    # selected. If it is unset, the selection will be unset and no item
    # will be selected.
    def selected=(position : UInt32) : Nil
      # gtk_single_selection_set_selected: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_single_selection_set_selected(@pointer, position)

      # Return value handling
    end
  end
end
