require "./event_controller"

module Gtk
  # `GtkEventControllerLegacy` is an event controller that provides raw
  # access to the event stream.
  #
  # It should only be used as a last resort if none of the other event
  # controllers or gestures do the job.
  @[GObject::GeneratedWrapper]
  class EventControllerLegacy < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerLegacyClass), class_init,
        sizeof(LibGtk::EventControllerLegacy), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

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

      @pointer = LibGObject.g_object_new_with_properties(EventControllerLegacy.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_legacy_get_type
    end

    # Creates a new legacy event controller.
    def initialize
      # gtk_event_controller_legacy_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_event_controller_legacy_new

      # Return value handling

      @pointer = _retval
    end

    # Emitted for each GDK event delivered to @controller.
    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerLegacy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EventControllerLegacy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gdk::Event) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
