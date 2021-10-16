module Gtk
  # `GtkSelectionModel` is an interface that add support for selection to list models.
  #
  # This support is then used by widgets using list models to add the ability
  # to select and unselect various items.
  #
  # GTK provides default implementations of the most common selection modes such
  # as [class@Gtk.SingleSelection], so you will only need to implement this
  # interface if you want detailed control about how selections should be handled.
  #
  # A `GtkSelectionModel` supports a single boolean per item indicating if an item is
  # selected or not. This can be queried via [method@Gtk.SelectionModel.is_selected].
  # When the selected state of one or more items changes, the model will emit the
  # [signal@Gtk.SelectionModel::selection-changed] signal by calling the
  # [method@Gtk.SelectionModel.selection_changed] function. The positions given
  # in that signal may have their selection state changed, though that is not a
  # requirement. If new items added to the model via the ::items-changed signal
  # are selected or not is up to the implementation.
  #
  # Note that items added via ::items-changed may already be selected and no
  # [Gtk.SelectionModel::selection-changed] will be emitted for them. So to
  # track which items are selected, it is necessary to listen to both signals.
  #
  # Additionally, the interface can expose functionality to select and unselect
  # items. If these functions are implemented, GTK's list widgets will allow users
  # to select and unselect items. However, `GtkSelectionModel`s are free to only
  # implement them partially or not at all. In that case the widgets will not
  # support the unimplemented operations.
  #
  # When selecting or unselecting is supported by a model, the return values of
  # the selection functions do *not* indicate if selection or unselection happened.
  # They are only meant to indicate complete failure, like when this mode of
  # selecting is not supported by the model.
  #
  # Selections may happen asynchronously, so the only reliable way to find out
  # when an item was selected is to listen to the signals that indicate selection.
  module SelectionModel
    def selection : Gtk::Bitset
      # gtk_selection_model_get_selection: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_selection_model_get_selection(self)
      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def selection_in_range(position : UInt32, n_items : UInt32) : Gtk::Bitset
      # gtk_selection_model_get_selection_in_range: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_selection_model_get_selection_in_range(self, position, n_items)
      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def is_selected(position : UInt32) : Bool
      # gtk_selection_model_is_selected: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_is_selected(self, position)
      GICrystal.to_bool(_retval)
    end

    def select_all : Bool
      # gtk_selection_model_select_all: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_select_all(self)
      GICrystal.to_bool(_retval)
    end

    def select_item(position : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_item: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_select_item(self, position, unselect_rest)
      GICrystal.to_bool(_retval)
    end

    def select_range(position : UInt32, n_items : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_range: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_select_range(self, position, n_items, unselect_rest)
      GICrystal.to_bool(_retval)
    end

    def selection_changed(position : UInt32, n_items : UInt32) : Nil
      # gtk_selection_model_selection_changed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_selection_model_selection_changed(self, position, n_items)
    end

    def set_selection(selected : Gtk::Bitset, mask : Gtk::Bitset) : Bool
      # gtk_selection_model_set_selection: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_set_selection(self, selected, mask)
      GICrystal.to_bool(_retval)
    end

    def unselect_all : Bool
      # gtk_selection_model_unselect_all: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_unselect_all(self)
      GICrystal.to_bool(_retval)
    end

    def unselect_item(position : UInt32) : Bool
      # gtk_selection_model_unselect_item: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_unselect_item(self, position)
      GICrystal.to_bool(_retval)
    end

    def unselect_range(position : UInt32, n_items : UInt32) : Bool
      # gtk_selection_model_unselect_range: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_selection_model_unselect_range(self, position, n_items)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class SelectionModel__Impl
    include SelectionModel

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_selection_model_get_type
    end

    # Cast a `GObject::Object` to `SelectionModel`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to SelectionModel")
    end

    # Cast a `GObject::Object` to `SelectionModel`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
