require "./event_controller"

module Gtk
  # `GtkDropTargetAsync` is an event controller to receive Drag-and-Drop
  # operations, asynchronously.
  #
  # It is the more complete but also more complex method of handling drop
  # operations compared to [class@Gtk.DropTarget], and you should only use
  # it if `GtkDropTarget` doesn't provide all the features you need.
  #
  # To use a `GtkDropTargetAsync` to receive drops on a widget, you create
  # a `GtkDropTargetAsync` object, configure which data formats and actions
  # you support, connect to its signals, and then attach it to the widget
  # with [method@Gtk.Widget.add_controller].
  #
  # During a drag operation, the first signal that a `GtkDropTargetAsync`
  # emits is [signal@Gtk.DropTargetAsync::accept], which is meant to determine
  # whether the target is a possible drop site for the ongoing drop. The
  # default handler for the ::accept signal accepts the drop if it finds
  # a compatible data format and an action that is supported on both sides.
  #
  # If it is, and the widget becomes a target, you will receive a
  # [signal@Gtk.DropTargetAsync::drag-enter] signal, followed by
  # [signal@Gtk.DropTargetAsync::drag-motion] signals as the pointer moves,
  # optionally a [signal@Gtk.DropTargetAsync::drop] signal when a drop happens,
  # and finally a [signal@Gtk.DropTargetAsync::drag-leave] signal when the
  # pointer moves off the widget.
  #
  # The ::drag-enter and ::drag-motion handler return a `GdkDragAction`
  # to update the status of the ongoing operation. The ::drop handler
  # should decide if it ultimately accepts the drop and if it does, it
  # should initiate the data transfer and finish the operation by calling
  # [method@Gdk.Drop.finish].
  #
  # Between the ::drag-enter and ::drag-leave signals the widget is a
  # current drop target, and will receive the %GTK_STATE_FLAG_DROP_ACTIVE
  # state, which can be used by themes to style the widget as a drop target.
  class DropTargetAsync < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, formats : Gdk::ContentFormats? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if actions
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if formats
        (_names.to_unsafe + _n).value = "formats".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, formats)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DropTargetAsync.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_target_async_get_type
    end

    def actions=(value : Gdk::DragAction) : Gdk::DragAction
      unsafe_value = value

      LibGObject.g_object_set(self, "actions", unsafe_value, Pointer(Void).null)
      value
    end

    def actions : Gdk::DragAction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "actions", pointerof(value), Pointer(Void).null)
      Gdk::DragAction.from_value(value)
    end

    def formats=(value : Gdk::ContentFormats?) : Gdk::ContentFormats?
      unsafe_value = value

      LibGObject.g_object_set(self, "formats", unsafe_value, Pointer(Void).null)
      value
    end

    def formats : Gdk::ContentFormats?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "formats", pointerof(value), Pointer(Void).null)
      Gdk::ContentFormats.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(formats : Gdk::ContentFormats?, actions : Gdk::DragAction)
      # gtk_drop_target_async_new: (Constructor)
      # @formats: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      formats = if formats.nil?
                  Pointer(Void).null
                else
                  formats.to_unsafe
                end
      LibGObject.g_object_ref(formats)

      # C call
      _retval = LibGtk.gtk_drop_target_async_new(formats, actions)

      # Return value handling
      @pointer = _retval
    end

    def actions : Gdk::DragAction
      # gtk_drop_target_async_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_async_get_actions(self)

      # Return value handling
      Gdk::DragAction.from_value(_retval)
    end

    def formats : Gdk::ContentFormats?
      # gtk_drop_target_async_get_formats: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_async_get_formats(self)

      # Return value handling
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def reject_drop(drop : Gdk::Drop) : Nil
      # gtk_drop_target_async_reject_drop: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_drop_target_async_reject_drop(self, drop)

      # Return value handling
    end

    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drop_target_async_set_actions: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_drop_target_async_set_actions(self, actions)

      # Return value handling
    end

    def formats=(formats : Gdk::ContentFormats?) : Nil
      # gtk_drop_target_async_set_formats: (Method | Setter)
      # @formats: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      formats = if formats.nil?
                  Pointer(Void).null
                else
                  formats.to_unsafe
                end

      # C call
      LibGtk.gtk_drop_target_async_set_formats(self, formats)

      # Return value handling
    end

    struct AcceptSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "accept::#{@detail}" : "accept"
      end

      def connect(&block : Proc(Gdk::Drop, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drop, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drop, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop) : Nil
        LibGObject.g_signal_emit_by_name(@source, "accept", drop)
      end
    end

    def accept_signal
      AcceptSignal.new(self)
    end

    struct DragEnterSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-enter::#{@detail}" : "drag-enter"
      end

      def connect(&block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-enter", drop, x, y)
      end
    end

    def drag_enter_signal
      DragEnterSignal.new(self)
    end

    struct DragLeaveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-leave::#{@detail}" : "drag-leave"
      end

      def connect(&block : Proc(Gdk::Drop, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drop, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drop, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drop, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Drop, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-leave", drop)
      end
    end

    def drag_leave_signal
      DragLeaveSignal.new(self)
    end

    struct DragMotionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drag-motion::#{@detail}" : "drag-motion"
      end

      def connect(&block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drag-motion", drop, x, y)
      end
    end

    def drag_motion_signal
      DragMotionSignal.new(self)
    end

    struct DropSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drop::#{@detail}" : "drop"
      end

      def connect(&block : Proc(Gdk::Drop, Float64, Float64, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Drop, Float64, Float64, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Drop, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Drop, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gdk::Drop, Float64, Float64, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTargetAsync.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTargetAsync, Gdk::Drop, Float64, Float64, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drop : Gdk::Drop, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drop", drop, x, y)
      end
    end

    def drop_signal
      DropSignal.new(self)
    end
  end
end
