module Gtk
  # Interface for widgets that can be used for editing cells
  #
  # The `GtkCellEditable` interface must be implemented for widgets to be usable
  # to edit the contents of a `GtkTreeView` cell. It provides a way to specify how
  # temporary widgets should be configured for editing, get the new value, etc.
  module CellEditable
    def editing_canceled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editing-canceled", unsafe_value, Pointer(Void).null)
      value
    end

    def editing_canceled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editing-canceled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editing_done : Nil
      # gtk_cell_editable_editing_done: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_editable_editing_done(@pointer)

      # Return value handling
    end

    def remove_widget : Nil
      # gtk_cell_editable_remove_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_editable_remove_widget(@pointer)

      # Return value handling
    end

    def start_editing(event : Gdk::Event?) : Nil
      # gtk_cell_editable_start_editing: (Method)
      # @event: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      event = if event.nil?
                Pointer(Void).null
              else
                event.to_unsafe
              end

      # C call
      LibGtk.gtk_cell_editable_start_editing(@pointer, event)

      # Return value handling
    end

    struct EditingDoneSignal < GObject::Signal
      def name : String
        @detail ? "editing-done::#{@detail}" : "editing-done"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::CellEditable, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractCellEditable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "editing-done")
      end
    end

    def editing_done_signal
      EditingDoneSignal.new(self)
    end

    struct RemoveWidgetSignal < GObject::Signal
      def name : String
        @detail ? "remove-widget::#{@detail}" : "remove-widget"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::CellEditable, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractCellEditable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "remove-widget")
      end
    end

    def remove_widget_signal
      RemoveWidgetSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractCellEditable < GObject::Object
    include CellEditable

    GICrystal.define_new_method(Gtk::AbstractCellEditable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_editable_get_type
    end

    # Cast a `GObject::Object` to `CellEditable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to CellEditable")
    end

    # Cast a `GObject::Object` to `CellEditable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
