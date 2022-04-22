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
      LibGtk.gtk_cell_editable_editing_done(self)

      # Return value handling
    end

    def remove_widget : Nil
      # gtk_cell_editable_remove_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_editable_remove_widget(self)

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
      LibGtk.gtk_cell_editable_start_editing(self, event)

      # Return value handling
    end

    struct EditingDoneSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "editing-done::#{@detail}" : "editing-done"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellEditable__Impl.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellEditable__Impl.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "editing-done")
      end
    end

    def editing_done_signal
      EditingDoneSignal.new(self)
    end

    struct RemoveWidgetSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "remove-widget::#{@detail}" : "remove-widget"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellEditable__Impl.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellEditable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellEditable__Impl.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellEditable, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
  class CellEditable__Impl < GObject::Object
    include CellEditable

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
