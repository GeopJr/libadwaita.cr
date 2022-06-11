module Gtk
  # `GtkSelectionModel` is an interface that add support for selection to list models.
  #
  # This support is then used by widgets using list models to add the ability
  # to select and unselect various items.
  #
  # GTK provides default implementations of the most common selection modes such
  # as `Gtk#SingleSelection`, so you will only need to implement this
  # interface if you want detailed control about how selections should be handled.
  #
  # A `GtkSelectionModel` supports a single boolean per item indicating if an item is
  # selected or not. This can be queried via `Gtk::SelectionModel#is_selected?`.
  # When the selected state of one or more items changes, the model will emit the
  # [signal@Gtk.SelectionModel::selection-changed] signal by calling the
  # `Gtk::SelectionModel#selection_changed` function. The positions given
  # in that signal may have their selection state changed, though that is not a
  # requirement. If new items added to the model via the
  # [signal@Gio.ListModel::items-changed] signal are selected or not is up to the
  # implementation.
  #
  # Note that items added via [signal@Gio.ListModel::items-changed] may already
  # be selected and no [signal@Gtk.SelectionModel::selection-changed] will be
  # emitted for them. So to track which items are selected, it is necessary to
  # listen to both signals.
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

      # C call
      _retval = LibGtk.gtk_selection_model_get_selection(@pointer)

      # Return value handling

      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def selection_in_range(position : UInt32, n_items : UInt32) : Gtk::Bitset
      # gtk_selection_model_get_selection_in_range: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_selection_model_get_selection_in_range(@pointer, position, n_items)

      # Return value handling

      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def is_selected(position : UInt32) : Bool
      # gtk_selection_model_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_is_selected(@pointer, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_all : Bool
      # gtk_selection_model_select_all: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_all(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_item(position : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_item: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_item(@pointer, position, unselect_rest)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_range(position : UInt32, n_items : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_range: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_range(@pointer, position, n_items, unselect_rest)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def selection_changed(position : UInt32, n_items : UInt32) : Nil
      # gtk_selection_model_selection_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_selection_model_selection_changed(@pointer, position, n_items)

      # Return value handling
    end

    def set_selection(selected : Gtk::Bitset, mask : Gtk::Bitset) : Bool
      # gtk_selection_model_set_selection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_set_selection(@pointer, selected, mask)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_all : Bool
      # gtk_selection_model_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_all(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_item(position : UInt32) : Bool
      # gtk_selection_model_unselect_item: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_item(@pointer, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_range(position : UInt32, n_items : UInt32) : Bool
      # gtk_selection_model_unselect_range: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_range(@pointer, position, n_items)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct SelectionChangedSignal < GObject::Signal
      def name : String
        @detail ? "selection-changed::#{@detail}" : "selection-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_n_items : UInt32, _lib_box : Pointer(Void)) {
          position = lib_position
          n_items = lib_n_items
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(_lib_box).call(position, n_items)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::SelectionModel, UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_n_items : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractSelectionModel.new(_lib_sender, GICrystal::Transfer::None)
          position = lib_position
          n_items = lib_n_items
          ::Box(Proc(Gtk::SelectionModel, UInt32, UInt32, Nil)).unbox(_lib_box).call(_sender, position, n_items)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(position : UInt32, n_items : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "selection-changed", position, n_items)
      end
    end

    def selection_changed_signal
      SelectionChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractSelectionModel < GObject::Object
    include SelectionModel

    GICrystal.define_new_method(Gtk::AbstractSelectionModel, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
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
