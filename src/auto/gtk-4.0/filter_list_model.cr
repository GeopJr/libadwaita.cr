require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkFilterListModel` is a list model that filters the elements of
  # the underlying model according to a `GtkFilter`.
  #
  # It hides some elements from the other model according to
  # criteria given by a `GtkFilter`.
  #
  # The model can be set up to do incremental searching, so that
  # filtering long lists doesn't block the UI. See
  # `Gtk::FilterListModel#incremental=` for details.
  @[GObject::GeneratedWrapper]
  class FilterListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::FilterListModelClass), class_init,
        sizeof(LibGtk::FilterListModel), instance_init, 0)
    end

    GICrystal.define_new_method(FilterListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FilterListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, filter : Gtk::Filter? = nil, incremental : Bool? = nil, model : Gio::ListModel? = nil, pending : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !filter.nil?
        (_names.to_unsafe + _n).value = "filter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filter)
        _n += 1
      end
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

      @pointer = LibGObject.g_object_new_with_properties(FilterListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_filter_list_model_get_type
    end

    def filter=(value : Gtk::Filter?) : Gtk::Filter?
      unsafe_value = value

      LibGObject.g_object_set(self, "filter", unsafe_value, Pointer(Void).null)
      value
    end

    def filter : Gtk::Filter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "filter", pointerof(value), Pointer(Void).null)
      Gtk::Filter.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new `GtkFilterListModel` that will filter @model using the given
    # @filter.
    def initialize(model : Gio::ListModel?, filter : Gtk::Filter?)
      # gtk_filter_list_model_new: (Constructor)
      # @model: (transfer full) (nullable)
      # @filter: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end
      # Generator::NullableArrayPlan
      filter = if filter.nil?
                 Pointer(Void).null
               else
                 filter.to_unsafe
               end
      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(filter)
      # C call
      _retval = LibGtk.gtk_filter_list_model_new(model, filter)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the `GtkFilter` currently set on @self.
    def filter : Gtk::Filter?
      # gtk_filter_list_model_get_filter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_list_model_get_filter(@pointer)

      # Return value handling

      Gtk::Filter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether incremental filtering is enabled.
    #
    # See `Gtk::FilterListModel#incremental=`.
    def incremental : Bool
      # gtk_filter_list_model_get_incremental: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_list_model_get_incremental(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the model currently filtered or %NULL if none.
    def model : Gio::ListModel?
      # gtk_filter_list_model_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_list_model_get_model(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the number of items that have not been filtered yet.
    #
    # You can use this value to check if @self is busy filtering by
    # comparing the return value to 0 or you can compute the percentage
    # of the filter remaining by dividing the return value by the total
    # number of items in the underlying model:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # pending = gtk_filter_list_model_get_pending (self);
    # model = gtk_filter_list_model_get_model (self);
    # percentage = pending / (double) g_list_model_get_n_items (model);
    # ```
    #
    # If no filter operation is ongoing - in particular when
    # `Gtk::FilterListModel#incremental` is %FALSE - this
    # function returns 0.
    def pending : UInt32
      # gtk_filter_list_model_get_pending: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_list_model_get_pending(@pointer)

      # Return value handling

      _retval
    end

    # Sets the filter used to filter items.
    def filter=(filter : Gtk::Filter?) : Nil
      # gtk_filter_list_model_set_filter: (Method | Setter)
      # @filter: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      filter = if filter.nil?
                 Pointer(Void).null
               else
                 filter.to_unsafe
               end

      # C call
      LibGtk.gtk_filter_list_model_set_filter(@pointer, filter)

      # Return value handling
    end

    # Sets the filter model to do an incremental sort.
    #
    # When incremental filtering is enabled, the `GtkFilterListModel` will not
    # run filters immediately, but will instead queue an idle handler that
    # incrementally filters the items and adds them to the list. This of course
    # means that items are not instantly added to the list, but only appear
    # incrementally.
    #
    # When your filter blocks the UI while filtering, you might consider
    # turning this on. Depending on your model and filters, this may become
    # interesting around 10,000 to 100,000 items.
    #
    # By default, incremental filtering is disabled.
    #
    # See `Gtk::FilterListModel#pending` for progress information
    # about an ongoing incremental filtering operation.
    def incremental=(incremental : Bool) : Nil
      # gtk_filter_list_model_set_incremental: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_filter_list_model_set_incremental(@pointer, incremental)

      # Return value handling
    end

    # Sets the model to be filtered.
    #
    # Note that GTK makes no effort to ensure that @model conforms to
    # the item type of @self. It assumes that the caller knows what they
    # are doing and have set up an appropriate filter to ensure that item
    # types match.
    def model=(model : Gio::ListModel?) : Nil
      # gtk_filter_list_model_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_filter_list_model_set_model(@pointer, model)

      # Return value handling
    end
  end
end
