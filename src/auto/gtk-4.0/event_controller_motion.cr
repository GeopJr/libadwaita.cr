require "./event_controller"

module Gtk
  # `GtkEventControllerMotion` is an event controller tracking the pointer
  # position.
  #
  # The event controller offers `Gtk::EventControllerMotion::#enter`
  # and `Gtk::EventControllerMotion::#leave` signals, as well as
  # [property@Gtk.EventControllerMotion:is-pointer] and
  # [property@Gtk.EventControllerMotion:contains-pointer] properties
  # which are updated to reflect changes in the pointer position as it
  # moves over the widget.
  @[GObject::GeneratedWrapper]
  class EventControllerMotion < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerMotionClass), class_init,
        sizeof(LibGtk::EventControllerMotion), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, contains_pointer : Bool? = nil, is_pointer : Bool? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !contains_pointer.nil?
        (_names.to_unsafe + _n).value = "contains-pointer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, contains_pointer)
        _n += 1
      end
      if !is_pointer.nil?
        (_names.to_unsafe + _n).value = "is-pointer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_pointer)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventControllerMotion.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_motion_get_type
    end

    def contains_pointer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "contains-pointer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_pointer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-pointer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new event controller that will handle motion events.
    def initialize
      # gtk_event_controller_motion_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_event_controller_motion_new

      # Return value handling

      @pointer = _retval
    end

    # Returns if a pointer is within @self or one of its children.
    def contains_pointer : Bool
      # gtk_event_controller_motion_contains_pointer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_motion_contains_pointer(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns if a pointer is within @self, but not one of its children.
    def is_pointer? : Bool
      # gtk_event_controller_motion_is_pointer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_motion_is_pointer(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Signals that the pointer has entered the widget.
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

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
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

    # Signals that the pointer has left the widget.
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

      def connect(block : Proc(Gtk::EventControllerMotion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerMotion, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerMotion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerMotion, Nil)).unbox(box).call(sender)
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

    # Emitted when the pointer moves inside the widget.
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

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Float64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::EventControllerMotion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
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
