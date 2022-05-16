require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # A `GListModel` that sorts the elements of an underlying model
  # according to a `GtkSorter`.
  #
  # The model is a stable sort. If two items compare equal according
  # to the sorter, the one that appears first in the original model will
  # also appear first after sorting.
  # Note that if you change the sorter, the previous order will have no
  # influence on the new order. If you want that, consider using a
  # `GtkMultiSorter` and appending the previous sorter to it.
  #
  # The model can be set up to do incremental sorting, so that
  # sorting long lists doesn't block the UI. See
  # `Gtk::SortListModel#incremental=` for details.
  #
  # `GtkSortListModel` is a generic model and because of that it
  # cannot take advantage of any external knowledge when sorting.
  # If you run into performance issues with `GtkSortListModel`,
  # it is strongly recommended that you write your own sorting list
  # model.
  @[GObject::GeneratedWrapper]
  class SortListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SortListModelClass), class_init,
        sizeof(LibGtk::SortListModel), instance_init, 0)
    end

    GICrystal.define_new_method(SortListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SortListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, incremental : Bool? = nil, model : Gio::ListModel? = nil, pending : UInt32? = nil, sorter : Gtk::Sorter? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !incremental.nil?
        (_names.to_unsafe + _n).value = "incremental".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, incremental)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !pending.nil?
        (_names.to_unsafe + _n).value = "pending".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pending)
        _n += 1
      end
      if !sorter.nil?
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SortListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new sort list model that uses the @sorter to sort @model.
    def initialize(model : Gio::ListModel?, sorter : Gtk::Sorter?)
      # gtk_sort_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @sorter: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      # Generator::NullableArrayPlan
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end
      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(sorter)
      # C call
      _retval = LibGtk.gtk_sort_list_model_new(model, sorter)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns whether incremental sorting is enabled.
    #
    # See `Gtk::SortListModel#incremental=`.
    def incremental : Bool
      # gtk_sort_list_model_get_incremental: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_incremental(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the model currently sorted or %NULL if none.
    def model : Gio::ListModel?
      # gtk_sort_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Estimates progress of an ongoing sorting operation.
    #
    # The estimate is the number of items that would still need to be
    # sorted to finish the sorting operation if this was a linear
    # algorithm. So this number is not related to how many items are
    # already correctly sorted.
    #
    # If you want to estimate the progress, you can use code like this:
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # pending = gtk_sort_list_model_get_pending (self);
    # model = gtk_sort_list_model_get_model (self);
    # progress = 1.0 - pending / (double) MAX (1, g_list_model_get_n_items (model));
    # ```
    #
    # If no sort operation is ongoing - in particular when
    # `Gtk::SortListModel#incremental` is %FALSE - this
    # function returns 0.
    def pending : UInt32
      # gtk_sort_list_model_get_pending: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_pending(@pointer)

      # Return value handling

      _retval
    end

    # Gets the sorter that is used to sort @self.
    def sorter : Gtk::Sorter?
      # gtk_sort_list_model_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_sort_list_model_get_sorter(@pointer)

      # Return value handling

      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the sort model to do an incremental sort.
    #
    # When incremental sorting is enabled, the `GtkSortListModel` will not do
    # a complete sort immediately, but will instead queue an idle handler that
    # incrementally sorts the items towards their correct position. This of
    # course means that items do not instantly appear in the right place. It
    # also means that the total sorting time is a lot slower.
    #
    # When your filter blocks the UI while sorting, you might consider
    # turning this on. Depending on your model and sorters, this may become
    # interesting around 10,000 to 100,000 items.
    #
    # By default, incremental sorting is disabled.
    #
    # See `Gtk::SortListModel#pending` for progress information
    # about an ongoing incremental sorting operation.
    def incremental=(incremental : Bool) : Nil
      # gtk_sort_list_model_set_incremental: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_sort_list_model_set_incremental(@pointer, incremental)

      # Return value handling
    end

    # Sets the model to be sorted.
    #
    # The @model's item type must conform to the item type of @self.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_sort_list_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_sort_list_model_set_model(@pointer, model)

      # Return value handling
    end

    # Sets a new sorter on @self.
    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_sort_list_model_set_sorter: (Method | Setter)
      # @sorter: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      # C call
      LibGtk.gtk_sort_list_model_set_sorter(@pointer, sorter)

      # Return value handling
    end
  end
end
