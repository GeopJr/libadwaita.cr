require "./event_controller"

module Gtk
  # `GtkDropTarget` is an event controller to receive Drag-and-Drop operations.
  #
  # The most basic way to use a `GtkDropTarget` to receive drops on a
  # widget is to create it via [ctor@Gtk.DropTarget.new], passing in the
  # `GType` of the data you want to receive and connect to the
  # [signal@Gtk.DropTarget::drop] signal to receive the data:
  #
  # ```c
  # static gboolean
  # on_drop (GtkDropTarget *target,
  #          const GValue  *value,
  #          double         x,
  #          double         y,
  #          gpointer       data)
  # {
  #   MyWidget *self = data;
  #
  #   // Call the appropriate setter depending on the type of data
  #   // that we received
  #   if (G_VALUE_HOLDS (value, G_TYPE_FILE))
  #     my_widget_set_file (self, g_value_get_object (value));
  #   else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
  #     my_widget_set_pixbuf (self, g_value_get_object (value));
  #   else
  #     return FALSE;
  #
  #   return TRUE;
  # }
  #
  # static void
  # my_widget_init (MyWidget *self)
  # {
  #   GtkDropTarget *target =
  #     gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
  #
  #   // This widget accepts two types of drop types: GFile objects
  #   // and GdkPixbuf objects
  #   gtk_drop_target_set_gtypes (target, (GTypes [2]) {
  #     G_TYPE_FILE,
  #     GDK_TYPE_PIXBUF,
  #   }, 2);
  #
  #   gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
  # }
  # ```
  #
  # `GtkDropTarget` supports more options, such as:
  #
  #  * rejecting potential drops via the [signal@Gtk.DropTarget::accept] signal
  #    and the [method@Gtk.DropTarget.reject] function to let other drop
  #    targets handle the drop
  #  * tracking an ongoing drag operation before the drop via the
  #    [signal@Gtk.DropTarget::enter], [signal@Gtk.DropTarget::motion] and
  #    [signal@Gtk.DropTarget::leave] signals
  #  * configuring how to receive data by setting the
  #    [property@Gtk.DropTarget:preload] property and listening for its
  #    availability via the [property@Gtk.DropTarget:value] property
  #
  # However, `GtkDropTarget` is ultimately modeled in a synchronous way
  # and only supports data transferred via `GType`. If you want full control
  # over an ongoing drop, the [class@Gtk.DropTargetAsync] object gives you
  # this ability.
  #
  # While a pointer is dragged over the drop target's widget and the drop
  # has not been rejected, that widget will receive the
  # %GTK_STATE_FLAG_DROP_ACTIVE state, which can be used to style the widget.
  #
  # If you are not interested in receiving the drop, but just want to update
  # UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
  # use [class@Gtk.DropControllerMotion].
  class DropTarget < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, actions : Gdk::DragAction? = nil, current_drop : Gdk::Drop? = nil, formats : Gdk::ContentFormats? = nil, name : ::String? = nil, preload : Bool? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, value : GObject::Value? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if actions
        (_names.to_unsafe + _n).value = "actions".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, actions)
        _n += 1
      end
      if current_drop
        (_names.to_unsafe + _n).value = "current-drop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_drop)
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
      if preload
        (_names.to_unsafe + _n).value = "preload".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, preload)
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
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DropTarget.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drop_target_get_type
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

    def current_drop : Gdk::Drop?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "current-drop", pointerof(value), Pointer(Void).null)
      Gdk::Drop.new(value, GICrystal::Transfer::None) unless value.null?
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

    def preload=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "preload", unsafe_value, Pointer(Void).null)
      value
    end

    def preload? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "preload", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def value : GObject::Value?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      GObject::Value.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(type : UInt64, actions : Gdk::DragAction)
      # gtk_drop_target_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_new(type, actions)

      # Return value handling
      @pointer = _retval
    end

    def actions : Gdk::DragAction
      # gtk_drop_target_get_actions: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_actions(self)

      # Return value handling
      Gdk::DragAction.from_value(_retval)
    end

    def current_drop : Gdk::Drop?
      # gtk_drop_target_get_current_drop: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_current_drop(self)

      # Return value handling
      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def drop : Gdk::Drop?
      # gtk_drop_target_get_drop: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_drop(self)

      # Return value handling
      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def formats : Gdk::ContentFormats?
      # gtk_drop_target_get_formats: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_formats(self)

      # Return value handling
      Gdk::ContentFormats.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def gtypes : Enumerable(UInt64)?
      # gtk_drop_target_get_gtypes: (Method)
      # @n_types: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_types element-type Gtype)

      # Handle parameters
      n_types = 0_u64

      # C call
      _retval = LibGtk.gtk_drop_target_get_gtypes(self, pointerof(n_types))

      # Return value handling
      GICrystal.transfer_array(_retval, n_types, GICrystal::Transfer::None) unless _retval.null?
    end

    def preload : Bool
      # gtk_drop_target_get_preload: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_preload(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def value : GObject::Value?
      # gtk_drop_target_get_value: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_drop_target_get_value(self)

      # Return value handling
      GObject::Value.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def reject : Nil
      # gtk_drop_target_reject: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_drop_target_reject(self)

      # Return value handling
    end

    def actions=(actions : Gdk::DragAction) : Nil
      # gtk_drop_target_set_actions: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_drop_target_set_actions(self, actions)

      # Return value handling
    end

    def set_gtypes(types : Enumerable(UInt64)?) : Nil
      # gtk_drop_target_set_gtypes: (Method)
      # @types: (nullable) (array length=n_types element-type Gtype)
      # Returns: (transfer none)

      # Handle parameters
      n_types = types.try(&.size) || 0
      types = if types.nil?
                Pointer(UInt64).null
              else
                types.to_a.to_unsafe
              end

      # C call
      LibGtk.gtk_drop_target_set_gtypes(self, types, n_types)

      # Return value handling
    end

    def set_gtypes(*types : UInt64)
      set_gtypes(types)
    end

    def preload=(preload : Bool) : Nil
      # gtk_drop_target_set_preload: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_drop_target_set_preload(self, preload)

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

      def connect(block : Proc(Gtk::DropTarget, Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Gdk::Drop, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTarget, Gdk::Drop, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Drop.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Gdk::Drop, Bool)).unbox(box).call(sender, arg0).to_unsafe
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

      def connect(&block : Proc(GObject::Value, Float64, Float64, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(GObject::Value, Float64, Float64, Bool))
        connect(block)
      end

      def connect(block : Proc(GObject::Value, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = GObject::Value.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(GObject::Value, Float64, Float64, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::Value, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = GObject::Value.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(GObject::Value, Float64, Float64, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GObject::Value.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GObject::Value.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::DropTarget, GObject::Value, Float64, Float64, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : _, x : Float64, y : Float64) : Nil
        value = GObject::Value.new(value) unless value.is_a?(GObject::Value)
        LibGObject.g_signal_emit_by_name(@source, "drop", value, x, y)
      end
    end

    def drop_signal
      DropSignal.new(self)
    end

    struct EnterSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter::#{@detail}" : "enter"
      end

      def connect(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter", x, y)
      end
    end

    def enter_signal
      EnterSignal.new(self)
    end

    struct LeaveSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave::#{@detail}" : "leave"
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

      def connect(block : Proc(Gtk::DropTarget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTarget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::DropTarget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave")
      end
    end

    def leave_signal
      LeaveSignal.new(self)
    end

    struct MotionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "motion::#{@detail}" : "motion"
      end

      def connect(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Gdk::DragAction))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Gdk::DragAction)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::DropTarget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DropTarget, Float64, Float64, Gdk::DragAction)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "motion", x, y)
      end
    end

    def motion_signal
      MotionSignal.new(self)
    end
  end
end
