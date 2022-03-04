require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # A `GListModel` that sorts the elements of an underlying model
  # according to a `GtkSorter`.
  #
  # The model can be set up to do incremental sorting, so that
  # sorting long lists doesn't block the UI. See
  # [method@Gtk.SortListModel.set_incremental] for details.
  #
  # `GtkSortListModel` is a generic model and because of that it
  # cannot take advantage of any external knowledge when sorting.
  # If you run into performance issues with `GtkSortListModel`,
  # it is strongly recommended that you write your own sorting list
  # model.
  class SortListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, incremental : Bool? = nil, model : Gio::ListModel? = nil, pending : UInt32? = nil, sorter : Gtk::Sorter? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if incremental
        (_names.to_unsafe + _n).value = "incremental".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, incremental)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if pending
        (_names.to_unsafe + _n).value = "pending".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pending)
        _n += 1
      end
      if sorter
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SortListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_sort_list_model_get_type
    end

    def incremental=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "incremental", unsafe_value, Pointer(Void).null)
      value
    end

    def incremental? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "incremental", pointerof(value), Pointer(Void).null)
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

    def pending : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "pending", pointerof(value), Pointer(Void).null)
      value
    end

    def sorter=(value : Gtk::Sorter?) : Gtk::Sorter?
      unsafe_value = value

      LibGObject.g_object_set(self, "sorter", unsafe_value, Pointer(Void).null)
      value
    end

    def sorter : Gtk::Sorter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "sorter", pointerof(value), Pointer(Void).null)
      Gtk::Sorter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(model : Gio::ListModel?, sorter : Gtk::Sorter?)
      # gtk_sort_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @sorter: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end
      LibGObject.g_object_ref(model)
      LibGObject.g_object_ref(sorter)

      # C call
      _retval = LibGtk.gtk_sort_list_model_new(model, sorter)

      # Return value handling
      @pointer = _retval
    end

    def incremental : Bool
      # gtk_sort_list_model_get_incremental: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_incremental(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def model : Gio::ListModel?
      # gtk_sort_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_model(self)

      # Return value handling
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pending : UInt32
      # gtk_sort_list_model_get_pending: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_pending(self)

      # Return value handling
      _retval
    end

    def sorter : Gtk::Sorter?
      # gtk_sort_list_model_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_sorter(self)

      # Return value handling
      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def incremental=(incremental : Bool) : Nil
      # gtk_sort_list_model_set_incremental: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_sort_list_model_set_incremental(self, incremental)

      # Return value handling
    end

    def model=(model : Gio::ListModel?) : Nil
      # gtk_sort_list_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_sort_list_model_set_model(self, model)

      # Return value handling
    end

    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_sort_list_model_set_sorter: (Method | Setter)
      # @sorter: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      # C call
      LibGtk.gtk_sort_list_model_set_sorter(self, sorter)

      # Return value handling
    end
  end
end
