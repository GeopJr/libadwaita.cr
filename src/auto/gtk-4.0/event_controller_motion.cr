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

    GICrystal.define_new_method(EventControllerMotion, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EventControllerMotion`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Returns if a pointer is within @self or one of its children.
    def contains_pointer : Bool
      # gtk_event_controller_motion_contains_pointer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_motion_contains_pointer(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns if a pointer is within @self, but not one of its children.
    def is_pointer? : Bool
      # gtk_event_controller_motion_is_pointer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_motion_is_pointer(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Signals that the pointer has entered the widget.
    struct EnterSignal < GObject::Signal
      def name : String
        @detail ? "enter::#{@detail}" : "enter"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerMotion.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter", x, y)
      end
    end

    def enter_signal
      EnterSignal.new(self)
    end

    # Signals that the pointer has left the widget.
    struct LeaveSignal < GObject::Signal
      def name : String
        @detail ? "leave::#{@detail}" : "leave"
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

      def connect(handler : Proc(Gtk::EventControllerMotion, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerMotion.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerMotion, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave")
      end
    end

    def leave_signal
      LeaveSignal.new(self)
    end

    # Emitted when the pointer moves inside the widget.
    struct MotionSignal < GObject::Signal
      def name : String
        @detail ? "motion::#{@detail}" : "motion"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::EventControllerMotion, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerMotion.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::EventControllerMotion, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
