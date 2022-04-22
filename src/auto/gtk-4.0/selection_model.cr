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

      # C call
      _retval = LibGtk.gtk_selection_model_get_selection(self)

      # Return value handling

      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def selection_in_range(position : UInt32, n_items : UInt32) : Gtk::Bitset
      # gtk_selection_model_get_selection_in_range: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_selection_model_get_selection_in_range(self, position, n_items)

      # Return value handling

      Gtk::Bitset.new(_retval, GICrystal::Transfer::Full)
    end

    def is_selected(position : UInt32) : Bool
      # gtk_selection_model_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_is_selected(self, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_all : Bool
      # gtk_selection_model_select_all: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_all(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_item(position : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_item: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_item(self, position, unselect_rest)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def select_range(position : UInt32, n_items : UInt32, unselect_rest : Bool) : Bool
      # gtk_selection_model_select_range: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_select_range(self, position, n_items, unselect_rest)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def selection_changed(position : UInt32, n_items : UInt32) : Nil
      # gtk_selection_model_selection_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_selection_model_selection_changed(self, position, n_items)

      # Return value handling
    end

    def set_selection(selected : Gtk::Bitset, mask : Gtk::Bitset) : Bool
      # gtk_selection_model_set_selection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_set_selection(self, selected, mask)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_all : Bool
      # gtk_selection_model_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_all(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_item(position : UInt32) : Bool
      # gtk_selection_model_unselect_item: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_item(self, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def unselect_range(position : UInt32, n_items : UInt32) : Bool
      # gtk_selection_model_unselect_range: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_selection_model_unselect_range(self, position, n_items)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct SelectionChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "selection-changed::#{@detail}" : "selection-changed"
      end

      def connect(&block : Proc(UInt32, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(UInt32, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(UInt32, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SelectionModel, UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::SelectionModel__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::SelectionModel, UInt32, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SelectionModel, UInt32, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::SelectionModel__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::SelectionModel, UInt32, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
  class SelectionModel__Impl < GObject::Object
    include SelectionModel

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
